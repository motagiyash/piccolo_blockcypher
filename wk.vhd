----------------------------------------------------------------------------------
-- Company: Esigelec	
-- Engineer: Yash Motagi
-- 
-- Create Date:    10:25:00 06/17/2018 
-- Design Name: 
-- Module Name:    wk - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wk is
generic( round : integer
			);
port ( key_in : in std_logic_vector (127 downto 0);
		 key_out1_wk : out std_logic_vector (15 downto 0);
		 key_out2_wk : out std_logic_vector (15 downto 0));
end wk;

architecture Behavioral of wk is
signal key_store : std_logic_vector (127 downto 0);
begin

load_key_and_out : process (round) is
							begin 
								if (round=0) then
									key_store<=key_in;
									key_out1_wk<=key_store(7 downto 0) & key_store(31 downto 24);
									key_out2_wk<=key_store(23 downto 16) & key_store(15 downto 8);
								elsif (round=31) then
									key_out1_wk<=key_store(71 downto 64) & key_store(127 downto 120);
									key_out2_wk<=key_store(119 downto 112) & key_store(79 downto 72);
								end if;
						 end process load_key_and_out;

end Behavioral;
