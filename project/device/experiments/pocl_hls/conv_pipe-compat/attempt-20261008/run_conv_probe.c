#define CL_TARGET_OPENCL_VERSION 300
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

#include <CL/cl.h>
#include <CL/cl_ext.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static char *read_file(const char *path, size_t *length) {
  FILE *file = fopen(path, "rb");
  if (!file) {
    perror(path);
    return NULL;
  }
  if (fseek(file, 0, SEEK_END) != 0) {
    perror("fseek");
    fclose(file);
    return NULL;
  }
  long size = ftell(file);
  if (size < 0 || fseek(file, 0, SEEK_SET) != 0) {
    perror("ftell/fseek");
    fclose(file);
    return NULL;
  }
  char *data = malloc((size_t)size + 1);
  if (!data) {
    fclose(file);
    return NULL;
  }
  *length = fread(data, 1, (size_t)size, file);
  fclose(file);
  data[*length] = '\0';
  return data;
}

static int check(cl_int status, const char *operation) {
  if (status == CL_SUCCESS)
    return 1;
  fprintf(stderr, "%s failed with OpenCL error %d\n", operation, status);
  return 0;
}

int main(int argc, char **argv) {
  const char *source_path = argc > 1 ? argv[1] : "conv_pipe.cl";
  size_t source_length = 0;
  char *source = read_file(source_path, &source_length);
  if (!source)
    return 2;

  cl_int status = CL_SUCCESS;
  cl_uint platform_count = 0;
  if (!check(clGetPlatformIDs(0, NULL, &platform_count), "clGetPlatformIDs"))
    return 2;
  if (platform_count == 0) {
    fprintf(stderr, "PoCL exposed no OpenCL platform\n");
    return 2;
  }

  cl_platform_id *platforms = calloc(platform_count, sizeof(*platforms));
  if (!platforms ||
      !check(clGetPlatformIDs(platform_count, platforms, NULL),
             "clGetPlatformIDs(list)"))
    return 2;

  cl_platform_id platform = platforms[0];
  free(platforms);
  cl_uint device_count = 0;
  if (!check(clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL, 0, NULL,
                            &device_count),
             "clGetDeviceIDs(count)"))
    return 2;
  cl_device_id *devices = calloc(device_count, sizeof(*devices));
  if (!devices ||
      !check(clGetDeviceIDs(platform, CL_DEVICE_TYPE_ALL, device_count,
                            devices, NULL),
             "clGetDeviceIDs(list)"))
    return 2;
  cl_device_id device = devices[0];
  free(devices);

  char device_name[256] = {0};
  clGetDeviceInfo(device, CL_DEVICE_NAME, sizeof(device_name), device_name,
                  NULL);
  cl_device_type device_type = 0;
  clGetDeviceInfo(device, CL_DEVICE_TYPE, sizeof(device_type), &device_type,
                  NULL);
  printf("OpenCL device: %s (type 0x%llx)\n", device_name,
         (unsigned long long)device_type);

  cl_context context = clCreateContext(NULL, 1, &device, NULL, NULL, &status);
  if (!check(status, "clCreateContext"))
    return 2;
  cl_command_queue queue =
      clCreateCommandQueueWithProperties(context, device, NULL, &status);
  if (!check(status, "clCreateCommandQueueWithProperties"))
    return 2;

  const char *sources[] = {source};
  cl_program program =
      clCreateProgramWithSource(context, 1, sources, &source_length, &status);
  free(source);
  if (!check(status, "clCreateProgramWithSource"))
    return 2;
  status = clBuildProgram(program, 1, &device, "-cl-kernel-arg-info -I /sim/tarsio/PipeCNN_Winograd/project/device -I /sim/tarsio/PipeCNN_Winograd/project/device/RTL", NULL, NULL);
  if (!check(status, "clBuildProgram")) {
    size_t log_size = 0;
    clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, 0, NULL,
                          &log_size);
    char *log = calloc(log_size + 1, 1);
    if (log) {
      clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, log_size,
                            log, NULL);
      fprintf(stderr, "%s\n", log);
      free(log);
    }
    return 2;
  }

  cl_kernel kernel = clCreateKernel(program, "memWrite", &status);
  if (!check(status, "clCreateKernel(memWrite)"))
    return 2;
  cl_uint arg_count = 0;
  if (!check(clGetKernelInfo(kernel, CL_KERNEL_NUM_ARGS, sizeof(arg_count), &arg_count, NULL), "clGetKernelInfo(NUM_ARGS)"))
    return 2;
  cl_mem scratch = clCreateBuffer(context, CL_MEM_READ_WRITE, 4096, NULL, &status);
  if (!check(status, "clCreateBuffer(scratch)"))
    return 2;
  for (cl_uint i = 0; i < arg_count; ++i) {
    cl_kernel_arg_address_qualifier address = CL_KERNEL_ARG_ADDRESS_PRIVATE;
    clGetKernelArgInfo(kernel, i, CL_KERNEL_ARG_ADDRESS_QUALIFIER, sizeof(address), &address, NULL);
    if (address == CL_KERNEL_ARG_ADDRESS_GLOBAL) {
      status = clSetKernelArg(kernel, i, sizeof(scratch), &scratch);
    } else {
      char type_name[128] = {0};
      clGetKernelArgInfo(kernel, i, CL_KERNEL_ARG_TYPE_NAME, sizeof(type_name), type_name, NULL);
      size_t arg_size = 4;
      if (strstr(type_name, "uchar") || strstr(type_name, "char")) arg_size = 1;
      else if (strstr(type_name, "ushort") || strstr(type_name, "short")) arg_size = 2;
      unsigned long long zero = 0;
      status = clSetKernelArg(kernel, i, arg_size, &zero);
    }
    if (!check(status, "clSetKernelArg")) return 2;
  }

  void *(*get_extension)(cl_platform_id, const char *) =
      clGetExtensionFunctionAddressForPlatform;
  clCreateCommandBufferKHR_fn create_command_buffer =
      (clCreateCommandBufferKHR_fn)get_extension(platform,
                                                  "clCreateCommandBufferKHR");
  clCommandNDRangeKernelKHR_fn command_ndrange =
      (clCommandNDRangeKernelKHR_fn)get_extension(platform,
                                                  "clCommandNDRangeKernelKHR");
  clFinalizeCommandBufferKHR_fn finalize_command_buffer =
      (clFinalizeCommandBufferKHR_fn)get_extension(
          platform, "clFinalizeCommandBufferKHR");
  clReleaseCommandBufferKHR_fn release_command_buffer =
      (clReleaseCommandBufferKHR_fn)get_extension(
          platform, "clReleaseCommandBufferKHR");
  if (!create_command_buffer || !command_ndrange ||
      !finalize_command_buffer || !release_command_buffer) {
    fprintf(stderr, "PoCL did not expose cl_khr_command_buffer entry points\n");
    return 2;
  }

  cl_command_buffer_khr command_buffer =
      create_command_buffer(1, &queue, NULL, &status);
  if (!check(status, "clCreateCommandBufferKHR"))
    return 2;
  const size_t global_size = 1;
  const size_t local_size = 1;
  status = command_ndrange(command_buffer, queue, NULL, kernel, 1, NULL,
                           &global_size, &local_size, 0, NULL, NULL, NULL);
  if (!check(status, "clCommandNDRangeKernelKHR"))
    return 2;

  puts("Finalizing command buffer to trigger PoCL-HLS; no command is enqueued.");
  status = finalize_command_buffer(command_buffer);
  if (!check(status, "clFinalizeCommandBufferKHR"))
    return 2;

  puts("PoCL command-buffer finalization returned successfully.");
  release_command_buffer(command_buffer);
  clReleaseMemObject(scratch);
  clReleaseKernel(kernel);
  clReleaseProgram(program);
  clReleaseCommandQueue(queue);
  clReleaseContext(context);
  return 0;
}
