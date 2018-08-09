
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piccolo is
port(keyin    : in std_logic_vector (127 downto 0);
	  plaintext : in std_logic_vector (63 downto 0);
	  cyphertext: out std_logic_vector(63 downto 0));
end piccolo;

architecture Behavioral of piccolo is

component piccoloenc is
generic( round : integer range 0 to 32
			); 
port( keyin    : in std_logic_vector (127 downto 0);
		plaintext: in  std_logic_vector(63 downto 0);
	   cyphered : out std_logic_vector(63 downto 0));
end component piccoloenc;

component piccoloenc_30 is
generic( round : integer range 0 to 32
			); 
port( keyin_30    : in std_logic_vector (127 downto 0);
		plaintext_30: in  std_logic_vector(63 downto 0);
	   cyphered_30 : out std_logic_vector(63 downto 0));
end component piccoloenc_30;

signal data_array : cyphered_data;

begin

enc_generate : for i in 0 to 30 generate

r_0_29 : if i <= 29 generate
	enc : piccoloenc
		generic map(round => i)
		port map( keyin    => keyin,
				    plaintext => data_array(i),
				    cyphered => data_array(i+1));
end generate r_0_29;

r_30 : if i = 30 generate
	enc_30 : piccoloenc_30
		generic map(round => i)
		port map( keyin_30    => keyin,
				    plaintext_30 => data_array(i),
				    cyphered_30 => data_array(i+1));
end generate r_30;
end generate enc_generate;


start_process : process (keyin,plaintext) is
begin
	data_array(0)<=plaintext;
end process start_process;

cyphertext <= data_array(31);

end Behavioral;

