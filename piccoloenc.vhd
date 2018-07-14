----------------------------------------------------------------------------------
-- Company: Esigelec	
-- Engineer: Yash Motagi
-- 
-- Create Date:    21:12:16 06/11/2018 
-- Design Name: 
-- Module Name:    piccoloenc - Behavioral 
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

entity piccoloenc is
generic( round : integer range 0 to 32
			); 
port( keyin    : in std_logic_vector (127 downto 0);
		plaintext: in  std_logic_vector(63 downto 0);
	   cyphered : out std_logic_vector(63 downto 0));
end piccoloenc;

architecture Behavioral of piccoloenc is

component piccolofunction is
port(data_in : in std_logic_vector(15 downto 0);
	  data_out : out std_logic_vector(15 downto 0)
	  );
end component piccolofunction;

component piccolokey is
generic( round : integer range 0 to 32
			);
port ( keyin : in std_logic_vector (127 downto 0);
		 key_out1_wk : out std_logic_vector (15 downto 0);
		 key_out2_wk : out std_logic_vector (15 downto 0);
		 key_out1_rk : out std_logic_vector (15 downto 0);
		 key_out2_rk : out std_logic_vector (15 downto 0));
end component piccolokey;

component piccoloroundpermutation is
generic( round : integer range 0 to 32
			); 
port(	data_in: in  std_logic_vector(63 downto 0);
	   data_out : out std_logic_vector(63 downto 0));
end component piccoloroundpermutation;

signal wk0,wk1,rk0,rk1 : std_logic_vector (15 downto 0);
signal l0,l1,l2,l3 : std_logic_vector (15 downto 0);
signal function_a_out,function_b_out : std_logic_vector(15 downto 0);
signal round_calculated_output : std_logic_vector(63 downto 0);

begin

function_a : piccolofunction 
port map(data_in => l0,
			data_out =>function_a_out
	  );
	  
function_b : piccolofunction 
port map(data_in =>l2,
			data_out =>function_b_out
	  );

key : piccolokey 
generic map( round => round
			)
port map( keyin => keyin,
		 key_out1_wk => wk0,
		 key_out2_wk => wk1,
		 key_out1_rk => rk0,
		 key_out2_rk => rk1);
		 
RP :  piccoloroundpermutation 
generic map( round => round
			)
port map(	data_in  => round_calculated_output,
	   data_out => cyphered);

calculation_process : process (plaintext) is
begin
 l0 <= plaintext(15 downto 0) xor wk0;
 l1 <= plaintext(31 downto 16) xor rk0 xor function_a_out;
 l2 <= plaintext(47 downto 32) xor wk1;
 l3 <= plaintext(63 downto 48) xor rk1 xor function_b_out;
 round_calculated_output <= l0 & l1 & l2 & l3;
end process calculation_process; 
end Behavioral;
