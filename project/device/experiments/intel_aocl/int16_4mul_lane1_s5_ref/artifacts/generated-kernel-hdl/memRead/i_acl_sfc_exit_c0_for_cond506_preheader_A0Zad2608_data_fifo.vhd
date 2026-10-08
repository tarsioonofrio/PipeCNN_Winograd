-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2608_data_fifo
-- VHDL created on Thu Oct  8 10:49:42 2026


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2608_data_fifo is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_3 : in std_logic_vector(7 downto 0);  -- ufix8
        in_data_in_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_9 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_10 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_11 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_12 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_13 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_14 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_15 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_16 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_17 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_18 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_19 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_20 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_21 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_22 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_23 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_24 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_25 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_26 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_27 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_28 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_29 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_30 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_31 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_32 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_33 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_34 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_35 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_36 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_37 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_38 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_39 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_40 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_41 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_42 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_43 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_44 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_45 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_46 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_47 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_48 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_49 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_50 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_51 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_52 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_53 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_54 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_55 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_56 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_57 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_58 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_59 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_60 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_61 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_62 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_63 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_64 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_65 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_66 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_67 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_68 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_69 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_70 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_71 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_72 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_73 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_74 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_75 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_76 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_77 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_78 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_79 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_80 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_81 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_82 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_83 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_84 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_85 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_86 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_87 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_88 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_89 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_90 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_91 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_92 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_93 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_94 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_95 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_96 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_97 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_98 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_99 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_100 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_101 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_102 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_103 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_104 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_105 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_106 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_107 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_108 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_109 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_110 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_111 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_112 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_113 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_114 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_115 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_116 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_117 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_118 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_119 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_120 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_121 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_122 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_123 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_124 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_125 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_126 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_127 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_128 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_129 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_130 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_131 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_132 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_133 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_134 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_135 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_136 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_137 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_138 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_139 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_140 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_141 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_142 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_143 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_144 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_145 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_146 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_147 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_148 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_149 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_150 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_151 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_152 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_153 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_154 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_155 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_156 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_157 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_158 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_159 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_160 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_161 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_162 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_163 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_164 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_165 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_166 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_167 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_168 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_169 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_170 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_171 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_172 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_173 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_174 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_175 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_176 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_177 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_178 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_179 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_180 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_181 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_182 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_183 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_184 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_185 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_186 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_187 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_188 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_189 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_190 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_191 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_192 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_193 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_194 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_195 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_196 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_197 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_198 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_199 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_200 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_201 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_202 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_203 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_204 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_205 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_206 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_207 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_208 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_209 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_210 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_211 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_212 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_213 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_214 : in std_logic_vector(15 downto 0);  -- ufix16
        in_data_in_215 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_3 : out std_logic_vector(7 downto 0);  -- ufix8
        out_data_out_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_9 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_10 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_11 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_12 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_13 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_14 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_15 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_16 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_17 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_18 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_19 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_20 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_21 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_22 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_23 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_24 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_25 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_26 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_27 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_28 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_29 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_30 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_31 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_32 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_33 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_34 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_35 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_36 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_37 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_38 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_39 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_40 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_41 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_42 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_43 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_44 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_45 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_46 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_47 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_48 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_49 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_50 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_51 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_52 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_53 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_54 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_55 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_56 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_57 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_58 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_59 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_60 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_61 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_62 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_63 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_64 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_65 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_66 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_67 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_68 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_69 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_70 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_71 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_72 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_73 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_74 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_75 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_76 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_77 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_78 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_79 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_80 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_81 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_82 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_83 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_84 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_85 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_86 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_87 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_88 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_89 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_90 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_91 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_92 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_93 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_94 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_95 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_96 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_97 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_98 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_99 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_100 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_101 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_102 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_103 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_104 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_105 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_106 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_107 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_108 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_109 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_110 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_111 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_112 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_113 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_114 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_115 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_116 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_117 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_118 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_119 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_120 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_121 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_122 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_123 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_124 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_125 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_126 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_127 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_128 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_129 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_130 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_131 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_132 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_133 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_134 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_135 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_136 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_137 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_138 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_139 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_140 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_141 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_142 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_143 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_144 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_145 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_146 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_147 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_148 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_149 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_150 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_151 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_152 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_153 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_154 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_155 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_156 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_157 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_158 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_159 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_160 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_161 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_162 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_163 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_164 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_165 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_166 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_167 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_168 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_169 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_170 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_171 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_172 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_173 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_174 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_175 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_176 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_177 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_178 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_179 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_180 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_181 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_182 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_183 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_184 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_185 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_186 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_187 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_188 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_189 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_190 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_191 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_192 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_193 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_194 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_195 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_196 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_197 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_198 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_199 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_200 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_201 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_202 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_203 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_204 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_205 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_206 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_207 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_208 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_209 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_210 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_211 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_212 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_213 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_214 : out std_logic_vector(15 downto 0);  -- ufix16
        out_data_out_215 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2608_data_fifo;

