----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:10 07/12/2018 
-- Design Name: 
-- Module Name:    myMagCmp8 - Behavioral 
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

entity myMagCmp8 is
	port(
			a,b:in std_logic_vector(7 downto 0);
			igual,aMayorB,bMayorA: out std_logic
		);
end myMagCmp8;

architecture Behavioral of myMagCmp8 is

begin

	igual <= '1' when (a = b) else
				'0';
	aMayorB <= '1' when (a > b) else
				'0';
	bMayorA <= '1' when (a < b) else
				'0';
				

end Behavioral;

