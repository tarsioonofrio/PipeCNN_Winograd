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

-- VHDL created from i_sfc_c0_for_body510_memread_c0_enter725_memread
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

entity i_sfc_c0_for_body510_memread_c0_enter725_memread is
    port (
        in_c0_eni215_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_1 : in std_logic_vector(7 downto 0);  -- ufix8
        in_c0_eni215_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_3 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_4 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_5 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_6 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_7 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_8 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_9 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_10 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_11 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_12 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_13 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_14 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_15 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_16 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_17 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_18 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_19 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_20 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_21 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_22 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_23 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_24 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_25 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_26 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_27 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_28 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_29 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_30 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_31 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_32 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_33 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_34 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_35 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_36 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_37 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_38 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_39 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_40 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_41 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_42 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_43 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_44 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_45 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_46 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_47 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_48 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_49 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_50 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_51 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_52 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_53 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_54 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_55 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_56 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_57 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_58 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_59 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_60 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_61 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_62 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_63 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_64 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_65 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_66 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_67 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_68 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_69 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_70 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_71 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_72 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_73 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_74 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_75 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_76 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_77 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_78 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_79 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_80 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_81 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_82 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_83 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_84 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_85 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_86 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_87 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_88 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_89 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_90 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_91 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_92 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_93 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_94 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_95 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_96 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_97 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_98 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_99 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_100 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_101 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_102 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_103 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_104 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_105 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_106 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_107 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_108 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_109 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_110 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_111 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_112 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_113 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_114 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_115 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_116 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_117 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_118 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_119 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_120 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_121 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_122 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_123 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_124 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_125 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_126 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_127 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_128 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_129 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_130 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_131 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_132 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_133 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_134 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_135 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_136 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_137 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_138 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_139 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_140 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_141 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_142 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_143 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_144 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_145 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_146 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_147 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_148 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_149 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_150 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_151 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_152 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_153 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_154 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_155 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_156 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_157 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_158 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_159 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_160 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_161 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_162 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_163 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_164 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_165 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_166 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_167 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_168 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_169 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_170 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_171 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_172 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_173 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_174 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_175 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_176 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_177 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_178 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_179 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_180 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_181 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_182 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_183 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_184 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_185 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_186 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_187 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_188 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_189 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_190 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_191 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_192 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_193 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_194 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_195 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_196 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_197 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni215_198 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni215_199 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni215_200 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni215_201 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni215_202 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni215_203 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_204 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_205 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_206 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_207 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_208 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_209 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_210 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_211 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c0_eni215_212 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_213 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_214 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni215_215 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_7 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_12 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_15 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_17 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit967_18 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit967_19 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_20 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_21 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_22 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_23 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_24 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_25 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_26 : out std_logic_vector(15 downto 0);  -- ufix16
        out_c0_exit967_27 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_28 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_29 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit967_30 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_group_num_mul_win_size : in std_logic_vector(31 downto 0);  -- ufix32
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_for_body510_memread_c0_enter725_memread;

architecture normal of i_sfc_c0_for_body510_memread_c0_enter725_memread is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread2478 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_18 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_26 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_data_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_18 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_26 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_data_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582 is
        port (
            in_c0_eni215_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_c0_eni215_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_3 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_4 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_5 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_6 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_7 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_8 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_9 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_10 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_11 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_12 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_13 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_14 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_15 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_16 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_17 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_18 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_19 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_20 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_21 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_22 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_23 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_24 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_25 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_26 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_27 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_28 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_29 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_30 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_31 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_32 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_33 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_34 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_35 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_36 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_37 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_38 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_39 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_40 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_41 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_42 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_43 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_44 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_45 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_46 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_47 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_48 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_49 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_50 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_51 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_52 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_53 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_54 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_55 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_56 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_57 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_58 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_59 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_60 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_61 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_62 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_63 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_64 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_65 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_66 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_67 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_68 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_69 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_70 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_71 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_72 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_73 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_74 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_75 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_76 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_77 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_78 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_79 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_80 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_81 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_82 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_83 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_84 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_85 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_86 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_87 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_88 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_89 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_90 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_91 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_92 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_93 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_94 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_95 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_96 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_97 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_98 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_99 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_100 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_101 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_102 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_103 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_104 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_105 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_106 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_107 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_108 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_109 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_110 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_111 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_112 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_113 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_114 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_115 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_116 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_117 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_118 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_119 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_120 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_121 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_122 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_123 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_124 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_125 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_126 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_127 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_128 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_129 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_130 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_131 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_132 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_133 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_134 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_135 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_136 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_137 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_138 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_139 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_140 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_141 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_142 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_143 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_144 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_145 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_146 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_147 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_148 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_149 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_150 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_151 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_152 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_153 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_154 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_155 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_156 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_157 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_158 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_159 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_160 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_161 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_162 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_163 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_164 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_165 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_166 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_167 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_168 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_169 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_170 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_171 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_172 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_173 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_174 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_175 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_176 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_177 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_178 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_179 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_180 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_181 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_182 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_183 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_184 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_185 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_186 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_187 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_188 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_189 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_190 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_191 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_192 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_193 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_194 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_195 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_196 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_197 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni215_198 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni215_199 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni215_200 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni215_201 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni215_202 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni215_203 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_204 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_205 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_206 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_207 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_208 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_209 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_210 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_211 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c0_eni215_212 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_213 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_214 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni215_215 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_group_num_mul_win_size : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi30966_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi30966_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi30966_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi30966_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi30966_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi30966_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi30966_18 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi30966_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_26 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_c0_exi30966_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi30966_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_18 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_26 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_18 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_26 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,8)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,7)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x(BLACKBOX,6)@1
    -- out out_c0_exi30966_0@5
    -- out out_c0_exi30966_1@5
    -- out out_c0_exi30966_2@5
    -- out out_c0_exi30966_3@5
    -- out out_c0_exi30966_4@5
    -- out out_c0_exi30966_5@5
    -- out out_c0_exi30966_6@5
    -- out out_c0_exi30966_7@5
    -- out out_c0_exi30966_8@5
    -- out out_c0_exi30966_9@5
    -- out out_c0_exi30966_10@5
    -- out out_c0_exi30966_11@5
    -- out out_c0_exi30966_12@5
    -- out out_c0_exi30966_13@5
    -- out out_c0_exi30966_14@5
    -- out out_c0_exi30966_15@5
    -- out out_c0_exi30966_16@5
    -- out out_c0_exi30966_17@5
    -- out out_c0_exi30966_18@5
    -- out out_c0_exi30966_19@5
    -- out out_c0_exi30966_20@5
    -- out out_c0_exi30966_21@5
    -- out out_c0_exi30966_22@5
    -- out out_c0_exi30966_23@5
    -- out out_c0_exi30966_24@5
    -- out out_c0_exi30966_25@5
    -- out out_c0_exi30966_26@5
    -- out out_c0_exi30966_27@5
    -- out out_c0_exi30966_28@5
    -- out out_c0_exi30966_29@5
    -- out out_c0_exi30966_30@5
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_valid_out@20000000
    -- out out_o_valid@5
    -- out out_pipeline_valid_out@20000000
    thei_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x : i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582
    PORT MAP (
        in_c0_eni215_0 => in_c0_eni215_0,
        in_c0_eni215_1 => in_c0_eni215_1,
        in_c0_eni215_2 => in_c0_eni215_2,
        in_c0_eni215_3 => in_c0_eni215_3,
        in_c0_eni215_4 => in_c0_eni215_4,
        in_c0_eni215_5 => in_c0_eni215_5,
        in_c0_eni215_6 => in_c0_eni215_6,
        in_c0_eni215_7 => in_c0_eni215_7,
        in_c0_eni215_8 => in_c0_eni215_8,
        in_c0_eni215_9 => in_c0_eni215_9,
        in_c0_eni215_10 => in_c0_eni215_10,
        in_c0_eni215_11 => in_c0_eni215_11,
        in_c0_eni215_12 => in_c0_eni215_12,
        in_c0_eni215_13 => in_c0_eni215_13,
        in_c0_eni215_14 => in_c0_eni215_14,
        in_c0_eni215_15 => in_c0_eni215_15,
        in_c0_eni215_16 => in_c0_eni215_16,
        in_c0_eni215_17 => in_c0_eni215_17,
        in_c0_eni215_18 => in_c0_eni215_18,
        in_c0_eni215_19 => in_c0_eni215_19,
        in_c0_eni215_20 => in_c0_eni215_20,
        in_c0_eni215_21 => in_c0_eni215_21,
        in_c0_eni215_22 => in_c0_eni215_22,
        in_c0_eni215_23 => in_c0_eni215_23,
        in_c0_eni215_24 => in_c0_eni215_24,
        in_c0_eni215_25 => in_c0_eni215_25,
        in_c0_eni215_26 => in_c0_eni215_26,
        in_c0_eni215_27 => in_c0_eni215_27,
        in_c0_eni215_28 => in_c0_eni215_28,
        in_c0_eni215_29 => in_c0_eni215_29,
        in_c0_eni215_30 => in_c0_eni215_30,
        in_c0_eni215_31 => in_c0_eni215_31,
        in_c0_eni215_32 => in_c0_eni215_32,
        in_c0_eni215_33 => in_c0_eni215_33,
        in_c0_eni215_34 => in_c0_eni215_34,
        in_c0_eni215_35 => in_c0_eni215_35,
        in_c0_eni215_36 => in_c0_eni215_36,
        in_c0_eni215_37 => in_c0_eni215_37,
        in_c0_eni215_38 => in_c0_eni215_38,
        in_c0_eni215_39 => in_c0_eni215_39,
        in_c0_eni215_40 => in_c0_eni215_40,
        in_c0_eni215_41 => in_c0_eni215_41,
        in_c0_eni215_42 => in_c0_eni215_42,
        in_c0_eni215_43 => in_c0_eni215_43,
        in_c0_eni215_44 => in_c0_eni215_44,
        in_c0_eni215_45 => in_c0_eni215_45,
        in_c0_eni215_46 => in_c0_eni215_46,
        in_c0_eni215_47 => in_c0_eni215_47,
        in_c0_eni215_48 => in_c0_eni215_48,
        in_c0_eni215_49 => in_c0_eni215_49,
        in_c0_eni215_50 => in_c0_eni215_50,
        in_c0_eni215_51 => in_c0_eni215_51,
        in_c0_eni215_52 => in_c0_eni215_52,
        in_c0_eni215_53 => in_c0_eni215_53,
        in_c0_eni215_54 => in_c0_eni215_54,
        in_c0_eni215_55 => in_c0_eni215_55,
        in_c0_eni215_56 => in_c0_eni215_56,
        in_c0_eni215_57 => in_c0_eni215_57,
        in_c0_eni215_58 => in_c0_eni215_58,
        in_c0_eni215_59 => in_c0_eni215_59,
        in_c0_eni215_60 => in_c0_eni215_60,
        in_c0_eni215_61 => in_c0_eni215_61,
        in_c0_eni215_62 => in_c0_eni215_62,
        in_c0_eni215_63 => in_c0_eni215_63,
        in_c0_eni215_64 => in_c0_eni215_64,
        in_c0_eni215_65 => in_c0_eni215_65,
        in_c0_eni215_66 => in_c0_eni215_66,
        in_c0_eni215_67 => in_c0_eni215_67,
        in_c0_eni215_68 => in_c0_eni215_68,
        in_c0_eni215_69 => in_c0_eni215_69,
        in_c0_eni215_70 => in_c0_eni215_70,
        in_c0_eni215_71 => in_c0_eni215_71,
        in_c0_eni215_72 => in_c0_eni215_72,
        in_c0_eni215_73 => in_c0_eni215_73,
        in_c0_eni215_74 => in_c0_eni215_74,
        in_c0_eni215_75 => in_c0_eni215_75,
        in_c0_eni215_76 => in_c0_eni215_76,
        in_c0_eni215_77 => in_c0_eni215_77,
        in_c0_eni215_78 => in_c0_eni215_78,
        in_c0_eni215_79 => in_c0_eni215_79,
        in_c0_eni215_80 => in_c0_eni215_80,
        in_c0_eni215_81 => in_c0_eni215_81,
        in_c0_eni215_82 => in_c0_eni215_82,
        in_c0_eni215_83 => in_c0_eni215_83,
        in_c0_eni215_84 => in_c0_eni215_84,
        in_c0_eni215_85 => in_c0_eni215_85,
        in_c0_eni215_86 => in_c0_eni215_86,
        in_c0_eni215_87 => in_c0_eni215_87,
        in_c0_eni215_88 => in_c0_eni215_88,
        in_c0_eni215_89 => in_c0_eni215_89,
        in_c0_eni215_90 => in_c0_eni215_90,
        in_c0_eni215_91 => in_c0_eni215_91,
        in_c0_eni215_92 => in_c0_eni215_92,
        in_c0_eni215_93 => in_c0_eni215_93,
        in_c0_eni215_94 => in_c0_eni215_94,
        in_c0_eni215_95 => in_c0_eni215_95,
        in_c0_eni215_96 => in_c0_eni215_96,
        in_c0_eni215_97 => in_c0_eni215_97,
        in_c0_eni215_98 => in_c0_eni215_98,
        in_c0_eni215_99 => in_c0_eni215_99,
        in_c0_eni215_100 => in_c0_eni215_100,
        in_c0_eni215_101 => in_c0_eni215_101,
        in_c0_eni215_102 => in_c0_eni215_102,
        in_c0_eni215_103 => in_c0_eni215_103,
        in_c0_eni215_104 => in_c0_eni215_104,
        in_c0_eni215_105 => in_c0_eni215_105,
        in_c0_eni215_106 => in_c0_eni215_106,
        in_c0_eni215_107 => in_c0_eni215_107,
        in_c0_eni215_108 => in_c0_eni215_108,
        in_c0_eni215_109 => in_c0_eni215_109,
        in_c0_eni215_110 => in_c0_eni215_110,
        in_c0_eni215_111 => in_c0_eni215_111,
        in_c0_eni215_112 => in_c0_eni215_112,
        in_c0_eni215_113 => in_c0_eni215_113,
        in_c0_eni215_114 => in_c0_eni215_114,
        in_c0_eni215_115 => in_c0_eni215_115,
        in_c0_eni215_116 => in_c0_eni215_116,
        in_c0_eni215_117 => in_c0_eni215_117,
        in_c0_eni215_118 => in_c0_eni215_118,
        in_c0_eni215_119 => in_c0_eni215_119,
        in_c0_eni215_120 => in_c0_eni215_120,
        in_c0_eni215_121 => in_c0_eni215_121,
        in_c0_eni215_122 => in_c0_eni215_122,
        in_c0_eni215_123 => in_c0_eni215_123,
        in_c0_eni215_124 => in_c0_eni215_124,
        in_c0_eni215_125 => in_c0_eni215_125,
        in_c0_eni215_126 => in_c0_eni215_126,
        in_c0_eni215_127 => in_c0_eni215_127,
        in_c0_eni215_128 => in_c0_eni215_128,
        in_c0_eni215_129 => in_c0_eni215_129,
        in_c0_eni215_130 => in_c0_eni215_130,
        in_c0_eni215_131 => in_c0_eni215_131,
        in_c0_eni215_132 => in_c0_eni215_132,
        in_c0_eni215_133 => in_c0_eni215_133,
        in_c0_eni215_134 => in_c0_eni215_134,
        in_c0_eni215_135 => in_c0_eni215_135,
        in_c0_eni215_136 => in_c0_eni215_136,
        in_c0_eni215_137 => in_c0_eni215_137,
        in_c0_eni215_138 => in_c0_eni215_138,
        in_c0_eni215_139 => in_c0_eni215_139,
        in_c0_eni215_140 => in_c0_eni215_140,
        in_c0_eni215_141 => in_c0_eni215_141,
        in_c0_eni215_142 => in_c0_eni215_142,
        in_c0_eni215_143 => in_c0_eni215_143,
        in_c0_eni215_144 => in_c0_eni215_144,
        in_c0_eni215_145 => in_c0_eni215_145,
        in_c0_eni215_146 => in_c0_eni215_146,
        in_c0_eni215_147 => in_c0_eni215_147,
        in_c0_eni215_148 => in_c0_eni215_148,
        in_c0_eni215_149 => in_c0_eni215_149,
        in_c0_eni215_150 => in_c0_eni215_150,
        in_c0_eni215_151 => in_c0_eni215_151,
        in_c0_eni215_152 => in_c0_eni215_152,
        in_c0_eni215_153 => in_c0_eni215_153,
        in_c0_eni215_154 => in_c0_eni215_154,
        in_c0_eni215_155 => in_c0_eni215_155,
        in_c0_eni215_156 => in_c0_eni215_156,
        in_c0_eni215_157 => in_c0_eni215_157,
        in_c0_eni215_158 => in_c0_eni215_158,
        in_c0_eni215_159 => in_c0_eni215_159,
        in_c0_eni215_160 => in_c0_eni215_160,
        in_c0_eni215_161 => in_c0_eni215_161,
        in_c0_eni215_162 => in_c0_eni215_162,
        in_c0_eni215_163 => in_c0_eni215_163,
        in_c0_eni215_164 => in_c0_eni215_164,
        in_c0_eni215_165 => in_c0_eni215_165,
        in_c0_eni215_166 => in_c0_eni215_166,
        in_c0_eni215_167 => in_c0_eni215_167,
        in_c0_eni215_168 => in_c0_eni215_168,
        in_c0_eni215_169 => in_c0_eni215_169,
        in_c0_eni215_170 => in_c0_eni215_170,
        in_c0_eni215_171 => in_c0_eni215_171,
        in_c0_eni215_172 => in_c0_eni215_172,
        in_c0_eni215_173 => in_c0_eni215_173,
        in_c0_eni215_174 => in_c0_eni215_174,
        in_c0_eni215_175 => in_c0_eni215_175,
        in_c0_eni215_176 => in_c0_eni215_176,
        in_c0_eni215_177 => in_c0_eni215_177,
        in_c0_eni215_178 => in_c0_eni215_178,
        in_c0_eni215_179 => in_c0_eni215_179,
        in_c0_eni215_180 => in_c0_eni215_180,
        in_c0_eni215_181 => in_c0_eni215_181,
        in_c0_eni215_182 => in_c0_eni215_182,
        in_c0_eni215_183 => in_c0_eni215_183,
        in_c0_eni215_184 => in_c0_eni215_184,
        in_c0_eni215_185 => in_c0_eni215_185,
        in_c0_eni215_186 => in_c0_eni215_186,
        in_c0_eni215_187 => in_c0_eni215_187,
        in_c0_eni215_188 => in_c0_eni215_188,
        in_c0_eni215_189 => in_c0_eni215_189,
        in_c0_eni215_190 => in_c0_eni215_190,
        in_c0_eni215_191 => in_c0_eni215_191,
        in_c0_eni215_192 => in_c0_eni215_192,
        in_c0_eni215_193 => in_c0_eni215_193,
        in_c0_eni215_194 => in_c0_eni215_194,
        in_c0_eni215_195 => in_c0_eni215_195,
        in_c0_eni215_196 => in_c0_eni215_196,
        in_c0_eni215_197 => in_c0_eni215_197,
        in_c0_eni215_198 => in_c0_eni215_198,
        in_c0_eni215_199 => in_c0_eni215_199,
        in_c0_eni215_200 => in_c0_eni215_200,
        in_c0_eni215_201 => in_c0_eni215_201,
        in_c0_eni215_202 => in_c0_eni215_202,
        in_c0_eni215_203 => in_c0_eni215_203,
        in_c0_eni215_204 => in_c0_eni215_204,
        in_c0_eni215_205 => in_c0_eni215_205,
        in_c0_eni215_206 => in_c0_eni215_206,
        in_c0_eni215_207 => in_c0_eni215_207,
        in_c0_eni215_208 => in_c0_eni215_208,
        in_c0_eni215_209 => in_c0_eni215_209,
        in_c0_eni215_210 => in_c0_eni215_210,
        in_c0_eni215_211 => in_c0_eni215_211,
        in_c0_eni215_212 => in_c0_eni215_212,
        in_c0_eni215_213 => in_c0_eni215_213,
        in_c0_eni215_214 => in_c0_eni215_214,
        in_c0_eni215_215 => in_c0_eni215_215,
        in_group_num_mul_win_size => in_group_num_mul_win_size,
        in_i_valid => input_accepted_and_q,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exi30966_0 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_0,
        out_c0_exi30966_1 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_1,
        out_c0_exi30966_2 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_2,
        out_c0_exi30966_3 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_3,
        out_c0_exi30966_4 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_4,
        out_c0_exi30966_5 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_5,
        out_c0_exi30966_6 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_6,
        out_c0_exi30966_7 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_7,
        out_c0_exi30966_8 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_8,
        out_c0_exi30966_9 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_9,
        out_c0_exi30966_10 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_10,
        out_c0_exi30966_11 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_11,
        out_c0_exi30966_12 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_12,
        out_c0_exi30966_13 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_13,
        out_c0_exi30966_14 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_14,
        out_c0_exi30966_15 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_15,
        out_c0_exi30966_16 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_16,
        out_c0_exi30966_17 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_17,
        out_c0_exi30966_18 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_18,
        out_c0_exi30966_19 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_19,
        out_c0_exi30966_20 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_20,
        out_c0_exi30966_21 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_21,
        out_c0_exi30966_22 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_22,
        out_c0_exi30966_23 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_23,
        out_c0_exi30966_24 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_24,
        out_c0_exi30966_25 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_25,
        out_c0_exi30966_26 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_26,
        out_c0_exi30966_27 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_27,
        out_c0_exi30966_28 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_28,
        out_c0_exi30966_29 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_29,
        out_c0_exi30966_30 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_30,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_stall_out => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_valid_out => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_valid_out,
        out_o_valid => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x(BLACKBOX,5)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_data_out_2@20000003
    -- out out_data_out_3@20000003
    -- out out_data_out_4@20000003
    -- out out_data_out_5@20000003
    -- out out_data_out_6@20000003
    -- out out_data_out_7@20000003
    -- out out_data_out_8@20000003
    -- out out_data_out_9@20000003
    -- out out_data_out_10@20000003
    -- out out_data_out_11@20000003
    -- out out_data_out_12@20000003
    -- out out_data_out_13@20000003
    -- out out_data_out_14@20000003
    -- out out_data_out_15@20000003
    -- out out_data_out_16@20000003
    -- out out_data_out_17@20000003
    -- out out_data_out_18@20000003
    -- out out_data_out_19@20000003
    -- out out_data_out_20@20000003
    -- out out_data_out_21@20000003
    -- out out_data_out_22@20000003
    -- out out_data_out_23@20000003
    -- out out_data_out_24@20000003
    -- out out_data_out_25@20000003
    -- out out_data_out_26@20000003
    -- out out_data_out_27@20000003
    -- out out_data_out_28@20000003
    -- out out_data_out_29@20000003
    -- out out_data_out_30@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x : i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread2478
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_0,
        in_data_in_1 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_1,
        in_data_in_2 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_2,
        in_data_in_3 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_3,
        in_data_in_4 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_4,
        in_data_in_5 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_5,
        in_data_in_6 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_6,
        in_data_in_7 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_7,
        in_data_in_8 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_8,
        in_data_in_9 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_9,
        in_data_in_10 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_10,
        in_data_in_11 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_11,
        in_data_in_12 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_12,
        in_data_in_13 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_13,
        in_data_in_14 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_14,
        in_data_in_15 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_15,
        in_data_in_16 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_16,
        in_data_in_17 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_17,
        in_data_in_18 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_18,
        in_data_in_19 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_19,
        in_data_in_20 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_20,
        in_data_in_21 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_21,
        in_data_in_22 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_22,
        in_data_in_23 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_23,
        in_data_in_24 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_24,
        in_data_in_25 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_25,
        in_data_in_26 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_26,
        in_data_in_27 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_27,
        in_data_in_28 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_28,
        in_data_in_29 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_29,
        in_data_in_30 => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_c0_exi30966_30,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_13,
        out_data_out_14 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_14,
        out_data_out_15 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_15,
        out_data_out_16 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_16,
        out_data_out_17 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_17,
        out_data_out_18 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_18,
        out_data_out_19 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_19,
        out_data_out_20 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_20,
        out_data_out_21 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_21,
        out_data_out_22 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_22,
        out_data_out_23 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_23,
        out_data_out_24 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_24,
        out_data_out_25 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_25,
        out_data_out_26 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_26,
        out_data_out_27 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_27,
        out_data_out_28 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_28,
        out_data_out_29 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_29,
        out_data_out_30 => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_30,
        out_stall_entry => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@8
    out_c0_exit967_0 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_0;
    out_c0_exit967_1 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_1;
    out_c0_exit967_2 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_2;
    out_c0_exit967_3 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_3;
    out_c0_exit967_4 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_4;
    out_c0_exit967_5 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_5;
    out_c0_exit967_6 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_6;
    out_c0_exit967_7 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_7;
    out_c0_exit967_8 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_8;
    out_c0_exit967_9 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_9;
    out_c0_exit967_10 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_10;
    out_c0_exit967_11 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_11;
    out_c0_exit967_12 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_12;
    out_c0_exit967_13 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_13;
    out_c0_exit967_14 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_14;
    out_c0_exit967_15 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_15;
    out_c0_exit967_16 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_16;
    out_c0_exit967_17 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_17;
    out_c0_exit967_18 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_18;
    out_c0_exit967_19 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_19;
    out_c0_exit967_20 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_20;
    out_c0_exit967_21 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_21;
    out_c0_exit967_22 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_22;
    out_c0_exit967_23 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_23;
    out_c0_exit967_24 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_24;
    out_c0_exit967_25 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_25;
    out_c0_exit967_26 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_26;
    out_c0_exit967_27 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_27;
    out_c0_exit967_28 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_28;
    out_c0_exit967_29 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_29;
    out_c0_exit967_30 <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_data_out_30;
    out_o_valid <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_valid_out;

    -- dupName_0_regfree_osync_x(GPOUT,4)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_valid_out <= i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_valid_out;

    -- pipeline_valid_out_sync(GPOUT,10)
    out_pipeline_valid_out <= i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_pipeline_valid_out;

    -- regfree_osync(GPOUT,12)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_stall_out <= i_sfc_logic_c0_for_body510_memread_c0_enter725_memread1582_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_memread_exiting_stall_out;

    -- sync_out(GPOUT,14)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_for_body510_memread_c0_exit967_memread_aunroll_x_out_stall_entry;

END normal;
