----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:48 09/20/2018 
-- Design Name: 
-- Module Name:    fullAdderN - Behavioral 
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

entity fullAdderN is
	Generic(
		N: integer :=4
	);
    Port ( a,b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           ci : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (N-1 downto 0);
           co : out  STD_LOGIC);
end fullAdderN;

architecture Behavioral of fullAdderN is
signal carry: STD_LOGIC_VECTOR( N downto 0);
begin
	carry(0) <= ci;
	co <= carry(N);
	Reiterar: for i in 0 to N-1 generate
		Adder:entity work.fullAdder(Behavioral)
			port map(
				a=>a(i),
				b=>b(i),
				ci=>carry(i),
				co=>carry(i+1),
				s=>s(i)
				);
		end generate;

end Behavioral;

