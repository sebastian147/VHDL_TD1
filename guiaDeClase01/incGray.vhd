----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:22 10/04/2018 
-- Design Name: 
-- Module Name:    incGray - Behavioral 
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

entity incGray is
	Generic(
		N: integer :=16
	);
    Port ( entrada : in  STD_LOGIC_VECTOR (N-1 downto 0);
           salida : out  STD_LOGIC_VECTOR (N-1 downto 0));
end incGray;

architecture Behavioral of incGray is

signal auxBG: STD_LOGIC_VECTOR(N-1 downto 0);
signal auxGB: STD_LOGIC_VECTOR (N-1 downto 0);
signal aux: STD_LOGIC_VECTOR (N-1 downto 0);
begin
	aux <= (others=>'0');
		gB:entity work.conversiorBinarioGray(Behavioral)
			generic map(N=>N)
			port map(
				binario=>entrada,
				gray=>auxGB, 	
				sel=>'0'
				);
		FullAdder:entity work.fullAdderN(Behavioral)
			generic map(N=>N)
			port map(
				a=>auxGB,
				b=> aux,
				ci=>'1',
				co=>open,
				s=>auxBG
				);
		bG:entity work.conversiorBinarioGray(Behavioral)
			generic map(N=>N)
			port map(
				binario=>auxBG,
				gray=>salida, 	
				sel=>'1'
				);

end Behavioral;

