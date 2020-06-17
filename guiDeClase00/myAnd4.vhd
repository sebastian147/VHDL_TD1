----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:47:26 07/12/2018 
-- Design Name: 
-- Module Name:    myAnd4 - Behavioral 
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

entity myAnd4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC);
end myAnd4;

architecture Behavioral of myAnd4 is

begin

	y <= a(3) and a(2) and a(1) and a(0);

end Behavioral;

