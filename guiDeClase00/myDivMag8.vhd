----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:46:19 09/06/2018 
-- Design Name: 
-- Module Name:    myDivMag8 - Behavioral 
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

entity myDivMag8 is
    Port ( entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           div : in  STD_LOGIC_VECTOR (1 downto 0);
           salida : out  STD_LOGIC_VECTOR (7 downto 0));
end myDivMag8;

architecture Behavioral of myDivMag8 is

begin
	with div select
		Salida <= Entrada(7 downto 0) when "00",
					 Entrada(7) & Entrada(7 downto 1) when "01",
					 Entrada(7) & Entrada(7) & Entrada(7 downto 2) when "10",
					 Entrada(7) & Entrada(7) & Entrada(7) & Entrada(7 downto 3) when "11",
					 (others => '0') when others;	

end Behavioral;

