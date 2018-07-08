----------------------------------------------------------------------------------
-- Company: Esigelec
-- Engineer: Yash Motagi
-- 
-- Create Date:    08:10:13 07/04/2018 
-- Design Name: 
-- Module Name:    constant_gen - Behavioral 
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity constant_gen is
generic( round : integer
			);
port ( con : out std_logic_vector (31 downto 0));
			
end constant_gen;

architecture Behavioral of constant_gen is

signal c_i,c_j : std_logic_vector (4 downto 0);
signal c : unsigned (1 downto 0) := "00";
variable a : integer := round;
begin

Constant_gen_process: process (a) is
							begin
							   c_i<=std_logic_vector(to_unsigned(round, c_i'length));  
								c_j<=std_logic_vector(to_unsigned((round+1), c_i'length));
								con <= (c_j & c_i & c_j & c & c_j & c_i & c_j) xor (01100101010001111010100110001011); 
							end process Constant_gen_process;


end Behavioral;
