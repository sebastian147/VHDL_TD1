----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:51:41 08/23/2018 
-- Design Name: 
-- Module Name:    myCoder4_2 - Behavioral 
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

entity myCoder4_2 is
    Port ( entrada : in  STD_LOGIC_VECTOR (3 downto 0);
           salida : out  STD_LOGIC_VECTOR (1 downto 0));
end myCoder4_2;

architecture Behavioral of myCoder4_2 is

begin

--	with entrada select
--		salida <= "00" when ( "0001" ),
--					 "01" when ( "0010" ),
--					 "10" when ( "0100" ),
--					 "11" when ( "1000" ),
--					 "00" when others;
					 
	Process(entrada)
		begin
			case entrada is
			when "0001" =>   salida <= "00";
			when "0010" =>   salida <= "01";
			when "0100" =>   salida <= "10";
			when "1000" =>   salida <= "11";
			when others =>  salida <= "00";
		end case;
	end process;
	
					
end Behavioral;