architecture normal of i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2608_data_fifo is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DEPTH : INTEGER;
            ALLOW_FULL_WRITE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 3488;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(3487 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(3487 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i7_0gr_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dupName_0_c_i8_0gr_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_3_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_4_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_4_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_4_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_5_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_6_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_7_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_7_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_7_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_8_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_8_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_8_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_9_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_9_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_9_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_9_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_10_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_10_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_10_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_10_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_11_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_11_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_11_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_11_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_12_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_12_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_12_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_12_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_12_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_13_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_13_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_13_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_13_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_13_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_14_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_14_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_15_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_15_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_16_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_16_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_17_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_17_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_18_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_18_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_19_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_19_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_20_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_20_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_21_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_21_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_22_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_22_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_23_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_23_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_24_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_24_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_25_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_25_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_26_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_26_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_27_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_27_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_28_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_28_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_29_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_29_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_30_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_30_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_31_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_31_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_32_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_32_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_33_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_33_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_34_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_34_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_35_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_35_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_36_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_36_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_37_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_37_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_38_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_38_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_39_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_39_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_40_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_40_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_41_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_41_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_42_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_42_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_43_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_43_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_44_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_44_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_45_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_45_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_46_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_46_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_47_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_47_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_48_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_48_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_49_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_49_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_50_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_50_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_51_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_51_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_52_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_52_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_53_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_53_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_54_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_54_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_55_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_55_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_56_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_56_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_57_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_57_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_58_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_58_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_59_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_59_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_60_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_60_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_61_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_61_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_62_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_62_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_63_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_63_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_64_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_64_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_65_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_65_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_66_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_66_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_67_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_67_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_68_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_68_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_69_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_69_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_70_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_70_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_71_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_71_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_72_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_72_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_73_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_73_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_74_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_74_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_75_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_75_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_76_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_76_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_77_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_77_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_78_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_78_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_79_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_79_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_80_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_80_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_81_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_81_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_82_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_82_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_83_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_83_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_84_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_84_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_85_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_85_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_86_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_86_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_87_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_87_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_88_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_88_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_89_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_89_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_90_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_90_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_91_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_91_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_92_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_92_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_93_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_93_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_94_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_94_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_95_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_95_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_96_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_96_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_97_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_97_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_98_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_98_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_99_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_99_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_100_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_100_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_101_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_101_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_102_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_102_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_103_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_103_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_104_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_104_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_105_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_105_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_106_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_106_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_107_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_107_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_108_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_108_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_109_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_109_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_110_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_110_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_111_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_111_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_112_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_112_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_113_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_113_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_114_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_114_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_115_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_115_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_116_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_116_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_117_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_117_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_118_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_118_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_119_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_119_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_120_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_120_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_121_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_121_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_122_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_122_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_123_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_123_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_124_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_124_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_125_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_125_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_126_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_126_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_127_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_127_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_128_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_128_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_129_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_129_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_130_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_130_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_131_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_131_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_132_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_132_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_133_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_133_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_134_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_134_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_135_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_135_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_136_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_136_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_137_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_137_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_138_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_138_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_139_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_139_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_140_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_140_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_141_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_141_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_142_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_142_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_143_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_143_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_144_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_144_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_145_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_145_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_146_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_146_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_147_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_147_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_148_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_148_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_149_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_149_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_150_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_150_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_151_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_151_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_152_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_152_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_153_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_153_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_154_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_154_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_155_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_155_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_156_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_156_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_157_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_157_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_158_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_158_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_159_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_159_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_160_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_160_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_161_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_161_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_162_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_162_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_163_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_163_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_164_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_164_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_165_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_165_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_166_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_166_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_167_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_167_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_168_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_168_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_169_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_169_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_170_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_170_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_171_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_171_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_172_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_172_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_173_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_173_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_174_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_174_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_175_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_175_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_176_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_176_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_177_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_177_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_178_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_178_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_179_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_179_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_180_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_180_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_181_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_181_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_182_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_182_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_183_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_183_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_184_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_184_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_185_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_185_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_186_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_186_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_187_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_187_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_188_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_188_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_189_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_189_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_190_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_190_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_191_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_191_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_192_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_192_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_193_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_193_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_194_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_194_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_195_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_195_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_196_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_196_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_197_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_197_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_198_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_198_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_199_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_199_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_200_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_201_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_202_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_203_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_204_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_205_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_206_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_207_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_208_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_209_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_210_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_211_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_212_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_213_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal dupName_214_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i16_0gr_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i24_0gr_q : STD_LOGIC_VECTOR (23 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (3487 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_in : STD_LOGIC_VECTOR (3487 downto 0);
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out : STD_LOGIC_VECTOR (3487 downto 0);
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_out_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_out_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- c_i24_0gr(CONSTANT,465)
    c_i24_0gr_q <= "000000000000000000000000";

    -- dupName_0_c_i7_0gr_x(CONSTANT,5)
    dupName_0_c_i7_0gr_x_q <= "0000000";

    -- dupName_13_element_extension_x(BITJOIN,73)
    dupName_13_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_215;

    -- dupName_12_element_extension_x(BITJOIN,68)
    dupName_12_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_213;

    -- dupName_11_element_extension_x(BITJOIN,63)
    dupName_11_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_212;

    -- dupName_10_element_extension_x(BITJOIN,58)
    dupName_10_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_211;

    -- dupName_9_element_extension_x(BITJOIN,53)
    dupName_9_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_210;

    -- dupName_8_element_extension_x(BITJOIN,48)
    dupName_8_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_209;

    -- dupName_7_element_extension_x(BITJOIN,43)
    dupName_7_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_112;

    -- c_i16_0gr(CONSTANT,464)
    c_i16_0gr_q <= "0000000000000000";

    -- dupName_0_c_i8_0gr_x(CONSTANT,6)
    dupName_0_c_i8_0gr_x_q <= "00000000";

    -- dupName_6_element_extension_x(BITJOIN,38)
    dupName_6_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_8;

    -- dupName_5_element_extension_x(BITJOIN,33)
    dupName_5_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_7;

    -- dupName_4_element_extension_x(BITJOIN,28)
    dupName_4_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_6;

    -- dupName_3_element_extension_x(BITJOIN,23)
    dupName_3_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_5;

    -- dupName_2_element_extension_x(BITJOIN,18)
    dupName_2_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_4;

    -- dupName_1_element_extension_x(BITJOIN,13)
    dupName_1_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_2;

    -- dupName_0_element_extension_x(BITJOIN,7)
    dupName_0_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_1;

    -- element_extension(BITJOIN,469)
    element_extension_q <= dupName_0_c_i7_0gr_x_q & in_data_in_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,468)
    dsdk_ip_adapt_bitjoin_q <= c_i24_0gr_q & dupName_13_element_extension_x_q & in_data_in_214 & dupName_0_c_i8_0gr_x_q & dupName_12_element_extension_x_q & dupName_11_element_extension_x_q & dupName_10_element_extension_x_q & dupName_9_element_extension_x_q & dupName_8_element_extension_x_q & in_data_in_208 & in_data_in_207 & in_data_in_206 & in_data_in_205 & in_data_in_204 & in_data_in_203 & in_data_in_202 & in_data_in_201 & in_data_in_200 & in_data_in_199 & in_data_in_198 & in_data_in_197 & in_data_in_196 & in_data_in_195 & in_data_in_194 & in_data_in_193 & in_data_in_192 & in_data_in_191 & in_data_in_190 & in_data_in_189 & in_data_in_188 & in_data_in_187 & in_data_in_186 & in_data_in_185 & in_data_in_184 & in_data_in_183 & in_data_in_182 & in_data_in_181 & in_data_in_180 & in_data_in_179 & in_data_in_178 & in_data_in_177 & in_data_in_176 & in_data_in_175 & in_data_in_174 & in_data_in_173 & in_data_in_172 & in_data_in_171 & in_data_in_170 & in_data_in_169 & in_data_in_168 & in_data_in_167 & in_data_in_166 & in_data_in_165 & in_data_in_164 & in_data_in_163 & in_data_in_162 & in_data_in_161 & in_data_in_160 & in_data_in_159 & in_data_in_158 & in_data_in_157 & in_data_in_156 & in_data_in_155 & in_data_in_154 & in_data_in_153 & in_data_in_152 & in_data_in_151 & in_data_in_150 & in_data_in_149 & in_data_in_148 & in_data_in_147 & in_data_in_146 & in_data_in_145 & in_data_in_144 & in_data_in_143 & in_data_in_142 & in_data_in_141 & in_data_in_140 & in_data_in_139 & in_data_in_138 & in_data_in_137 & in_data_in_136 & in_data_in_135 & in_data_in_134 & in_data_in_133 & in_data_in_132 & in_data_in_131 & in_data_in_130 & in_data_in_129 & in_data_in_128 & in_data_in_127 & in_data_in_126 & in_data_in_125 & in_data_in_124 & in_data_in_123 & in_data_in_122 & in_data_in_121 & in_data_in_120 & in_data_in_119 & in_data_in_118 & in_data_in_117 & in_data_in_116 & in_data_in_115 & in_data_in_114 & in_data_in_113 & dupName_0_c_i8_0gr_x_q & dupName_7_element_extension_x_q & in_data_in_111 & in_data_in_110 & in_data_in_109 & in_data_in_108 & in_data_in_107 & in_data_in_106 & in_data_in_105 & c_i16_0gr_q & in_data_in_104 & in_data_in_103 & in_data_in_102 & in_data_in_101 & in_data_in_100 & in_data_in_99 & in_data_in_98 & in_data_in_97 & in_data_in_96 & in_data_in_95 & in_data_in_94 & in_data_in_93 & in_data_in_92 & in_data_in_91 & in_data_in_90 & in_data_in_89 & in_data_in_88 & in_data_in_87 & in_data_in_86 & in_data_in_85 & in_data_in_84 & in_data_in_83 & in_data_in_82 & in_data_in_81 & in_data_in_80 & in_data_in_79 & in_data_in_78 & in_data_in_77 & in_data_in_76 & in_data_in_75 & in_data_in_74 & in_data_in_73 & in_data_in_72 & in_data_in_71 & in_data_in_70 & in_data_in_69 & in_data_in_68 & in_data_in_67 & in_data_in_66 & in_data_in_65 & in_data_in_64 & in_data_in_63 & in_data_in_62 & in_data_in_61 & in_data_in_60 & in_data_in_59 & in_data_in_58 & in_data_in_57 & in_data_in_56 & in_data_in_55 & in_data_in_54 & in_data_in_53 & in_data_in_52 & in_data_in_51 & in_data_in_50 & in_data_in_49 & in_data_in_48 & in_data_in_47 & in_data_in_46 & in_data_in_45 & in_data_in_44 & in_data_in_43 & in_data_in_42 & in_data_in_41 & in_data_in_40 & in_data_in_39 & in_data_in_38 & in_data_in_37 & in_data_in_36 & in_data_in_35 & in_data_in_34 & in_data_in_33 & in_data_in_32 & in_data_in_31 & in_data_in_30 & in_data_in_29 & in_data_in_28 & in_data_in_27 & in_data_in_26 & in_data_in_25 & in_data_in_24 & in_data_in_23 & in_data_in_22 & in_data_in_21 & in_data_in_20 & in_data_in_19 & in_data_in_18 & in_data_in_17 & in_data_in_16 & in_data_in_15 & in_data_in_14 & in_data_in_13 & in_data_in_12 & in_data_in_11 & in_data_in_10 & in_data_in_9 & dupName_0_c_i8_0gr_x_q & dupName_6_element_extension_x_q & dupName_5_element_extension_x_q & dupName_4_element_extension_x_q & dupName_3_element_extension_x_q & dupName_2_element_extension_x_q & in_data_in_3 & dupName_1_element_extension_x_q & dupName_0_element_extension_x_q & element_extension_q;

    -- i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609(EXTIFACE,470)
    i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_in <= dsdk_ip_adapt_bitjoin_q;
    i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_in <= in_stall_in;
    i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_in <= in_valid_in;
    i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_in(0);
    i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_in(0);
    i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_out(0) <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_out_bitsignaltemp;
    i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_out(0) <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_out_bitsignaltemp;
    thei_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609 : acl_data_fifo
    GENERIC MAP (
        DEPTH => 4,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 3488,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => dsdk_ip_adapt_bitjoin_q,
        stall_in => i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_in_bitsignaltemp,
        valid_in => i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_in_bitsignaltemp,
        data_out => i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out,
        stall_out => i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_out_bitsignaltemp,
        valid_out => i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_214_ip_dsdk_adapt_bitselect_x(BITSELECT,462)
    dupName_214_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3456 downto 3456);

    -- dupName_13_adapt_scalar_trunc_x(ROUND,71)
    dupName_13_adapt_scalar_trunc_x_in <= dupName_214_ip_dsdk_adapt_bitselect_x_b;
    dupName_13_adapt_scalar_trunc_x_q <= dupName_13_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_213_ip_dsdk_adapt_bitselect_x(BITSELECT,461)
    dupName_213_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3455 downto 3440);

    -- dupName_199_ip_dsdk_adapt_cast_x(BITSELECT,447)
    dupName_199_ip_dsdk_adapt_cast_x_b <= dupName_213_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_212_ip_dsdk_adapt_bitselect_x(BITSELECT,460)
    dupName_212_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3424 downto 3424);

    -- dupName_12_adapt_scalar_trunc_x(ROUND,66)
    dupName_12_adapt_scalar_trunc_x_in <= dupName_212_ip_dsdk_adapt_bitselect_x_b;
    dupName_12_adapt_scalar_trunc_x_q <= dupName_12_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_211_ip_dsdk_adapt_bitselect_x(BITSELECT,459)
    dupName_211_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3416 downto 3416);

    -- dupName_11_adapt_scalar_trunc_x(ROUND,61)
    dupName_11_adapt_scalar_trunc_x_in <= dupName_211_ip_dsdk_adapt_bitselect_x_b;
    dupName_11_adapt_scalar_trunc_x_q <= dupName_11_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_210_ip_dsdk_adapt_bitselect_x(BITSELECT,458)
    dupName_210_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3408 downto 3408);

    -- dupName_10_adapt_scalar_trunc_x(ROUND,56)
    dupName_10_adapt_scalar_trunc_x_in <= dupName_210_ip_dsdk_adapt_bitselect_x_b;
    dupName_10_adapt_scalar_trunc_x_q <= dupName_10_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_209_ip_dsdk_adapt_bitselect_x(BITSELECT,457)
    dupName_209_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3400 downto 3400);

    -- dupName_9_adapt_scalar_trunc_x(ROUND,51)
    dupName_9_adapt_scalar_trunc_x_in <= dupName_209_ip_dsdk_adapt_bitselect_x_b;
    dupName_9_adapt_scalar_trunc_x_q <= dupName_9_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_208_ip_dsdk_adapt_bitselect_x(BITSELECT,456)
    dupName_208_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3392 downto 3392);

    -- dupName_8_adapt_scalar_trunc_x(ROUND,46)
    dupName_8_adapt_scalar_trunc_x_in <= dupName_208_ip_dsdk_adapt_bitselect_x_b;
    dupName_8_adapt_scalar_trunc_x_q <= dupName_8_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_207_ip_dsdk_adapt_bitselect_x(BITSELECT,455)
    dupName_207_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3391 downto 3376);

    -- dupName_198_ip_dsdk_adapt_cast_x(BITSELECT,445)
    dupName_198_ip_dsdk_adapt_cast_x_b <= dupName_207_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_206_ip_dsdk_adapt_bitselect_x(BITSELECT,454)
    dupName_206_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3375 downto 3360);

    -- dupName_197_ip_dsdk_adapt_cast_x(BITSELECT,443)
    dupName_197_ip_dsdk_adapt_cast_x_b <= dupName_206_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_205_ip_dsdk_adapt_bitselect_x(BITSELECT,453)
    dupName_205_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3359 downto 3344);

    -- dupName_196_ip_dsdk_adapt_cast_x(BITSELECT,441)
    dupName_196_ip_dsdk_adapt_cast_x_b <= dupName_205_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_204_ip_dsdk_adapt_bitselect_x(BITSELECT,452)
    dupName_204_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3343 downto 3328);

    -- dupName_195_ip_dsdk_adapt_cast_x(BITSELECT,439)
    dupName_195_ip_dsdk_adapt_cast_x_b <= dupName_204_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_203_ip_dsdk_adapt_bitselect_x(BITSELECT,451)
    dupName_203_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3327 downto 3312);

    -- dupName_194_ip_dsdk_adapt_cast_x(BITSELECT,437)
    dupName_194_ip_dsdk_adapt_cast_x_b <= dupName_203_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_202_ip_dsdk_adapt_bitselect_x(BITSELECT,450)
    dupName_202_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3311 downto 3296);

    -- dupName_193_ip_dsdk_adapt_cast_x(BITSELECT,435)
    dupName_193_ip_dsdk_adapt_cast_x_b <= dupName_202_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_201_ip_dsdk_adapt_bitselect_x(BITSELECT,449)
    dupName_201_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3295 downto 3280);

    -- dupName_192_ip_dsdk_adapt_cast_x(BITSELECT,433)
    dupName_192_ip_dsdk_adapt_cast_x_b <= dupName_201_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_200_ip_dsdk_adapt_bitselect_x(BITSELECT,448)
    dupName_200_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3279 downto 3264);

    -- dupName_191_ip_dsdk_adapt_cast_x(BITSELECT,431)
    dupName_191_ip_dsdk_adapt_cast_x_b <= dupName_200_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_199_ip_dsdk_adapt_bitselect_x(BITSELECT,446)
    dupName_199_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3263 downto 3248);

    -- dupName_190_ip_dsdk_adapt_cast_x(BITSELECT,429)
    dupName_190_ip_dsdk_adapt_cast_x_b <= dupName_199_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_198_ip_dsdk_adapt_bitselect_x(BITSELECT,444)
    dupName_198_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3247 downto 3232);

    -- dupName_189_ip_dsdk_adapt_cast_x(BITSELECT,427)
    dupName_189_ip_dsdk_adapt_cast_x_b <= dupName_198_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_197_ip_dsdk_adapt_bitselect_x(BITSELECT,442)
    dupName_197_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3231 downto 3216);

    -- dupName_188_ip_dsdk_adapt_cast_x(BITSELECT,425)
    dupName_188_ip_dsdk_adapt_cast_x_b <= dupName_197_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_196_ip_dsdk_adapt_bitselect_x(BITSELECT,440)
    dupName_196_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3215 downto 3200);

    -- dupName_187_ip_dsdk_adapt_cast_x(BITSELECT,423)
    dupName_187_ip_dsdk_adapt_cast_x_b <= dupName_196_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_195_ip_dsdk_adapt_bitselect_x(BITSELECT,438)
    dupName_195_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3199 downto 3184);

    -- dupName_186_ip_dsdk_adapt_cast_x(BITSELECT,421)
    dupName_186_ip_dsdk_adapt_cast_x_b <= dupName_195_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_194_ip_dsdk_adapt_bitselect_x(BITSELECT,436)
    dupName_194_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3183 downto 3168);

    -- dupName_185_ip_dsdk_adapt_cast_x(BITSELECT,419)
    dupName_185_ip_dsdk_adapt_cast_x_b <= dupName_194_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_193_ip_dsdk_adapt_bitselect_x(BITSELECT,434)
    dupName_193_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3167 downto 3152);

    -- dupName_184_ip_dsdk_adapt_cast_x(BITSELECT,417)
    dupName_184_ip_dsdk_adapt_cast_x_b <= dupName_193_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_192_ip_dsdk_adapt_bitselect_x(BITSELECT,432)
    dupName_192_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3151 downto 3136);

    -- dupName_183_ip_dsdk_adapt_cast_x(BITSELECT,415)
    dupName_183_ip_dsdk_adapt_cast_x_b <= dupName_192_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_191_ip_dsdk_adapt_bitselect_x(BITSELECT,430)
    dupName_191_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3135 downto 3120);

    -- dupName_182_ip_dsdk_adapt_cast_x(BITSELECT,413)
    dupName_182_ip_dsdk_adapt_cast_x_b <= dupName_191_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_190_ip_dsdk_adapt_bitselect_x(BITSELECT,428)
    dupName_190_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3119 downto 3104);

    -- dupName_181_ip_dsdk_adapt_cast_x(BITSELECT,411)
    dupName_181_ip_dsdk_adapt_cast_x_b <= dupName_190_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_189_ip_dsdk_adapt_bitselect_x(BITSELECT,426)
    dupName_189_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3103 downto 3088);

    -- dupName_180_ip_dsdk_adapt_cast_x(BITSELECT,409)
    dupName_180_ip_dsdk_adapt_cast_x_b <= dupName_189_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_188_ip_dsdk_adapt_bitselect_x(BITSELECT,424)
    dupName_188_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3087 downto 3072);

    -- dupName_179_ip_dsdk_adapt_cast_x(BITSELECT,407)
    dupName_179_ip_dsdk_adapt_cast_x_b <= dupName_188_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_187_ip_dsdk_adapt_bitselect_x(BITSELECT,422)
    dupName_187_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3071 downto 3056);

    -- dupName_178_ip_dsdk_adapt_cast_x(BITSELECT,405)
    dupName_178_ip_dsdk_adapt_cast_x_b <= dupName_187_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_186_ip_dsdk_adapt_bitselect_x(BITSELECT,420)
    dupName_186_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3055 downto 3040);

    -- dupName_177_ip_dsdk_adapt_cast_x(BITSELECT,403)
    dupName_177_ip_dsdk_adapt_cast_x_b <= dupName_186_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_185_ip_dsdk_adapt_bitselect_x(BITSELECT,418)
    dupName_185_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3039 downto 3024);

    -- dupName_176_ip_dsdk_adapt_cast_x(BITSELECT,401)
    dupName_176_ip_dsdk_adapt_cast_x_b <= dupName_185_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_184_ip_dsdk_adapt_bitselect_x(BITSELECT,416)
    dupName_184_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3023 downto 3008);

    -- dupName_175_ip_dsdk_adapt_cast_x(BITSELECT,399)
    dupName_175_ip_dsdk_adapt_cast_x_b <= dupName_184_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_183_ip_dsdk_adapt_bitselect_x(BITSELECT,414)
    dupName_183_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(3007 downto 2992);

    -- dupName_174_ip_dsdk_adapt_cast_x(BITSELECT,397)
    dupName_174_ip_dsdk_adapt_cast_x_b <= dupName_183_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_182_ip_dsdk_adapt_bitselect_x(BITSELECT,412)
    dupName_182_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2991 downto 2976);

    -- dupName_173_ip_dsdk_adapt_cast_x(BITSELECT,395)
    dupName_173_ip_dsdk_adapt_cast_x_b <= dupName_182_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_181_ip_dsdk_adapt_bitselect_x(BITSELECT,410)
    dupName_181_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2975 downto 2960);

    -- dupName_172_ip_dsdk_adapt_cast_x(BITSELECT,393)
    dupName_172_ip_dsdk_adapt_cast_x_b <= dupName_181_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_180_ip_dsdk_adapt_bitselect_x(BITSELECT,408)
    dupName_180_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2959 downto 2944);

    -- dupName_171_ip_dsdk_adapt_cast_x(BITSELECT,391)
    dupName_171_ip_dsdk_adapt_cast_x_b <= dupName_180_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_179_ip_dsdk_adapt_bitselect_x(BITSELECT,406)
    dupName_179_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2943 downto 2928);

    -- dupName_170_ip_dsdk_adapt_cast_x(BITSELECT,389)
    dupName_170_ip_dsdk_adapt_cast_x_b <= dupName_179_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_178_ip_dsdk_adapt_bitselect_x(BITSELECT,404)
    dupName_178_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2927 downto 2912);

    -- dupName_169_ip_dsdk_adapt_cast_x(BITSELECT,387)
    dupName_169_ip_dsdk_adapt_cast_x_b <= dupName_178_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_177_ip_dsdk_adapt_bitselect_x(BITSELECT,402)
    dupName_177_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2911 downto 2896);

    -- dupName_168_ip_dsdk_adapt_cast_x(BITSELECT,385)
    dupName_168_ip_dsdk_adapt_cast_x_b <= dupName_177_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_176_ip_dsdk_adapt_bitselect_x(BITSELECT,400)
    dupName_176_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2895 downto 2880);

    -- dupName_167_ip_dsdk_adapt_cast_x(BITSELECT,383)
    dupName_167_ip_dsdk_adapt_cast_x_b <= dupName_176_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_175_ip_dsdk_adapt_bitselect_x(BITSELECT,398)
    dupName_175_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2879 downto 2864);

    -- dupName_166_ip_dsdk_adapt_cast_x(BITSELECT,381)
    dupName_166_ip_dsdk_adapt_cast_x_b <= dupName_175_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_174_ip_dsdk_adapt_bitselect_x(BITSELECT,396)
    dupName_174_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2863 downto 2848);

    -- dupName_165_ip_dsdk_adapt_cast_x(BITSELECT,379)
    dupName_165_ip_dsdk_adapt_cast_x_b <= dupName_174_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_173_ip_dsdk_adapt_bitselect_x(BITSELECT,394)
    dupName_173_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2847 downto 2832);

    -- dupName_164_ip_dsdk_adapt_cast_x(BITSELECT,377)
    dupName_164_ip_dsdk_adapt_cast_x_b <= dupName_173_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_172_ip_dsdk_adapt_bitselect_x(BITSELECT,392)
    dupName_172_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2831 downto 2816);

    -- dupName_163_ip_dsdk_adapt_cast_x(BITSELECT,375)
    dupName_163_ip_dsdk_adapt_cast_x_b <= dupName_172_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_171_ip_dsdk_adapt_bitselect_x(BITSELECT,390)
    dupName_171_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2815 downto 2800);

    -- dupName_162_ip_dsdk_adapt_cast_x(BITSELECT,373)
    dupName_162_ip_dsdk_adapt_cast_x_b <= dupName_171_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_170_ip_dsdk_adapt_bitselect_x(BITSELECT,388)
    dupName_170_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2799 downto 2784);

    -- dupName_161_ip_dsdk_adapt_cast_x(BITSELECT,371)
    dupName_161_ip_dsdk_adapt_cast_x_b <= dupName_170_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_169_ip_dsdk_adapt_bitselect_x(BITSELECT,386)
    dupName_169_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2783 downto 2768);

    -- dupName_160_ip_dsdk_adapt_cast_x(BITSELECT,369)
    dupName_160_ip_dsdk_adapt_cast_x_b <= dupName_169_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_168_ip_dsdk_adapt_bitselect_x(BITSELECT,384)
    dupName_168_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2767 downto 2752);

    -- dupName_159_ip_dsdk_adapt_cast_x(BITSELECT,367)
    dupName_159_ip_dsdk_adapt_cast_x_b <= dupName_168_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_167_ip_dsdk_adapt_bitselect_x(BITSELECT,382)
    dupName_167_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2751 downto 2736);

    -- dupName_158_ip_dsdk_adapt_cast_x(BITSELECT,365)
    dupName_158_ip_dsdk_adapt_cast_x_b <= dupName_167_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_166_ip_dsdk_adapt_bitselect_x(BITSELECT,380)
    dupName_166_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2735 downto 2720);

    -- dupName_157_ip_dsdk_adapt_cast_x(BITSELECT,363)
    dupName_157_ip_dsdk_adapt_cast_x_b <= dupName_166_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_165_ip_dsdk_adapt_bitselect_x(BITSELECT,378)
    dupName_165_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2719 downto 2704);

    -- dupName_156_ip_dsdk_adapt_cast_x(BITSELECT,361)
    dupName_156_ip_dsdk_adapt_cast_x_b <= dupName_165_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_164_ip_dsdk_adapt_bitselect_x(BITSELECT,376)
    dupName_164_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2703 downto 2688);

    -- dupName_155_ip_dsdk_adapt_cast_x(BITSELECT,359)
    dupName_155_ip_dsdk_adapt_cast_x_b <= dupName_164_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_163_ip_dsdk_adapt_bitselect_x(BITSELECT,374)
    dupName_163_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2687 downto 2672);

    -- dupName_154_ip_dsdk_adapt_cast_x(BITSELECT,357)
    dupName_154_ip_dsdk_adapt_cast_x_b <= dupName_163_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_162_ip_dsdk_adapt_bitselect_x(BITSELECT,372)
    dupName_162_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2671 downto 2656);

    -- dupName_153_ip_dsdk_adapt_cast_x(BITSELECT,355)
    dupName_153_ip_dsdk_adapt_cast_x_b <= dupName_162_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_161_ip_dsdk_adapt_bitselect_x(BITSELECT,370)
    dupName_161_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2655 downto 2640);

    -- dupName_152_ip_dsdk_adapt_cast_x(BITSELECT,353)
    dupName_152_ip_dsdk_adapt_cast_x_b <= dupName_161_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_160_ip_dsdk_adapt_bitselect_x(BITSELECT,368)
    dupName_160_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2639 downto 2624);

    -- dupName_151_ip_dsdk_adapt_cast_x(BITSELECT,351)
    dupName_151_ip_dsdk_adapt_cast_x_b <= dupName_160_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_159_ip_dsdk_adapt_bitselect_x(BITSELECT,366)
    dupName_159_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2623 downto 2608);

    -- dupName_150_ip_dsdk_adapt_cast_x(BITSELECT,349)
    dupName_150_ip_dsdk_adapt_cast_x_b <= dupName_159_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_158_ip_dsdk_adapt_bitselect_x(BITSELECT,364)
    dupName_158_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2607 downto 2592);

    -- dupName_149_ip_dsdk_adapt_cast_x(BITSELECT,347)
    dupName_149_ip_dsdk_adapt_cast_x_b <= dupName_158_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_157_ip_dsdk_adapt_bitselect_x(BITSELECT,362)
    dupName_157_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2591 downto 2576);

    -- dupName_148_ip_dsdk_adapt_cast_x(BITSELECT,345)
    dupName_148_ip_dsdk_adapt_cast_x_b <= dupName_157_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_156_ip_dsdk_adapt_bitselect_x(BITSELECT,360)
    dupName_156_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2575 downto 2560);

    -- dupName_147_ip_dsdk_adapt_cast_x(BITSELECT,343)
    dupName_147_ip_dsdk_adapt_cast_x_b <= dupName_156_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_155_ip_dsdk_adapt_bitselect_x(BITSELECT,358)
    dupName_155_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2559 downto 2544);

    -- dupName_146_ip_dsdk_adapt_cast_x(BITSELECT,341)
    dupName_146_ip_dsdk_adapt_cast_x_b <= dupName_155_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_154_ip_dsdk_adapt_bitselect_x(BITSELECT,356)
    dupName_154_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2543 downto 2528);

    -- dupName_145_ip_dsdk_adapt_cast_x(BITSELECT,339)
    dupName_145_ip_dsdk_adapt_cast_x_b <= dupName_154_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_153_ip_dsdk_adapt_bitselect_x(BITSELECT,354)
    dupName_153_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2527 downto 2512);

    -- dupName_144_ip_dsdk_adapt_cast_x(BITSELECT,337)
    dupName_144_ip_dsdk_adapt_cast_x_b <= dupName_153_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_152_ip_dsdk_adapt_bitselect_x(BITSELECT,352)
    dupName_152_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2511 downto 2496);

    -- dupName_143_ip_dsdk_adapt_cast_x(BITSELECT,335)
    dupName_143_ip_dsdk_adapt_cast_x_b <= dupName_152_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_151_ip_dsdk_adapt_bitselect_x(BITSELECT,350)
    dupName_151_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2495 downto 2480);

    -- dupName_142_ip_dsdk_adapt_cast_x(BITSELECT,333)
    dupName_142_ip_dsdk_adapt_cast_x_b <= dupName_151_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_150_ip_dsdk_adapt_bitselect_x(BITSELECT,348)
    dupName_150_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2479 downto 2464);

    -- dupName_141_ip_dsdk_adapt_cast_x(BITSELECT,331)
    dupName_141_ip_dsdk_adapt_cast_x_b <= dupName_150_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_149_ip_dsdk_adapt_bitselect_x(BITSELECT,346)
    dupName_149_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2463 downto 2448);

    -- dupName_140_ip_dsdk_adapt_cast_x(BITSELECT,329)
    dupName_140_ip_dsdk_adapt_cast_x_b <= dupName_149_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_148_ip_dsdk_adapt_bitselect_x(BITSELECT,344)
    dupName_148_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2447 downto 2432);

    -- dupName_139_ip_dsdk_adapt_cast_x(BITSELECT,327)
    dupName_139_ip_dsdk_adapt_cast_x_b <= dupName_148_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_147_ip_dsdk_adapt_bitselect_x(BITSELECT,342)
    dupName_147_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2431 downto 2416);

    -- dupName_138_ip_dsdk_adapt_cast_x(BITSELECT,325)
    dupName_138_ip_dsdk_adapt_cast_x_b <= dupName_147_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_146_ip_dsdk_adapt_bitselect_x(BITSELECT,340)
    dupName_146_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2415 downto 2400);

    -- dupName_137_ip_dsdk_adapt_cast_x(BITSELECT,323)
    dupName_137_ip_dsdk_adapt_cast_x_b <= dupName_146_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_145_ip_dsdk_adapt_bitselect_x(BITSELECT,338)
    dupName_145_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2399 downto 2384);

    -- dupName_136_ip_dsdk_adapt_cast_x(BITSELECT,321)
    dupName_136_ip_dsdk_adapt_cast_x_b <= dupName_145_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_144_ip_dsdk_adapt_bitselect_x(BITSELECT,336)
    dupName_144_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2383 downto 2368);

    -- dupName_135_ip_dsdk_adapt_cast_x(BITSELECT,319)
    dupName_135_ip_dsdk_adapt_cast_x_b <= dupName_144_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_143_ip_dsdk_adapt_bitselect_x(BITSELECT,334)
    dupName_143_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2367 downto 2352);

    -- dupName_134_ip_dsdk_adapt_cast_x(BITSELECT,317)
    dupName_134_ip_dsdk_adapt_cast_x_b <= dupName_143_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_142_ip_dsdk_adapt_bitselect_x(BITSELECT,332)
    dupName_142_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2351 downto 2336);

    -- dupName_133_ip_dsdk_adapt_cast_x(BITSELECT,315)
    dupName_133_ip_dsdk_adapt_cast_x_b <= dupName_142_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_141_ip_dsdk_adapt_bitselect_x(BITSELECT,330)
    dupName_141_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2335 downto 2320);

    -- dupName_132_ip_dsdk_adapt_cast_x(BITSELECT,313)
    dupName_132_ip_dsdk_adapt_cast_x_b <= dupName_141_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_140_ip_dsdk_adapt_bitselect_x(BITSELECT,328)
    dupName_140_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2319 downto 2304);

    -- dupName_131_ip_dsdk_adapt_cast_x(BITSELECT,311)
    dupName_131_ip_dsdk_adapt_cast_x_b <= dupName_140_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_139_ip_dsdk_adapt_bitselect_x(BITSELECT,326)
    dupName_139_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2303 downto 2288);

    -- dupName_130_ip_dsdk_adapt_cast_x(BITSELECT,309)
    dupName_130_ip_dsdk_adapt_cast_x_b <= dupName_139_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_138_ip_dsdk_adapt_bitselect_x(BITSELECT,324)
    dupName_138_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2287 downto 2272);

    -- dupName_129_ip_dsdk_adapt_cast_x(BITSELECT,307)
    dupName_129_ip_dsdk_adapt_cast_x_b <= dupName_138_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_137_ip_dsdk_adapt_bitselect_x(BITSELECT,322)
    dupName_137_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2271 downto 2256);

    -- dupName_128_ip_dsdk_adapt_cast_x(BITSELECT,305)
    dupName_128_ip_dsdk_adapt_cast_x_b <= dupName_137_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_136_ip_dsdk_adapt_bitselect_x(BITSELECT,320)
    dupName_136_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2255 downto 2240);

    -- dupName_127_ip_dsdk_adapt_cast_x(BITSELECT,303)
    dupName_127_ip_dsdk_adapt_cast_x_b <= dupName_136_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_135_ip_dsdk_adapt_bitselect_x(BITSELECT,318)
    dupName_135_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2239 downto 2224);

    -- dupName_126_ip_dsdk_adapt_cast_x(BITSELECT,301)
    dupName_126_ip_dsdk_adapt_cast_x_b <= dupName_135_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_134_ip_dsdk_adapt_bitselect_x(BITSELECT,316)
    dupName_134_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2223 downto 2208);

    -- dupName_125_ip_dsdk_adapt_cast_x(BITSELECT,299)
    dupName_125_ip_dsdk_adapt_cast_x_b <= dupName_134_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_133_ip_dsdk_adapt_bitselect_x(BITSELECT,314)
    dupName_133_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2207 downto 2192);

    -- dupName_124_ip_dsdk_adapt_cast_x(BITSELECT,297)
    dupName_124_ip_dsdk_adapt_cast_x_b <= dupName_133_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_132_ip_dsdk_adapt_bitselect_x(BITSELECT,312)
    dupName_132_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2191 downto 2176);

    -- dupName_123_ip_dsdk_adapt_cast_x(BITSELECT,295)
    dupName_123_ip_dsdk_adapt_cast_x_b <= dupName_132_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_131_ip_dsdk_adapt_bitselect_x(BITSELECT,310)
    dupName_131_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2175 downto 2160);

    -- dupName_122_ip_dsdk_adapt_cast_x(BITSELECT,293)
    dupName_122_ip_dsdk_adapt_cast_x_b <= dupName_131_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_130_ip_dsdk_adapt_bitselect_x(BITSELECT,308)
    dupName_130_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2159 downto 2144);

    -- dupName_121_ip_dsdk_adapt_cast_x(BITSELECT,291)
    dupName_121_ip_dsdk_adapt_cast_x_b <= dupName_130_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_129_ip_dsdk_adapt_bitselect_x(BITSELECT,306)
    dupName_129_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2143 downto 2128);

    -- dupName_120_ip_dsdk_adapt_cast_x(BITSELECT,289)
    dupName_120_ip_dsdk_adapt_cast_x_b <= dupName_129_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_128_ip_dsdk_adapt_bitselect_x(BITSELECT,304)
    dupName_128_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2127 downto 2112);

    -- dupName_119_ip_dsdk_adapt_cast_x(BITSELECT,287)
    dupName_119_ip_dsdk_adapt_cast_x_b <= dupName_128_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_127_ip_dsdk_adapt_bitselect_x(BITSELECT,302)
    dupName_127_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2111 downto 2096);

    -- dupName_118_ip_dsdk_adapt_cast_x(BITSELECT,285)
    dupName_118_ip_dsdk_adapt_cast_x_b <= dupName_127_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_126_ip_dsdk_adapt_bitselect_x(BITSELECT,300)
    dupName_126_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2095 downto 2080);

    -- dupName_117_ip_dsdk_adapt_cast_x(BITSELECT,283)
    dupName_117_ip_dsdk_adapt_cast_x_b <= dupName_126_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_125_ip_dsdk_adapt_bitselect_x(BITSELECT,298)
    dupName_125_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2079 downto 2064);

    -- dupName_116_ip_dsdk_adapt_cast_x(BITSELECT,281)
    dupName_116_ip_dsdk_adapt_cast_x_b <= dupName_125_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_124_ip_dsdk_adapt_bitselect_x(BITSELECT,296)
    dupName_124_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2063 downto 2048);

    -- dupName_115_ip_dsdk_adapt_cast_x(BITSELECT,279)
    dupName_115_ip_dsdk_adapt_cast_x_b <= dupName_124_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_123_ip_dsdk_adapt_bitselect_x(BITSELECT,294)
    dupName_123_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2047 downto 2032);

    -- dupName_114_ip_dsdk_adapt_cast_x(BITSELECT,277)
    dupName_114_ip_dsdk_adapt_cast_x_b <= dupName_123_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_122_ip_dsdk_adapt_bitselect_x(BITSELECT,292)
    dupName_122_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2031 downto 2016);

    -- dupName_113_ip_dsdk_adapt_cast_x(BITSELECT,275)
    dupName_113_ip_dsdk_adapt_cast_x_b <= dupName_122_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_121_ip_dsdk_adapt_bitselect_x(BITSELECT,290)
    dupName_121_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(2015 downto 2000);

    -- dupName_112_ip_dsdk_adapt_cast_x(BITSELECT,273)
    dupName_112_ip_dsdk_adapt_cast_x_b <= dupName_121_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_120_ip_dsdk_adapt_bitselect_x(BITSELECT,288)
    dupName_120_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1999 downto 1984);

    -- dupName_111_ip_dsdk_adapt_cast_x(BITSELECT,271)
    dupName_111_ip_dsdk_adapt_cast_x_b <= dupName_120_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_119_ip_dsdk_adapt_bitselect_x(BITSELECT,286)
    dupName_119_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1983 downto 1968);

    -- dupName_110_ip_dsdk_adapt_cast_x(BITSELECT,269)
    dupName_110_ip_dsdk_adapt_cast_x_b <= dupName_119_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_118_ip_dsdk_adapt_bitselect_x(BITSELECT,284)
    dupName_118_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1967 downto 1952);

    -- dupName_109_ip_dsdk_adapt_cast_x(BITSELECT,267)
    dupName_109_ip_dsdk_adapt_cast_x_b <= dupName_118_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_117_ip_dsdk_adapt_bitselect_x(BITSELECT,282)
    dupName_117_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1951 downto 1936);

    -- dupName_108_ip_dsdk_adapt_cast_x(BITSELECT,265)
    dupName_108_ip_dsdk_adapt_cast_x_b <= dupName_117_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_116_ip_dsdk_adapt_bitselect_x(BITSELECT,280)
    dupName_116_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1935 downto 1920);

    -- dupName_107_ip_dsdk_adapt_cast_x(BITSELECT,263)
    dupName_107_ip_dsdk_adapt_cast_x_b <= dupName_116_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_115_ip_dsdk_adapt_bitselect_x(BITSELECT,278)
    dupName_115_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1919 downto 1904);

    -- dupName_106_ip_dsdk_adapt_cast_x(BITSELECT,261)
    dupName_106_ip_dsdk_adapt_cast_x_b <= dupName_115_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_114_ip_dsdk_adapt_bitselect_x(BITSELECT,276)
    dupName_114_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1903 downto 1888);

    -- dupName_105_ip_dsdk_adapt_cast_x(BITSELECT,259)
    dupName_105_ip_dsdk_adapt_cast_x_b <= dupName_114_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_113_ip_dsdk_adapt_bitselect_x(BITSELECT,274)
    dupName_113_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1887 downto 1872);

    -- dupName_104_ip_dsdk_adapt_cast_x(BITSELECT,257)
    dupName_104_ip_dsdk_adapt_cast_x_b <= dupName_113_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_112_ip_dsdk_adapt_bitselect_x(BITSELECT,272)
    dupName_112_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1871 downto 1856);

    -- dupName_103_ip_dsdk_adapt_cast_x(BITSELECT,255)
    dupName_103_ip_dsdk_adapt_cast_x_b <= dupName_112_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_111_ip_dsdk_adapt_bitselect_x(BITSELECT,270)
    dupName_111_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1840 downto 1840);

    -- dupName_7_adapt_scalar_trunc_x(ROUND,41)
    dupName_7_adapt_scalar_trunc_x_in <= dupName_111_ip_dsdk_adapt_bitselect_x_b;
    dupName_7_adapt_scalar_trunc_x_q <= dupName_7_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_110_ip_dsdk_adapt_bitselect_x(BITSELECT,268)
    dupName_110_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1839 downto 1824);

    -- dupName_102_ip_dsdk_adapt_cast_x(BITSELECT,253)
    dupName_102_ip_dsdk_adapt_cast_x_b <= dupName_110_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_109_ip_dsdk_adapt_bitselect_x(BITSELECT,266)
    dupName_109_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1823 downto 1792);

    -- dupName_101_ip_dsdk_adapt_cast_x(BITSELECT,251)
    dupName_101_ip_dsdk_adapt_cast_x_b <= dupName_109_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_108_ip_dsdk_adapt_bitselect_x(BITSELECT,264)
    dupName_108_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1791 downto 1760);

    -- dupName_100_ip_dsdk_adapt_cast_x(BITSELECT,249)
    dupName_100_ip_dsdk_adapt_cast_x_b <= dupName_108_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_107_ip_dsdk_adapt_bitselect_x(BITSELECT,262)
    dupName_107_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1759 downto 1728);

    -- dupName_99_ip_dsdk_adapt_cast_x(BITSELECT,247)
    dupName_99_ip_dsdk_adapt_cast_x_b <= dupName_107_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_106_ip_dsdk_adapt_bitselect_x(BITSELECT,260)
    dupName_106_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1727 downto 1696);

    -- dupName_98_ip_dsdk_adapt_cast_x(BITSELECT,245)
    dupName_98_ip_dsdk_adapt_cast_x_b <= dupName_106_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_105_ip_dsdk_adapt_bitselect_x(BITSELECT,258)
    dupName_105_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1695 downto 1664);

    -- dupName_97_ip_dsdk_adapt_cast_x(BITSELECT,243)
    dupName_97_ip_dsdk_adapt_cast_x_b <= dupName_105_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_104_ip_dsdk_adapt_bitselect_x(BITSELECT,256)
    dupName_104_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1663 downto 1632);

    -- dupName_96_ip_dsdk_adapt_cast_x(BITSELECT,241)
    dupName_96_ip_dsdk_adapt_cast_x_b <= dupName_104_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_103_ip_dsdk_adapt_bitselect_x(BITSELECT,254)
    dupName_103_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1615 downto 1600);

    -- dupName_95_ip_dsdk_adapt_cast_x(BITSELECT,239)
    dupName_95_ip_dsdk_adapt_cast_x_b <= dupName_103_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_102_ip_dsdk_adapt_bitselect_x(BITSELECT,252)
    dupName_102_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1599 downto 1584);

    -- dupName_94_ip_dsdk_adapt_cast_x(BITSELECT,237)
    dupName_94_ip_dsdk_adapt_cast_x_b <= dupName_102_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_101_ip_dsdk_adapt_bitselect_x(BITSELECT,250)
    dupName_101_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1583 downto 1568);

    -- dupName_93_ip_dsdk_adapt_cast_x(BITSELECT,235)
    dupName_93_ip_dsdk_adapt_cast_x_b <= dupName_101_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_100_ip_dsdk_adapt_bitselect_x(BITSELECT,248)
    dupName_100_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1567 downto 1552);

    -- dupName_92_ip_dsdk_adapt_cast_x(BITSELECT,233)
    dupName_92_ip_dsdk_adapt_cast_x_b <= dupName_100_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_99_ip_dsdk_adapt_bitselect_x(BITSELECT,246)
    dupName_99_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1551 downto 1536);

    -- dupName_91_ip_dsdk_adapt_cast_x(BITSELECT,231)
    dupName_91_ip_dsdk_adapt_cast_x_b <= dupName_99_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_98_ip_dsdk_adapt_bitselect_x(BITSELECT,244)
    dupName_98_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1535 downto 1520);

    -- dupName_90_ip_dsdk_adapt_cast_x(BITSELECT,229)
    dupName_90_ip_dsdk_adapt_cast_x_b <= dupName_98_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_97_ip_dsdk_adapt_bitselect_x(BITSELECT,242)
    dupName_97_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1519 downto 1504);

    -- dupName_89_ip_dsdk_adapt_cast_x(BITSELECT,227)
    dupName_89_ip_dsdk_adapt_cast_x_b <= dupName_97_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_96_ip_dsdk_adapt_bitselect_x(BITSELECT,240)
    dupName_96_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1503 downto 1488);

    -- dupName_88_ip_dsdk_adapt_cast_x(BITSELECT,225)
    dupName_88_ip_dsdk_adapt_cast_x_b <= dupName_96_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_95_ip_dsdk_adapt_bitselect_x(BITSELECT,238)
    dupName_95_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1487 downto 1472);

    -- dupName_87_ip_dsdk_adapt_cast_x(BITSELECT,223)
    dupName_87_ip_dsdk_adapt_cast_x_b <= dupName_95_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_94_ip_dsdk_adapt_bitselect_x(BITSELECT,236)
    dupName_94_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1471 downto 1456);

    -- dupName_86_ip_dsdk_adapt_cast_x(BITSELECT,221)
    dupName_86_ip_dsdk_adapt_cast_x_b <= dupName_94_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_93_ip_dsdk_adapt_bitselect_x(BITSELECT,234)
    dupName_93_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1455 downto 1440);

    -- dupName_85_ip_dsdk_adapt_cast_x(BITSELECT,219)
    dupName_85_ip_dsdk_adapt_cast_x_b <= dupName_93_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_92_ip_dsdk_adapt_bitselect_x(BITSELECT,232)
    dupName_92_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1439 downto 1424);

    -- dupName_84_ip_dsdk_adapt_cast_x(BITSELECT,217)
    dupName_84_ip_dsdk_adapt_cast_x_b <= dupName_92_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_91_ip_dsdk_adapt_bitselect_x(BITSELECT,230)
    dupName_91_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1423 downto 1408);

    -- dupName_83_ip_dsdk_adapt_cast_x(BITSELECT,215)
    dupName_83_ip_dsdk_adapt_cast_x_b <= dupName_91_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_90_ip_dsdk_adapt_bitselect_x(BITSELECT,228)
    dupName_90_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1407 downto 1392);

    -- dupName_82_ip_dsdk_adapt_cast_x(BITSELECT,213)
    dupName_82_ip_dsdk_adapt_cast_x_b <= dupName_90_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_89_ip_dsdk_adapt_bitselect_x(BITSELECT,226)
    dupName_89_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1391 downto 1376);

    -- dupName_81_ip_dsdk_adapt_cast_x(BITSELECT,211)
    dupName_81_ip_dsdk_adapt_cast_x_b <= dupName_89_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_88_ip_dsdk_adapt_bitselect_x(BITSELECT,224)
    dupName_88_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1375 downto 1360);

    -- dupName_80_ip_dsdk_adapt_cast_x(BITSELECT,209)
    dupName_80_ip_dsdk_adapt_cast_x_b <= dupName_88_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_87_ip_dsdk_adapt_bitselect_x(BITSELECT,222)
    dupName_87_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1359 downto 1344);

    -- dupName_79_ip_dsdk_adapt_cast_x(BITSELECT,207)
    dupName_79_ip_dsdk_adapt_cast_x_b <= dupName_87_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_86_ip_dsdk_adapt_bitselect_x(BITSELECT,220)
    dupName_86_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1343 downto 1328);

    -- dupName_78_ip_dsdk_adapt_cast_x(BITSELECT,205)
    dupName_78_ip_dsdk_adapt_cast_x_b <= dupName_86_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_85_ip_dsdk_adapt_bitselect_x(BITSELECT,218)
    dupName_85_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1327 downto 1312);

    -- dupName_77_ip_dsdk_adapt_cast_x(BITSELECT,203)
    dupName_77_ip_dsdk_adapt_cast_x_b <= dupName_85_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_84_ip_dsdk_adapt_bitselect_x(BITSELECT,216)
    dupName_84_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1311 downto 1296);

    -- dupName_76_ip_dsdk_adapt_cast_x(BITSELECT,201)
    dupName_76_ip_dsdk_adapt_cast_x_b <= dupName_84_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_83_ip_dsdk_adapt_bitselect_x(BITSELECT,214)
    dupName_83_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1295 downto 1280);

    -- dupName_75_ip_dsdk_adapt_cast_x(BITSELECT,199)
    dupName_75_ip_dsdk_adapt_cast_x_b <= dupName_83_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_82_ip_dsdk_adapt_bitselect_x(BITSELECT,212)
    dupName_82_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1279 downto 1264);

    -- dupName_74_ip_dsdk_adapt_cast_x(BITSELECT,197)
    dupName_74_ip_dsdk_adapt_cast_x_b <= dupName_82_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_81_ip_dsdk_adapt_bitselect_x(BITSELECT,210)
    dupName_81_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1263 downto 1248);

    -- dupName_73_ip_dsdk_adapt_cast_x(BITSELECT,195)
    dupName_73_ip_dsdk_adapt_cast_x_b <= dupName_81_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_80_ip_dsdk_adapt_bitselect_x(BITSELECT,208)
    dupName_80_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1247 downto 1232);

    -- dupName_72_ip_dsdk_adapt_cast_x(BITSELECT,193)
    dupName_72_ip_dsdk_adapt_cast_x_b <= dupName_80_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_79_ip_dsdk_adapt_bitselect_x(BITSELECT,206)
    dupName_79_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1231 downto 1216);

    -- dupName_71_ip_dsdk_adapt_cast_x(BITSELECT,191)
    dupName_71_ip_dsdk_adapt_cast_x_b <= dupName_79_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_78_ip_dsdk_adapt_bitselect_x(BITSELECT,204)
    dupName_78_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1215 downto 1200);

    -- dupName_70_ip_dsdk_adapt_cast_x(BITSELECT,189)
    dupName_70_ip_dsdk_adapt_cast_x_b <= dupName_78_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_77_ip_dsdk_adapt_bitselect_x(BITSELECT,202)
    dupName_77_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1199 downto 1184);

    -- dupName_69_ip_dsdk_adapt_cast_x(BITSELECT,187)
    dupName_69_ip_dsdk_adapt_cast_x_b <= dupName_77_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_76_ip_dsdk_adapt_bitselect_x(BITSELECT,200)
    dupName_76_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1183 downto 1168);

    -- dupName_68_ip_dsdk_adapt_cast_x(BITSELECT,185)
    dupName_68_ip_dsdk_adapt_cast_x_b <= dupName_76_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_75_ip_dsdk_adapt_bitselect_x(BITSELECT,198)
    dupName_75_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1167 downto 1152);

    -- dupName_67_ip_dsdk_adapt_cast_x(BITSELECT,183)
    dupName_67_ip_dsdk_adapt_cast_x_b <= dupName_75_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_74_ip_dsdk_adapt_bitselect_x(BITSELECT,196)
    dupName_74_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1151 downto 1136);

    -- dupName_66_ip_dsdk_adapt_cast_x(BITSELECT,181)
    dupName_66_ip_dsdk_adapt_cast_x_b <= dupName_74_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_73_ip_dsdk_adapt_bitselect_x(BITSELECT,194)
    dupName_73_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1135 downto 1120);

    -- dupName_65_ip_dsdk_adapt_cast_x(BITSELECT,179)
    dupName_65_ip_dsdk_adapt_cast_x_b <= dupName_73_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_72_ip_dsdk_adapt_bitselect_x(BITSELECT,192)
    dupName_72_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1119 downto 1104);

    -- dupName_64_ip_dsdk_adapt_cast_x(BITSELECT,177)
    dupName_64_ip_dsdk_adapt_cast_x_b <= dupName_72_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_71_ip_dsdk_adapt_bitselect_x(BITSELECT,190)
    dupName_71_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1103 downto 1088);

    -- dupName_63_ip_dsdk_adapt_cast_x(BITSELECT,175)
    dupName_63_ip_dsdk_adapt_cast_x_b <= dupName_71_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_70_ip_dsdk_adapt_bitselect_x(BITSELECT,188)
    dupName_70_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1087 downto 1072);

    -- dupName_62_ip_dsdk_adapt_cast_x(BITSELECT,173)
    dupName_62_ip_dsdk_adapt_cast_x_b <= dupName_70_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_69_ip_dsdk_adapt_bitselect_x(BITSELECT,186)
    dupName_69_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1071 downto 1056);

    -- dupName_61_ip_dsdk_adapt_cast_x(BITSELECT,171)
    dupName_61_ip_dsdk_adapt_cast_x_b <= dupName_69_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_68_ip_dsdk_adapt_bitselect_x(BITSELECT,184)
    dupName_68_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1055 downto 1040);

    -- dupName_60_ip_dsdk_adapt_cast_x(BITSELECT,169)
    dupName_60_ip_dsdk_adapt_cast_x_b <= dupName_68_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_67_ip_dsdk_adapt_bitselect_x(BITSELECT,182)
    dupName_67_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1039 downto 1024);

    -- dupName_59_ip_dsdk_adapt_cast_x(BITSELECT,167)
    dupName_59_ip_dsdk_adapt_cast_x_b <= dupName_67_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_66_ip_dsdk_adapt_bitselect_x(BITSELECT,180)
    dupName_66_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1023 downto 1008);

    -- dupName_58_ip_dsdk_adapt_cast_x(BITSELECT,165)
    dupName_58_ip_dsdk_adapt_cast_x_b <= dupName_66_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_65_ip_dsdk_adapt_bitselect_x(BITSELECT,178)
    dupName_65_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(1007 downto 992);

    -- dupName_57_ip_dsdk_adapt_cast_x(BITSELECT,163)
    dupName_57_ip_dsdk_adapt_cast_x_b <= dupName_65_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_64_ip_dsdk_adapt_bitselect_x(BITSELECT,176)
    dupName_64_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(991 downto 976);

    -- dupName_56_ip_dsdk_adapt_cast_x(BITSELECT,161)
    dupName_56_ip_dsdk_adapt_cast_x_b <= dupName_64_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_63_ip_dsdk_adapt_bitselect_x(BITSELECT,174)
    dupName_63_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(975 downto 960);

    -- dupName_55_ip_dsdk_adapt_cast_x(BITSELECT,159)
    dupName_55_ip_dsdk_adapt_cast_x_b <= dupName_63_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_62_ip_dsdk_adapt_bitselect_x(BITSELECT,172)
    dupName_62_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(959 downto 944);

    -- dupName_54_ip_dsdk_adapt_cast_x(BITSELECT,157)
    dupName_54_ip_dsdk_adapt_cast_x_b <= dupName_62_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_61_ip_dsdk_adapt_bitselect_x(BITSELECT,170)
    dupName_61_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(943 downto 928);

    -- dupName_53_ip_dsdk_adapt_cast_x(BITSELECT,155)
    dupName_53_ip_dsdk_adapt_cast_x_b <= dupName_61_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_60_ip_dsdk_adapt_bitselect_x(BITSELECT,168)
    dupName_60_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(927 downto 912);

    -- dupName_52_ip_dsdk_adapt_cast_x(BITSELECT,153)
    dupName_52_ip_dsdk_adapt_cast_x_b <= dupName_60_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_59_ip_dsdk_adapt_bitselect_x(BITSELECT,166)
    dupName_59_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(911 downto 896);

    -- dupName_51_ip_dsdk_adapt_cast_x(BITSELECT,151)
    dupName_51_ip_dsdk_adapt_cast_x_b <= dupName_59_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_58_ip_dsdk_adapt_bitselect_x(BITSELECT,164)
    dupName_58_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(895 downto 880);

    -- dupName_50_ip_dsdk_adapt_cast_x(BITSELECT,149)
    dupName_50_ip_dsdk_adapt_cast_x_b <= dupName_58_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_57_ip_dsdk_adapt_bitselect_x(BITSELECT,162)
    dupName_57_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(879 downto 864);

    -- dupName_49_ip_dsdk_adapt_cast_x(BITSELECT,147)
    dupName_49_ip_dsdk_adapt_cast_x_b <= dupName_57_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_56_ip_dsdk_adapt_bitselect_x(BITSELECT,160)
    dupName_56_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(863 downto 848);

    -- dupName_48_ip_dsdk_adapt_cast_x(BITSELECT,145)
    dupName_48_ip_dsdk_adapt_cast_x_b <= dupName_56_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_55_ip_dsdk_adapt_bitselect_x(BITSELECT,158)
    dupName_55_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(847 downto 832);

    -- dupName_47_ip_dsdk_adapt_cast_x(BITSELECT,143)
    dupName_47_ip_dsdk_adapt_cast_x_b <= dupName_55_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_54_ip_dsdk_adapt_bitselect_x(BITSELECT,156)
    dupName_54_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(831 downto 816);

    -- dupName_46_ip_dsdk_adapt_cast_x(BITSELECT,141)
    dupName_46_ip_dsdk_adapt_cast_x_b <= dupName_54_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_53_ip_dsdk_adapt_bitselect_x(BITSELECT,154)
    dupName_53_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(815 downto 800);

    -- dupName_45_ip_dsdk_adapt_cast_x(BITSELECT,139)
    dupName_45_ip_dsdk_adapt_cast_x_b <= dupName_53_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_52_ip_dsdk_adapt_bitselect_x(BITSELECT,152)
    dupName_52_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(799 downto 784);

    -- dupName_44_ip_dsdk_adapt_cast_x(BITSELECT,137)
    dupName_44_ip_dsdk_adapt_cast_x_b <= dupName_52_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_51_ip_dsdk_adapt_bitselect_x(BITSELECT,150)
    dupName_51_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(783 downto 768);

    -- dupName_43_ip_dsdk_adapt_cast_x(BITSELECT,135)
    dupName_43_ip_dsdk_adapt_cast_x_b <= dupName_51_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_50_ip_dsdk_adapt_bitselect_x(BITSELECT,148)
    dupName_50_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(767 downto 752);

    -- dupName_42_ip_dsdk_adapt_cast_x(BITSELECT,133)
    dupName_42_ip_dsdk_adapt_cast_x_b <= dupName_50_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_49_ip_dsdk_adapt_bitselect_x(BITSELECT,146)
    dupName_49_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(751 downto 736);

    -- dupName_41_ip_dsdk_adapt_cast_x(BITSELECT,131)
    dupName_41_ip_dsdk_adapt_cast_x_b <= dupName_49_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_48_ip_dsdk_adapt_bitselect_x(BITSELECT,144)
    dupName_48_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(735 downto 720);

    -- dupName_40_ip_dsdk_adapt_cast_x(BITSELECT,129)
    dupName_40_ip_dsdk_adapt_cast_x_b <= dupName_48_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_47_ip_dsdk_adapt_bitselect_x(BITSELECT,142)
    dupName_47_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(719 downto 704);

    -- dupName_39_ip_dsdk_adapt_cast_x(BITSELECT,127)
    dupName_39_ip_dsdk_adapt_cast_x_b <= dupName_47_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_46_ip_dsdk_adapt_bitselect_x(BITSELECT,140)
    dupName_46_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(703 downto 688);

    -- dupName_38_ip_dsdk_adapt_cast_x(BITSELECT,125)
    dupName_38_ip_dsdk_adapt_cast_x_b <= dupName_46_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_45_ip_dsdk_adapt_bitselect_x(BITSELECT,138)
    dupName_45_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(687 downto 672);

    -- dupName_37_ip_dsdk_adapt_cast_x(BITSELECT,123)
    dupName_37_ip_dsdk_adapt_cast_x_b <= dupName_45_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_44_ip_dsdk_adapt_bitselect_x(BITSELECT,136)
    dupName_44_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(671 downto 656);

    -- dupName_36_ip_dsdk_adapt_cast_x(BITSELECT,121)
    dupName_36_ip_dsdk_adapt_cast_x_b <= dupName_44_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_43_ip_dsdk_adapt_bitselect_x(BITSELECT,134)
    dupName_43_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(655 downto 640);

    -- dupName_35_ip_dsdk_adapt_cast_x(BITSELECT,119)
    dupName_35_ip_dsdk_adapt_cast_x_b <= dupName_43_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_42_ip_dsdk_adapt_bitselect_x(BITSELECT,132)
    dupName_42_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(639 downto 624);

    -- dupName_34_ip_dsdk_adapt_cast_x(BITSELECT,117)
    dupName_34_ip_dsdk_adapt_cast_x_b <= dupName_42_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_41_ip_dsdk_adapt_bitselect_x(BITSELECT,130)
    dupName_41_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(623 downto 608);

    -- dupName_33_ip_dsdk_adapt_cast_x(BITSELECT,115)
    dupName_33_ip_dsdk_adapt_cast_x_b <= dupName_41_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_40_ip_dsdk_adapt_bitselect_x(BITSELECT,128)
    dupName_40_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(607 downto 592);

    -- dupName_32_ip_dsdk_adapt_cast_x(BITSELECT,113)
    dupName_32_ip_dsdk_adapt_cast_x_b <= dupName_40_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_39_ip_dsdk_adapt_bitselect_x(BITSELECT,126)
    dupName_39_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(591 downto 576);

    -- dupName_31_ip_dsdk_adapt_cast_x(BITSELECT,111)
    dupName_31_ip_dsdk_adapt_cast_x_b <= dupName_39_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_38_ip_dsdk_adapt_bitselect_x(BITSELECT,124)
    dupName_38_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(575 downto 560);

    -- dupName_30_ip_dsdk_adapt_cast_x(BITSELECT,109)
    dupName_30_ip_dsdk_adapt_cast_x_b <= dupName_38_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_37_ip_dsdk_adapt_bitselect_x(BITSELECT,122)
    dupName_37_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(559 downto 544);

    -- dupName_29_ip_dsdk_adapt_cast_x(BITSELECT,107)
    dupName_29_ip_dsdk_adapt_cast_x_b <= dupName_37_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_36_ip_dsdk_adapt_bitselect_x(BITSELECT,120)
    dupName_36_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(543 downto 528);

    -- dupName_28_ip_dsdk_adapt_cast_x(BITSELECT,105)
    dupName_28_ip_dsdk_adapt_cast_x_b <= dupName_36_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_35_ip_dsdk_adapt_bitselect_x(BITSELECT,118)
    dupName_35_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(527 downto 512);

    -- dupName_27_ip_dsdk_adapt_cast_x(BITSELECT,103)
    dupName_27_ip_dsdk_adapt_cast_x_b <= dupName_35_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_34_ip_dsdk_adapt_bitselect_x(BITSELECT,116)
    dupName_34_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(511 downto 496);

    -- dupName_26_ip_dsdk_adapt_cast_x(BITSELECT,101)
    dupName_26_ip_dsdk_adapt_cast_x_b <= dupName_34_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_33_ip_dsdk_adapt_bitselect_x(BITSELECT,114)
    dupName_33_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(495 downto 480);

    -- dupName_25_ip_dsdk_adapt_cast_x(BITSELECT,99)
    dupName_25_ip_dsdk_adapt_cast_x_b <= dupName_33_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_32_ip_dsdk_adapt_bitselect_x(BITSELECT,112)
    dupName_32_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(479 downto 464);

    -- dupName_24_ip_dsdk_adapt_cast_x(BITSELECT,97)
    dupName_24_ip_dsdk_adapt_cast_x_b <= dupName_32_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_31_ip_dsdk_adapt_bitselect_x(BITSELECT,110)
    dupName_31_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(463 downto 448);

    -- dupName_23_ip_dsdk_adapt_cast_x(BITSELECT,95)
    dupName_23_ip_dsdk_adapt_cast_x_b <= dupName_31_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_30_ip_dsdk_adapt_bitselect_x(BITSELECT,108)
    dupName_30_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(447 downto 432);

    -- dupName_22_ip_dsdk_adapt_cast_x(BITSELECT,93)
    dupName_22_ip_dsdk_adapt_cast_x_b <= dupName_30_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_29_ip_dsdk_adapt_bitselect_x(BITSELECT,106)
    dupName_29_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(431 downto 416);

    -- dupName_21_ip_dsdk_adapt_cast_x(BITSELECT,91)
    dupName_21_ip_dsdk_adapt_cast_x_b <= dupName_29_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_28_ip_dsdk_adapt_bitselect_x(BITSELECT,104)
    dupName_28_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(415 downto 400);

    -- dupName_20_ip_dsdk_adapt_cast_x(BITSELECT,89)
    dupName_20_ip_dsdk_adapt_cast_x_b <= dupName_28_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_27_ip_dsdk_adapt_bitselect_x(BITSELECT,102)
    dupName_27_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(399 downto 384);

    -- dupName_19_ip_dsdk_adapt_cast_x(BITSELECT,87)
    dupName_19_ip_dsdk_adapt_cast_x_b <= dupName_27_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_26_ip_dsdk_adapt_bitselect_x(BITSELECT,100)
    dupName_26_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(383 downto 368);

    -- dupName_18_ip_dsdk_adapt_cast_x(BITSELECT,85)
    dupName_18_ip_dsdk_adapt_cast_x_b <= dupName_26_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_25_ip_dsdk_adapt_bitselect_x(BITSELECT,98)
    dupName_25_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(367 downto 352);

    -- dupName_17_ip_dsdk_adapt_cast_x(BITSELECT,83)
    dupName_17_ip_dsdk_adapt_cast_x_b <= dupName_25_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_24_ip_dsdk_adapt_bitselect_x(BITSELECT,96)
    dupName_24_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(351 downto 336);

    -- dupName_16_ip_dsdk_adapt_cast_x(BITSELECT,81)
    dupName_16_ip_dsdk_adapt_cast_x_b <= dupName_24_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_23_ip_dsdk_adapt_bitselect_x(BITSELECT,94)
    dupName_23_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(335 downto 320);

    -- dupName_15_ip_dsdk_adapt_cast_x(BITSELECT,79)
    dupName_15_ip_dsdk_adapt_cast_x_b <= dupName_23_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_22_ip_dsdk_adapt_bitselect_x(BITSELECT,92)
    dupName_22_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(319 downto 304);

    -- dupName_14_ip_dsdk_adapt_cast_x(BITSELECT,77)
    dupName_14_ip_dsdk_adapt_cast_x_b <= dupName_22_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_21_ip_dsdk_adapt_bitselect_x(BITSELECT,90)
    dupName_21_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(303 downto 288);

    -- dupName_13_ip_dsdk_adapt_cast_x(BITSELECT,75)
    dupName_13_ip_dsdk_adapt_cast_x_b <= dupName_21_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_20_ip_dsdk_adapt_bitselect_x(BITSELECT,88)
    dupName_20_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(287 downto 272);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,70)
    dupName_12_ip_dsdk_adapt_cast_x_b <= dupName_20_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_19_ip_dsdk_adapt_bitselect_x(BITSELECT,86)
    dupName_19_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(271 downto 256);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,65)
    dupName_11_ip_dsdk_adapt_cast_x_b <= dupName_19_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_18_ip_dsdk_adapt_bitselect_x(BITSELECT,84)
    dupName_18_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(255 downto 240);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,60)
    dupName_10_ip_dsdk_adapt_cast_x_b <= dupName_18_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_17_ip_dsdk_adapt_bitselect_x(BITSELECT,82)
    dupName_17_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(239 downto 224);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,55)
    dupName_9_ip_dsdk_adapt_cast_x_b <= dupName_17_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_16_ip_dsdk_adapt_bitselect_x(BITSELECT,80)
    dupName_16_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(223 downto 208);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,50)
    dupName_8_ip_dsdk_adapt_cast_x_b <= dupName_16_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_15_ip_dsdk_adapt_bitselect_x(BITSELECT,78)
    dupName_15_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(207 downto 192);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,45)
    dupName_7_ip_dsdk_adapt_cast_x_b <= dupName_15_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,76)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(191 downto 176);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,40)
    dupName_6_ip_dsdk_adapt_cast_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,74)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(175 downto 160);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,35)
    dupName_5_ip_dsdk_adapt_cast_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,69)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(159 downto 144);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,30)
    dupName_4_ip_dsdk_adapt_cast_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,64)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(143 downto 128);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,25)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,59)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(127 downto 112);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,20)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_10_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,54)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(111 downto 96);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,15)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,49)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(95 downto 80);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,9)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_8_ip_dsdk_adapt_bitselect_x_b(15 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,44)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(64 downto 64);

    -- dupName_6_adapt_scalar_trunc_x(ROUND,36)
    dupName_6_adapt_scalar_trunc_x_in <= dupName_7_ip_dsdk_adapt_bitselect_x_b;
    dupName_6_adapt_scalar_trunc_x_q <= dupName_6_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,39)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(56 downto 56);

    -- dupName_5_adapt_scalar_trunc_x(ROUND,31)
    dupName_5_adapt_scalar_trunc_x_in <= dupName_6_ip_dsdk_adapt_bitselect_x_b;
    dupName_5_adapt_scalar_trunc_x_q <= dupName_5_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,34)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(48 downto 48);

    -- dupName_4_adapt_scalar_trunc_x(ROUND,26)
    dupName_4_adapt_scalar_trunc_x_in <= dupName_5_ip_dsdk_adapt_bitselect_x_b;
    dupName_4_adapt_scalar_trunc_x_q <= dupName_4_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,29)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(40 downto 40);

    -- dupName_3_adapt_scalar_trunc_x(ROUND,21)
    dupName_3_adapt_scalar_trunc_x_in <= dupName_4_ip_dsdk_adapt_bitselect_x_b;
    dupName_3_adapt_scalar_trunc_x_q <= dupName_3_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,24)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(32 downto 32);

    -- dupName_2_adapt_scalar_trunc_x(ROUND,16)
    dupName_2_adapt_scalar_trunc_x_in <= dupName_3_ip_dsdk_adapt_bitselect_x_b;
    dupName_2_adapt_scalar_trunc_x_q <= dupName_2_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,19)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(31 downto 24);

    -- ip_dsdk_adapt_cast(BITSELECT,472)
    ip_dsdk_adapt_cast_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(7 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,14)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(16 downto 16);

    -- dupName_1_adapt_scalar_trunc_x(ROUND,10)
    dupName_1_adapt_scalar_trunc_x_in <= dupName_1_ip_dsdk_adapt_bitselect_x_b;
    dupName_1_adapt_scalar_trunc_x_q <= dupName_1_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,8)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(8 downto 8);

    -- dupName_0_adapt_scalar_trunc_x(ROUND,4)
    dupName_0_adapt_scalar_trunc_x_in <= dupName_0_ip_dsdk_adapt_bitselect_x_b;
    dupName_0_adapt_scalar_trunc_x_q <= dupName_0_adapt_scalar_trunc_x_in(0 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,471)
    ip_dsdk_adapt_bitselect_b <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_data_out(0 downto 0);

    -- adapt_scalar_trunc(ROUND,463)
    adapt_scalar_trunc_in <= ip_dsdk_adapt_bitselect_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= adapt_scalar_trunc_q;
    out_data_out_1 <= dupName_0_adapt_scalar_trunc_x_q;
    out_data_out_2 <= dupName_1_adapt_scalar_trunc_x_q;
    out_data_out_3 <= ip_dsdk_adapt_cast_b;
    out_data_out_4 <= dupName_2_adapt_scalar_trunc_x_q;
    out_data_out_5 <= dupName_3_adapt_scalar_trunc_x_q;
    out_data_out_6 <= dupName_4_adapt_scalar_trunc_x_q;
    out_data_out_7 <= dupName_5_adapt_scalar_trunc_x_q;
    out_data_out_8 <= dupName_6_adapt_scalar_trunc_x_q;
    out_data_out_9 <= dupName_0_ip_dsdk_adapt_cast_x_b;
    out_data_out_10 <= dupName_1_ip_dsdk_adapt_cast_x_b;
    out_data_out_11 <= dupName_2_ip_dsdk_adapt_cast_x_b;
    out_data_out_12 <= dupName_3_ip_dsdk_adapt_cast_x_b;
    out_data_out_13 <= dupName_4_ip_dsdk_adapt_cast_x_b;
    out_data_out_14 <= dupName_5_ip_dsdk_adapt_cast_x_b;
    out_data_out_15 <= dupName_6_ip_dsdk_adapt_cast_x_b;
    out_data_out_16 <= dupName_7_ip_dsdk_adapt_cast_x_b;
    out_data_out_17 <= dupName_8_ip_dsdk_adapt_cast_x_b;
    out_data_out_18 <= dupName_9_ip_dsdk_adapt_cast_x_b;
    out_data_out_19 <= dupName_10_ip_dsdk_adapt_cast_x_b;
    out_data_out_20 <= dupName_11_ip_dsdk_adapt_cast_x_b;
    out_data_out_21 <= dupName_12_ip_dsdk_adapt_cast_x_b;
    out_data_out_22 <= dupName_13_ip_dsdk_adapt_cast_x_b;
    out_data_out_23 <= dupName_14_ip_dsdk_adapt_cast_x_b;
    out_data_out_24 <= dupName_15_ip_dsdk_adapt_cast_x_b;
    out_data_out_25 <= dupName_16_ip_dsdk_adapt_cast_x_b;
    out_data_out_26 <= dupName_17_ip_dsdk_adapt_cast_x_b;
    out_data_out_27 <= dupName_18_ip_dsdk_adapt_cast_x_b;
    out_data_out_28 <= dupName_19_ip_dsdk_adapt_cast_x_b;
    out_data_out_29 <= dupName_20_ip_dsdk_adapt_cast_x_b;
    out_data_out_30 <= dupName_21_ip_dsdk_adapt_cast_x_b;
    out_data_out_31 <= dupName_22_ip_dsdk_adapt_cast_x_b;
    out_data_out_32 <= dupName_23_ip_dsdk_adapt_cast_x_b;
    out_data_out_33 <= dupName_24_ip_dsdk_adapt_cast_x_b;
    out_data_out_34 <= dupName_25_ip_dsdk_adapt_cast_x_b;
    out_data_out_35 <= dupName_26_ip_dsdk_adapt_cast_x_b;
    out_data_out_36 <= dupName_27_ip_dsdk_adapt_cast_x_b;
    out_data_out_37 <= dupName_28_ip_dsdk_adapt_cast_x_b;
    out_data_out_38 <= dupName_29_ip_dsdk_adapt_cast_x_b;
    out_data_out_39 <= dupName_30_ip_dsdk_adapt_cast_x_b;
    out_data_out_40 <= dupName_31_ip_dsdk_adapt_cast_x_b;
    out_data_out_41 <= dupName_32_ip_dsdk_adapt_cast_x_b;
    out_data_out_42 <= dupName_33_ip_dsdk_adapt_cast_x_b;
    out_data_out_43 <= dupName_34_ip_dsdk_adapt_cast_x_b;
    out_data_out_44 <= dupName_35_ip_dsdk_adapt_cast_x_b;
    out_data_out_45 <= dupName_36_ip_dsdk_adapt_cast_x_b;
    out_data_out_46 <= dupName_37_ip_dsdk_adapt_cast_x_b;
    out_data_out_47 <= dupName_38_ip_dsdk_adapt_cast_x_b;
    out_data_out_48 <= dupName_39_ip_dsdk_adapt_cast_x_b;
    out_data_out_49 <= dupName_40_ip_dsdk_adapt_cast_x_b;
    out_data_out_50 <= dupName_41_ip_dsdk_adapt_cast_x_b;
    out_data_out_51 <= dupName_42_ip_dsdk_adapt_cast_x_b;
    out_data_out_52 <= dupName_43_ip_dsdk_adapt_cast_x_b;
    out_data_out_53 <= dupName_44_ip_dsdk_adapt_cast_x_b;
    out_data_out_54 <= dupName_45_ip_dsdk_adapt_cast_x_b;
    out_data_out_55 <= dupName_46_ip_dsdk_adapt_cast_x_b;
    out_data_out_56 <= dupName_47_ip_dsdk_adapt_cast_x_b;
    out_data_out_57 <= dupName_48_ip_dsdk_adapt_cast_x_b;
    out_data_out_58 <= dupName_49_ip_dsdk_adapt_cast_x_b;
    out_data_out_59 <= dupName_50_ip_dsdk_adapt_cast_x_b;
    out_data_out_60 <= dupName_51_ip_dsdk_adapt_cast_x_b;
    out_data_out_61 <= dupName_52_ip_dsdk_adapt_cast_x_b;
    out_data_out_62 <= dupName_53_ip_dsdk_adapt_cast_x_b;
    out_data_out_63 <= dupName_54_ip_dsdk_adapt_cast_x_b;
    out_data_out_64 <= dupName_55_ip_dsdk_adapt_cast_x_b;
    out_data_out_65 <= dupName_56_ip_dsdk_adapt_cast_x_b;
    out_data_out_66 <= dupName_57_ip_dsdk_adapt_cast_x_b;
    out_data_out_67 <= dupName_58_ip_dsdk_adapt_cast_x_b;
    out_data_out_68 <= dupName_59_ip_dsdk_adapt_cast_x_b;
    out_data_out_69 <= dupName_60_ip_dsdk_adapt_cast_x_b;
    out_data_out_70 <= dupName_61_ip_dsdk_adapt_cast_x_b;
    out_data_out_71 <= dupName_62_ip_dsdk_adapt_cast_x_b;
    out_data_out_72 <= dupName_63_ip_dsdk_adapt_cast_x_b;
    out_data_out_73 <= dupName_64_ip_dsdk_adapt_cast_x_b;
    out_data_out_74 <= dupName_65_ip_dsdk_adapt_cast_x_b;
    out_data_out_75 <= dupName_66_ip_dsdk_adapt_cast_x_b;
    out_data_out_76 <= dupName_67_ip_dsdk_adapt_cast_x_b;
    out_data_out_77 <= dupName_68_ip_dsdk_adapt_cast_x_b;
    out_data_out_78 <= dupName_69_ip_dsdk_adapt_cast_x_b;
    out_data_out_79 <= dupName_70_ip_dsdk_adapt_cast_x_b;
    out_data_out_80 <= dupName_71_ip_dsdk_adapt_cast_x_b;
    out_data_out_81 <= dupName_72_ip_dsdk_adapt_cast_x_b;
    out_data_out_82 <= dupName_73_ip_dsdk_adapt_cast_x_b;
    out_data_out_83 <= dupName_74_ip_dsdk_adapt_cast_x_b;
    out_data_out_84 <= dupName_75_ip_dsdk_adapt_cast_x_b;
    out_data_out_85 <= dupName_76_ip_dsdk_adapt_cast_x_b;
    out_data_out_86 <= dupName_77_ip_dsdk_adapt_cast_x_b;
    out_data_out_87 <= dupName_78_ip_dsdk_adapt_cast_x_b;
    out_data_out_88 <= dupName_79_ip_dsdk_adapt_cast_x_b;
    out_data_out_89 <= dupName_80_ip_dsdk_adapt_cast_x_b;
    out_data_out_90 <= dupName_81_ip_dsdk_adapt_cast_x_b;
    out_data_out_91 <= dupName_82_ip_dsdk_adapt_cast_x_b;
    out_data_out_92 <= dupName_83_ip_dsdk_adapt_cast_x_b;
    out_data_out_93 <= dupName_84_ip_dsdk_adapt_cast_x_b;
    out_data_out_94 <= dupName_85_ip_dsdk_adapt_cast_x_b;
    out_data_out_95 <= dupName_86_ip_dsdk_adapt_cast_x_b;
    out_data_out_96 <= dupName_87_ip_dsdk_adapt_cast_x_b;
    out_data_out_97 <= dupName_88_ip_dsdk_adapt_cast_x_b;
    out_data_out_98 <= dupName_89_ip_dsdk_adapt_cast_x_b;
    out_data_out_99 <= dupName_90_ip_dsdk_adapt_cast_x_b;
    out_data_out_100 <= dupName_91_ip_dsdk_adapt_cast_x_b;
    out_data_out_101 <= dupName_92_ip_dsdk_adapt_cast_x_b;
    out_data_out_102 <= dupName_93_ip_dsdk_adapt_cast_x_b;
    out_data_out_103 <= dupName_94_ip_dsdk_adapt_cast_x_b;
    out_data_out_104 <= dupName_95_ip_dsdk_adapt_cast_x_b;
    out_data_out_105 <= dupName_96_ip_dsdk_adapt_cast_x_b;
    out_data_out_106 <= dupName_97_ip_dsdk_adapt_cast_x_b;
    out_data_out_107 <= dupName_98_ip_dsdk_adapt_cast_x_b;
    out_data_out_108 <= dupName_99_ip_dsdk_adapt_cast_x_b;
    out_data_out_109 <= dupName_100_ip_dsdk_adapt_cast_x_b;
    out_data_out_110 <= dupName_101_ip_dsdk_adapt_cast_x_b;
    out_data_out_111 <= dupName_102_ip_dsdk_adapt_cast_x_b;
    out_data_out_112 <= dupName_7_adapt_scalar_trunc_x_q;
    out_data_out_113 <= dupName_103_ip_dsdk_adapt_cast_x_b;
    out_data_out_114 <= dupName_104_ip_dsdk_adapt_cast_x_b;
    out_data_out_115 <= dupName_105_ip_dsdk_adapt_cast_x_b;
    out_data_out_116 <= dupName_106_ip_dsdk_adapt_cast_x_b;
    out_data_out_117 <= dupName_107_ip_dsdk_adapt_cast_x_b;
    out_data_out_118 <= dupName_108_ip_dsdk_adapt_cast_x_b;
    out_data_out_119 <= dupName_109_ip_dsdk_adapt_cast_x_b;
    out_data_out_120 <= dupName_110_ip_dsdk_adapt_cast_x_b;
    out_data_out_121 <= dupName_111_ip_dsdk_adapt_cast_x_b;
    out_data_out_122 <= dupName_112_ip_dsdk_adapt_cast_x_b;
    out_data_out_123 <= dupName_113_ip_dsdk_adapt_cast_x_b;
    out_data_out_124 <= dupName_114_ip_dsdk_adapt_cast_x_b;
    out_data_out_125 <= dupName_115_ip_dsdk_adapt_cast_x_b;
    out_data_out_126 <= dupName_116_ip_dsdk_adapt_cast_x_b;
    out_data_out_127 <= dupName_117_ip_dsdk_adapt_cast_x_b;
    out_data_out_128 <= dupName_118_ip_dsdk_adapt_cast_x_b;
    out_data_out_129 <= dupName_119_ip_dsdk_adapt_cast_x_b;
    out_data_out_130 <= dupName_120_ip_dsdk_adapt_cast_x_b;
    out_data_out_131 <= dupName_121_ip_dsdk_adapt_cast_x_b;
    out_data_out_132 <= dupName_122_ip_dsdk_adapt_cast_x_b;
    out_data_out_133 <= dupName_123_ip_dsdk_adapt_cast_x_b;
    out_data_out_134 <= dupName_124_ip_dsdk_adapt_cast_x_b;
    out_data_out_135 <= dupName_125_ip_dsdk_adapt_cast_x_b;
    out_data_out_136 <= dupName_126_ip_dsdk_adapt_cast_x_b;
    out_data_out_137 <= dupName_127_ip_dsdk_adapt_cast_x_b;
    out_data_out_138 <= dupName_128_ip_dsdk_adapt_cast_x_b;
    out_data_out_139 <= dupName_129_ip_dsdk_adapt_cast_x_b;
    out_data_out_140 <= dupName_130_ip_dsdk_adapt_cast_x_b;
    out_data_out_141 <= dupName_131_ip_dsdk_adapt_cast_x_b;
    out_data_out_142 <= dupName_132_ip_dsdk_adapt_cast_x_b;
    out_data_out_143 <= dupName_133_ip_dsdk_adapt_cast_x_b;
    out_data_out_144 <= dupName_134_ip_dsdk_adapt_cast_x_b;
    out_data_out_145 <= dupName_135_ip_dsdk_adapt_cast_x_b;
    out_data_out_146 <= dupName_136_ip_dsdk_adapt_cast_x_b;
    out_data_out_147 <= dupName_137_ip_dsdk_adapt_cast_x_b;
    out_data_out_148 <= dupName_138_ip_dsdk_adapt_cast_x_b;
    out_data_out_149 <= dupName_139_ip_dsdk_adapt_cast_x_b;
    out_data_out_150 <= dupName_140_ip_dsdk_adapt_cast_x_b;
    out_data_out_151 <= dupName_141_ip_dsdk_adapt_cast_x_b;
    out_data_out_152 <= dupName_142_ip_dsdk_adapt_cast_x_b;
    out_data_out_153 <= dupName_143_ip_dsdk_adapt_cast_x_b;
    out_data_out_154 <= dupName_144_ip_dsdk_adapt_cast_x_b;
    out_data_out_155 <= dupName_145_ip_dsdk_adapt_cast_x_b;
    out_data_out_156 <= dupName_146_ip_dsdk_adapt_cast_x_b;
    out_data_out_157 <= dupName_147_ip_dsdk_adapt_cast_x_b;
    out_data_out_158 <= dupName_148_ip_dsdk_adapt_cast_x_b;
    out_data_out_159 <= dupName_149_ip_dsdk_adapt_cast_x_b;
    out_data_out_160 <= dupName_150_ip_dsdk_adapt_cast_x_b;
    out_data_out_161 <= dupName_151_ip_dsdk_adapt_cast_x_b;
    out_data_out_162 <= dupName_152_ip_dsdk_adapt_cast_x_b;
    out_data_out_163 <= dupName_153_ip_dsdk_adapt_cast_x_b;
    out_data_out_164 <= dupName_154_ip_dsdk_adapt_cast_x_b;
    out_data_out_165 <= dupName_155_ip_dsdk_adapt_cast_x_b;
    out_data_out_166 <= dupName_156_ip_dsdk_adapt_cast_x_b;
    out_data_out_167 <= dupName_157_ip_dsdk_adapt_cast_x_b;
    out_data_out_168 <= dupName_158_ip_dsdk_adapt_cast_x_b;
    out_data_out_169 <= dupName_159_ip_dsdk_adapt_cast_x_b;
    out_data_out_170 <= dupName_160_ip_dsdk_adapt_cast_x_b;
    out_data_out_171 <= dupName_161_ip_dsdk_adapt_cast_x_b;
    out_data_out_172 <= dupName_162_ip_dsdk_adapt_cast_x_b;
    out_data_out_173 <= dupName_163_ip_dsdk_adapt_cast_x_b;
    out_data_out_174 <= dupName_164_ip_dsdk_adapt_cast_x_b;
    out_data_out_175 <= dupName_165_ip_dsdk_adapt_cast_x_b;
    out_data_out_176 <= dupName_166_ip_dsdk_adapt_cast_x_b;
    out_data_out_177 <= dupName_167_ip_dsdk_adapt_cast_x_b;
    out_data_out_178 <= dupName_168_ip_dsdk_adapt_cast_x_b;
    out_data_out_179 <= dupName_169_ip_dsdk_adapt_cast_x_b;
    out_data_out_180 <= dupName_170_ip_dsdk_adapt_cast_x_b;
    out_data_out_181 <= dupName_171_ip_dsdk_adapt_cast_x_b;
    out_data_out_182 <= dupName_172_ip_dsdk_adapt_cast_x_b;
    out_data_out_183 <= dupName_173_ip_dsdk_adapt_cast_x_b;
    out_data_out_184 <= dupName_174_ip_dsdk_adapt_cast_x_b;
    out_data_out_185 <= dupName_175_ip_dsdk_adapt_cast_x_b;
    out_data_out_186 <= dupName_176_ip_dsdk_adapt_cast_x_b;
    out_data_out_187 <= dupName_177_ip_dsdk_adapt_cast_x_b;
    out_data_out_188 <= dupName_178_ip_dsdk_adapt_cast_x_b;
    out_data_out_189 <= dupName_179_ip_dsdk_adapt_cast_x_b;
    out_data_out_190 <= dupName_180_ip_dsdk_adapt_cast_x_b;
    out_data_out_191 <= dupName_181_ip_dsdk_adapt_cast_x_b;
    out_data_out_192 <= dupName_182_ip_dsdk_adapt_cast_x_b;
    out_data_out_193 <= dupName_183_ip_dsdk_adapt_cast_x_b;
    out_data_out_194 <= dupName_184_ip_dsdk_adapt_cast_x_b;
    out_data_out_195 <= dupName_185_ip_dsdk_adapt_cast_x_b;
    out_data_out_196 <= dupName_186_ip_dsdk_adapt_cast_x_b;
    out_data_out_197 <= dupName_187_ip_dsdk_adapt_cast_x_b;
    out_data_out_198 <= dupName_188_ip_dsdk_adapt_cast_x_b;
    out_data_out_199 <= dupName_189_ip_dsdk_adapt_cast_x_b;
    out_data_out_200 <= dupName_190_ip_dsdk_adapt_cast_x_b;
    out_data_out_201 <= dupName_191_ip_dsdk_adapt_cast_x_b;
    out_data_out_202 <= dupName_192_ip_dsdk_adapt_cast_x_b;
    out_data_out_203 <= dupName_193_ip_dsdk_adapt_cast_x_b;
    out_data_out_204 <= dupName_194_ip_dsdk_adapt_cast_x_b;
    out_data_out_205 <= dupName_195_ip_dsdk_adapt_cast_x_b;
    out_data_out_206 <= dupName_196_ip_dsdk_adapt_cast_x_b;
    out_data_out_207 <= dupName_197_ip_dsdk_adapt_cast_x_b;
    out_data_out_208 <= dupName_198_ip_dsdk_adapt_cast_x_b;
    out_data_out_209 <= dupName_8_adapt_scalar_trunc_x_q;
    out_data_out_210 <= dupName_9_adapt_scalar_trunc_x_q;
    out_data_out_211 <= dupName_10_adapt_scalar_trunc_x_q;
    out_data_out_212 <= dupName_11_adapt_scalar_trunc_x_q;
    out_data_out_213 <= dupName_12_adapt_scalar_trunc_x_q;
    out_data_out_214 <= dupName_199_ip_dsdk_adapt_cast_x_b;
    out_data_out_215 <= dupName_13_adapt_scalar_trunc_x_q;
    out_valid_out <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_valid_out;

    -- sync_out(GPOUT,474)@20000000
    out_stall_out <= i_acl_sfc_exit_c0_for_cond506_preheader_memread_c0_exit492_memread2609_stall_out;

END normal;
