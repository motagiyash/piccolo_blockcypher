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
generic( round : integer
			);
port ( key_in : in std_logic_vector (127 downto 0);
		 key_out_rk1 : out std_logic_vector (15 downto 0);
		 key_out_rk2 : out std_logic_vector (15 downto 0));
end rk;

architecture Behavioral of rk is

type key_array is array (7 downto 0) of std_logic_vector (15 downto 0);
signal ka : key_array;
signal conk : std_logic_vector (31 downto 0);

component constant_gen is
generic( round : integer
			);
port ( con : out std_logic_vector (31 downto 0));
end component constant_gen;

begin	

con_gen : constant_gen
				generic map (round => round)
				port map (con => conk);
			

key_upload_process : process (key_in)

begin
		ka(0)<= key_in(15 downto 0);
		ka(1)<= key_in(31 downto 16);
		ka(2)<= key_in(47 downto 32);
		ka(3)<= key_in(63 downto 48);
		ka(4)<= key_in(79 downto 64);
		ka(5)<= key_in(95 downto 80);
		ka(6)<= key_in(111 downto 96);
		ka(7)<= key_in(127 downto 112);
		
end process key_upload_process;
	
Key_gen_proc :process (key_in)
	
	begin
		if (((round*2)+2)mod 8 = 0 ) then
				ka(0)<=ka(2);
				ka(1)<=ka(1);
				ka(2)<=ka(6);
				ka(3)<=ka(7);
				ka(4)<=ka(0);
				ka(5)<=ka(3);
				ka(6)<=ka(4);
				ka(7)<=ka(5);
		else 
				key_out_rk1<=ka(((round*2)+2) mod 8) xor conk(31 downto 16);
				
		end if;
		
		if ((((round*2)+1)+2)mod 8 = 0 ) then
				ka(0)<=ka(2);
				ka(1)<=ka(1);
				ka(2)<=ka(6);
				ka(3)<=ka(7);
				ka(4)<=ka(0);
				ka(5)<=ka(3);
				ka(6)<=ka(4);
				ka(7)<=ka(5);
		else 
				key_out_rk2<=ka((((round*2)+1)+2) mod 8) xor conk(15 downto 0);
				
		end if;
end process;
	
				
end Behavioral;
