----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:31 09/20/2018 
-- Design Name: 
-- Module Name:    myTryStateN - Behavioral 
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

entity myTryStateN is
	Generic(
		N: integer :=4
	);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           c : in  STD_LOGIC_VECTOR (N-1 downto 0);
           s : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myTryStateN;

architecture Behavioral of myTryStateN is

begin

	Cantidad: for i in 0 to N-1 generate
			s(i) <= a(i) when c(i) = '1' 
					else 'Z'
					;
	end generate;
	
end Behavioral;

