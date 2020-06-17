----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:48:21 07/12/2018 
-- Design Name: 
-- Module Name:    myTriState - Behavioral 
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

entity myTriState is
	port(
		entrada: in std_logic;
		control: in std_logic;
		salida: out std_logic
		);
end myTriState;

architecture Behavioral of myTriState is

begin

	salida <= '1' when ((entrada = '1') and (control= '1')) else
				 'Z' when (control) = '0' else
				 '0';

end Behavioral;


