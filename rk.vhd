----------------------------------------------------------------------------------
-- Company: esigelec
-- Engineer: Yash Motagi
-- 
-- Create Date:    10:42:07 06/17/2018 
-- Design Name: 
-- Module Name:    rk - Behavioral 
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
use ieee.numeric_std.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rk is
generic( round : integer range 0 to 32
			);
port ( key_in : in std_logic_vector (127 downto 0);
		 key_out_rk1 : out std_logic_vector (15 downto 0);
		 key_out_rk2 : out std_logic_vector (15 downto 0));
end rk;

architecture Behavioral of rk is

begin

Key_gen_process : process (key_in) is
	begin
		case round is 
			when 0 => key_out_rk1<= key_in(47 downto 32);
						 key_out_rk2<= key_in(63 downto 48);
			when 1 => key_out_rk1<= key_in(79 downto 64);
						 key_out_rk2<= key_in(111 downto 96);
			when 2 => key_out_rk1<= key_in(127 downto 112);
						 key_out_rk2<= key_in(63 downto 48);
			when 3 => key_out_rk1<= key_in(47 downto 32);
						 key_out_rk2<= key_in(31 downto 16);
			when 4 => key_out_rk1<= key_in(111 downto 96);
						 key_out_rk2<= key_in(127 downto 112);
			when 5 => key_out_rk1<= key_in(15 downto 0);
						 key_out_rk2<= key_in(63 downto 48);
			when 6 => key_out_rk1<= key_in(79 downto 64);
						 key_out_rk2<= key_in(95 downto 80);
			when 7 => key_out_rk1<= key_in(111 downto 96);
						 key_out_rk2<= key_in(31 downto 16);
			when 8 => key_out_rk1<= key_in(79 downto 64);
						 key_out_rk2<= key_in(111 downto 96);
			when 9 => key_out_rk1<= key_in(47 downto 32);
						 key_out_rk2<= key_in(127 downto 112);
			when 10 =>key_out_rk1<= key_in(15 downto 0);
						 key_out_rk2<= key_in(63 downto 48);
			when 11 =>key_out_rk1<= key_in(79 downto 64);
						 key_out_rk2<= key_in(31 downto 16);
			when 12 =>key_out_rk1<= key_in(15 downto 0);
						 key_out_rk2<= key_in(63 downto 48);
			when 13 =>key_out_rk1<= key_in(111 downto 96);
						 key_out_rk2<= key_in(95 downto 80);
			when 14 =>key_out_rk1<= key_in(47 downto 32);
						 key_out_rk2<= key_in(127 downto 112);
			when 15 =>key_out_rk1<= key_in(15 downto 0);
						 key_out_rk2<= key_in(31 downto 16);
			when 16 =>key_out_rk1<= key_in(47 downto 32);
						 key_out_rk2<= key_in(127 downto 112);
			when 17 =>key_out_rk1<= key_in(79 downto 64);
						 key_out_rk2<= key_in(63 downto 48);
			when 18 =>key_out_rk1<= key_in(111 downto 96);
						 key_out_rk2<= key_in(95 downto 80);
			when 19 =>key_out_rk1<= key_in(47 downto 32);
						 key_out_rk2<= key_in(31 downto 16);
			when 20 =>key_out_rk1<= key_in(111 downto 96);
						 key_out_rk2<= key_in(95 downto 80);
			when 21 =>key_out_rk1<= key_in(15 downto 0);
						 key_out_rk2<= key_in(127 downto 112);
			when 22 =>key_out_rk1<= key_in(79 downto 64);
						 key_out_rk2<= key_in(63 downto 48);
			when 23 =>key_out_rk1<= key_in(111 downto 96);
						 key_out_rk2<= key_in(31 downto 16);
			when 24 =>key_out_rk1<= key_in(79 downto 64);
						 key_out_rk2<= key_in(63 downto 48);
			when 25 =>key_out_rk1<= key_in(47 downto 32);
						 key_out_rk2<= key_in(95 downto 80);
			when 26 =>key_out_rk1<= key_in(15 downto 0);
						 key_out_rk2<= key_in(127 downto 112);
			when 27 =>key_out_rk1<= key_in(79 downto 64);
						 key_out_rk2<= key_in(31 downto 16);
			when 28 =>key_out_rk1<= key_in(15 downto 0);
						 key_out_rk2<= key_in(127 downto 112);
			when 29 =>key_out_rk1<= key_in(111 downto 96);
						 key_out_rk2<= key_in(63 downto 48);
			when 30 =>key_out_rk1<= key_in(47 downto 32);
						 key_out_rk2<= key_in(95 downto 80);
			when others =>key_out_rk1<= "0000000000000000";
						     key_out_rk2<= "0000000000000000";
		end case;
	end process Key_gen_process;
						 
end Behavioral;

