----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:37 07/12/2018 
-- Design Name: 
-- Module Name:    myDeco3_8 - Behavioral 
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

entity myDeco3_8 is
	port(entrada: in std_logic_vector(2 downto 0);
		  salida: out std_logic_vector(7 downto 0));
end myDeco3_8;

architecture Behavioral of myDeco3_8 is

begin

	Process(entrada)
		begin
			case entrada is
			when "000" =>   salida <= "00000001";
			when "001" =>   salida <= "00000010";
			when "010" =>   salida <= "00000100";
			when "011" =>   salida <= "00001000";
			when "100" =>   salida <= "00010000";
			when "101" =>   salida <= "00100000";
			when "110" =>   salida <= "01000000";
			when "111" =>   salida <= "10000000";
			when others =>  salida <= "00000000";
		end case;
	end process;
	
--	with entrada select
--		salida <= "00000001" when "000",
--					 "00000010" when "001",
--					 "00000100" when "010",
--					 "00001000" when "011",
--					 "00010000" when "100",
--					 "00100000" when "101",
--					 "01000000" when "110",
--					 "10000000" when "111",
--					 "00000000" when others;

end Behavioral;

