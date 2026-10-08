#!/usr/bin/env python3
import unittest

from derive_memread_params import derive_layers


class MemReadHostParameterTests(unittest.TestCase):
    def test_active_host_table_and_memread_totals(self):
        layers = derive_layers()
        self.assertEqual(len(layers), 22)
        self.assertEqual(layers[0]["group_num_mul_win_size"], 223590)
        self.assertEqual(layers[0]["weight_dim3"], 16)
        self.assertEqual(layers[0]["win_size"], 3)
        self.assertEqual(layers[21]["group_num_x"], 5)
        self.assertEqual(layers[21]["group_num_y"], 17)
        self.assertEqual(layers[21]["weight_dim4_div_lane"], 1)
        self.assertEqual(layers[21]["win_size"], 16)
        self.assertEqual(layers[21]["group_num_mul_win_size"], 1392)
        self.assertEqual(layers[21]["out_num"], 578)
        self.assertEqual(layers[21]["q_vec"], 4)
        self.assertEqual(layers[21]["rem_size_x"], 1)
        self.assertEqual(layers[21]["scal"], 2)
        self.assertEqual(layers[21]["dim_z_edge_num"], 578)
        self.assertTrue(all(row["group_num_mul_win_size"] < 2**32 for row in layers))

    def test_first_layer_channel_padding_and_fc_flag(self):
        layers = derive_layers()
        self.assertEqual(layers[0]["data_dim1"], 548)
        self.assertEqual(layers[0]["weight_dim3"], 16)
        self.assertFalse(layers[0]["fc_en"])
        self.assertTrue(layers[21]["fc_en"])


if __name__ == "__main__":
    unittest.main()
