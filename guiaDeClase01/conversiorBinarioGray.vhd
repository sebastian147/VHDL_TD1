----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:16 10/04/2018 
-- Design Name: 
-- Module Name:    conversiorBinarioGray - Behavioral 
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

entity conversiorBinarioGray is
	Generic(
		N: integer :=8
		);
    Port ( binario : in  STD_LOGIC_VECTOR (N-1 downto 0);
           gray : out  STD_LOGIC_VECTOR (N-1 downto 0);
           sel : in  STD_LOGIC);
end conversiorBinarioGray;

architecture Behavioral of conversiorBinarioGray is
signal auxGB: STD_LOGIC_VECTOR (N-1 downto 0);
signal auxBG: STD_LOGIC_VECTOR (N-1 downto 0);

begin
	gray <= auxBG when sel = '1'
			else auxGB;
			
		bG:entity work.binarioGray(Behavioral)
			generic map(N=>N)
			port map(
				
				binario => binario,
				gray => auxBG
				);
		gB:entity work.grayBinario(Behavioral)
			generic map(N=>N)
			port map(
				binario => auxGB,
				gray => binario
				);

end Behavioral;

