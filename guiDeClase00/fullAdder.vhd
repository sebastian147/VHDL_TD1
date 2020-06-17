----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:41 07/12/2018 
-- Design Name: 
-- Module Name:    fullAdder - Behavioral 
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

entity fullAdder is

	port(
		a,b,ci: in std_logic;
		s,co: out std_logic
	);

end fullAdder;

architecture Behavioral of fullAdder is

begin

	s <= a xor b xor ci;
	co <= (a or b) and (a or ci) and (b or ci);

end Behavioral;


	