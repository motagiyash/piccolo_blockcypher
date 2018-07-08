library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity piccolomatrix is

port( data_i_s0 : in std_logic_vector (3 downto 0);
		data_i_s1 : in std_logic_vector (3 downto 0);
		data_i_s2 : in std_logic_vector (3 downto 0);
		data_i_s3 : in std_logic_vector (3 downto 0);
		
		data_o_s0 : out std_logic_vector (3 downto 0);
		data_o_s1 : out std_logic_vector (3 downto 0);
		data_o_s2 : out std_logic_vector (3 downto 0);
		data_o_s3 : out std_logic_vector (3 downto 0));
end piccolomatrix;

architecture Behavioral of piccolomatrix is

begin
	matrix_process_sbox0 : process (data_i_s0) is
				begin
				multiplication_case0 : case data_i_s0 is
            when "0000"   => data_o_s0 <= "0000";
            when "0001"   => data_o_s0 <= "0011";
            when "0010"   => data_o_s0 <= "0001";
            when "0011"   => data_o_s0 <= "0100";
            when "0100"   => data_o_s0 <= "0001";
            when "0101"   => data_o_s0 <= "0100";
            when "0110"   => data_o_s0 <= "0010";
            when "0111"   => data_o_s0 <= "0101";
            when "1000"   => data_o_s0 <= "0010";
            when "1001"   => data_o_s0 <= "0101";
            when "1010"   => data_o_s0 <= "0011";
            when "1011"   => data_o_s0 <= "0110";
            when "1100"   => data_o_s0 <= "0011";
            when "1101"   => data_o_s0 <= "0110";
            when "1110"   => data_o_s0 <= "0100";
            when "1111"   => data_o_s0 <= "0111";
				when others => data_o_s0 <= "0000";
			end case multiplication_case0;
		end process matrix_process_sbox0;
			
	matrix_process_sbox1 : process (data_i_s1) is
				begin
				multiplication_case1 : case data_i_s1 is
            when "0000"   => data_o_s1 <= "0000";
            when "0001"   => data_o_s1 <= "0001";
            when "0010"   => data_o_s1 <= "0001";
            when "0011"   => data_o_s1 <= "0010";
            when "0100"   => data_o_s1 <= "0010";
            when "0101"   => data_o_s1 <= "0011";
            when "0110"   => data_o_s1 <= "0011";
            when "0111"   => data_o_s1 <= "0100";
            when "1000"   => data_o_s1 <= "0011";
            when "1001"   => data_o_s1 <= "0100";
            when "1010"   => data_o_s1 <= "0100";
            when "1011"   => data_o_s1 <= "0101";
            when "1100"   => data_o_s1 <= "0101";
            when "1101"   => data_o_s1 <= "0110";
            when "1110"   => data_o_s1 <= "0110";
            when "1111"   => data_o_s1 <= "0111";
				when others => data_o_s1 <= "0000";
			end case multiplication_case1;
		end process matrix_process_sbox1;
		
	matrix_process_sbox2 : process (data_i_s2) is
				begin
				multiplication_case2 : case data_i_s2 is
            when "0000"   => data_o_s2 <= "0000";
            when "0001"   => data_o_s2 <= "0001";
            when "0010"   => data_o_s2 <= "0010";
            when "0011"   => data_o_s2 <= "0011";
            when "0100"   => data_o_s2 <= "0011";
            when "0101"   => data_o_s2 <= "0100";
            when "0110"   => data_o_s2 <= "0101";
            when "0111"   => data_o_s2 <= "0110";
            when "1000"   => data_o_s2 <= "0001";
            when "1001"   => data_o_s2 <= "0010";
            when "1010"   => data_o_s2 <= "0011";
            when "1011"   => data_o_s2 <= "0100";
            when "1100"   => data_o_s2 <= "0100";
            when "1101"   => data_o_s2 <= "0101";
            when "1110"   => data_o_s2 <= "0110";
            when "1111"   => data_o_s2 <= "0111";
				when others => data_o_s2 <= "0000";
			end case multiplication_case2;
		end process matrix_process_sbox2;
			
	matrix_process_sbox3 : process (data_i_s3) is
				begin
				multiplication_case3 : case data_i_s3 is
            when "0000"   => data_o_s3 <= "0000";
            when "0001"   => data_o_s3 <= "0010";
            when "0010"   => data_o_s3 <= "0011";
            when "0011"   => data_o_s3 <= "0101";
            when "0100"   => data_o_s3 <= "0001";
            when "0101"   => data_o_s3 <= "0011";
            when "0110"   => data_o_s3 <= "0100";
            when "0111"   => data_o_s3 <= "0101";
            when "1000"   => data_o_s3 <= "0001";
            when "1001"   => data_o_s3 <= "0011";
            when "1010"   => data_o_s3 <= "0100";
            when "1011"   => data_o_s3 <= "0110";
            when "1100"   => data_o_s3 <= "0010";
            when "1101"   => data_o_s3 <= "0100";
            when "1110"   => data_o_s3 <= "0101";
            when "1111"   => data_o_s3 <= "0111";
				when others => data_o_s3 <= "0000";
			end case multiplication_case3;
		end process matrix_process_sbox3;

end Behavioral;
