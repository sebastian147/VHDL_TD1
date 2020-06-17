----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:03:21 07/12/2018 
-- Design Name: 
-- Module Name:    myTriState8 - Behavioral 
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

entity myTriState8 is
	port(
		entrada: in std_logic_vector (7 downto 0);
		control: in std_logic;
		salida: out std_logic_vector (7 downto 0)
		);
end myTriState8;

architecture Behavioral of myTriState8 is

begin

	salida <=  entrada when (control= '1') else
				 "ZZZZZZZZ" when (control) = '0';

end Behavioral;


