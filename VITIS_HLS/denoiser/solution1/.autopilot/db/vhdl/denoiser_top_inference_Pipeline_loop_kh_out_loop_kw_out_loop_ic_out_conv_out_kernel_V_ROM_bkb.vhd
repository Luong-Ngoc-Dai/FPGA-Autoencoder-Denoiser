-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity denoiser_top_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_conv_out_kernel_V_ROM_bkb is 
    generic(
             DataWidth     : integer := 11; 
             AddressWidth     : integer := 6; 
             AddressRange    : integer := 36
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of denoiser_top_inference_Pipeline_loop_kh_out_loop_kw_out_loop_ic_out_conv_out_kernel_V_ROM_bkb is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "11011100011", 1 => "11000111010", 2 => "00000110001", 3 => "11000111100", 
    4 => "10011111110", 5 => "11011010101", 6 => "11110000000", 7 => "11010111110", 
    8 => "01000000000", 9 => "11110100101", 10 => "11110101110", 11 => "00100101011", 
    12 => "11101010010", 13 => "00101001111", 14 => "11010000101", 15 => "00100011111", 
    16 => "00000000101", 17 => "11101100101", 18 => "11110110011", 19 => "11100010111", 
    20 => "11010110000", 21 => "11000011101", 22 => "00001110000", 23 => "00100101111", 
    24 => "10110111011", 25 => "11001011111", 26 => "11010010000", 27 => "00101010101", 
    28 => "00100111010", 29 => "01010001001", 30 => "00101111110", 31 => "00000110110", 
    32 => "01010000100", 33 => "00101000001", 34 => "11110100001", 35 => "01001100010");



begin 

 
memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
 
        if (ce0 = '1') then  
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;

end if;
end process;

end rtl;

