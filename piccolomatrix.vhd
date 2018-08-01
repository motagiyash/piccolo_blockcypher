----------------------------------------------------------------------------------
-- Company: Esigelec
-- Engineer: Yash Motagi
-- 
-- Create Date:    18:18:17 07/20/2018 
-- Design Name: 
-- Module Name:    piccolomatrix - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.NUMERIC_STD.all;

entity piccolomatrix is

port( data_i_s0 : in std_logic_vector (3 downto 0);
		data_i_s1 : in std_logic_vector (3 downto 0);
		data_i_s2 : in std_logic_vector (3 downto 0);
		data_i_s3 : in std_logic_vector (3 downto 0);
		
		data_o_s4 : out std_logic_vector (3 downto 0);
		data_o_s5 : out std_logic_vector (3 downto 0);
		data_o_s6 : out std_logic_vector (3 downto 0);
		data_o_s7 : out std_logic_vector (3 downto 0));
end piccolomatrix;

architecture Behavioral of piccolomatrix is

signal x0,x1,x2,x3 : std_logic_vector (4 downto 0);
signal polynomial : std_logic_vector (4 downto 0) := "10011";
signal out_buffer_0,out_buffer_1,out_buffer_2,out_buffer_3 : std_logic_vector (4 downto 0);
signal s0,s1,s2,s3 : unsigned (3 downto 0);
begin

x_process : process (data_i_s0,data_i_s1,data_i_s2,data_i_s3) is
begin
x0<=((00010)*data_i_s0 xor (00010)*data_i_s1 + data_i_s1 xor data_i_s2 xor data_i_s3);
x1<=(data_i_s0 xor (00010)*data_i_s1 xor (00010)*data_i_s2 + data_i_s2 xor data_i_s3);
x2<=(data_i_s0 xor data_i_s1 xor (00010)*data_i_s2 xor (00010)*data_i_s3 + data_i_s3);
x3<=((00010)*data_i_s0 + data_i_s0 xor data_i_s1 xor data_i_s2 xor (00010)*data_i_s3);
end process x_process;

update_process : process (x0,x1,x2,x3) is
begin
	if (x0(4)='1') then
		out_buffer_0 <= x0 xor polynomial;
	else 
		out_buffer_0 <= x0;
	end if;
	if (x1(4)='1') then
		out_buffer_1 <= x1 xor polynomial;
	else 
		out_buffer_1 <= x1;
	end if;
	if (x2(4)='1') then
		out_buffer_2 <= x2 xor polynomial;
	else 
		out_buffer_2 <= x2;
	end if;
	if (x3(4)='1') then
		out_buffer_3 <= x3 xor polynomial;
	else 
		out_buffer_3 <= x3;
	end if;
end process update_process;

out_process_0 :process (out_buffer_0) is
begin
	data_o_s4 <= out_buffer_0(3 downto 0);
end process out_process_0;

out_process_1 :process (out_buffer_1) is
begin
	data_o_s5 <= out_buffer_1(3 downto 0);
end process out_process_1;

out_process_2 :process (out_buffer_2) is
begin
	data_o_s6 <= out_buffer_2(3 downto 0);
end process out_process_2;

out_process_3 :process (out_buffer_3) is
begin
	data_o_s7 <= out_buffer_3(3 downto 0);
end process out_process_3;


end Behavioral;
