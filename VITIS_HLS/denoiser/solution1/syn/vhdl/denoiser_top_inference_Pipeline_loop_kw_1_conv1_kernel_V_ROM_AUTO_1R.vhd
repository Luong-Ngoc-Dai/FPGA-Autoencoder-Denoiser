-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity denoiser_top_inference_Pipeline_loop_kw_1_conv1_kernel_V_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 10; 
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


architecture rtl of denoiser_top_inference_Pipeline_loop_kw_1_conv1_kernel_V_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "1111110111", 1 => "1111000001", 2 => "1111000000", 3 => "1111011000", 
    4 => "1110001101", 5 => "1110110110", 6 => "1111101111", 7 => "1111101101", 
    8 => "1111111010", 9 => "1110110101", 10 => "1110100110", 11 => "1110100110", 
    12 => "1110001010", 13 => "0001001111", 14 => "1110100100", 15 => "1110011001", 
    16 => "1110011100", 17 => "1110111010", 18 => "0001000111", 19 => "0100011110", 
    20 => "0100000110", 21 => "0010110101", 22 => "0101011101", 23 => "0100000011", 
    24 => "0001010011", 25 => "0010001100", 26 => "0000101100", 27 => "0001110000", 
    28 => "0000000010", 29 => "1110011111", 30 => "0100100111", 31 => "0010111100", 
    32 => "0000011011", 33 => "0101111110", 34 => "0100010000", 35 => "0001110100");



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

