----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:10 09/20/2018 
-- Design Name: 
-- Module Name:    myMux4_1 - Behavioral 
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

entity myMux4_1 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           s : out  STD_LOGIC);
end myMux4_1;

architecture my_Behavioral of myMux4_1 is
	signal a0: STD_LOGIC;
	signal a1: STD_LOGIC;
begin
	Mux2_1_LOW:entity work.myMux(Behavioral)
		port map(
			a(0)=>a(0),
			a(1)=>a(1),
			c=>c(0),
			s=>a0
			);
	Mux2_1_TOP:entity work.myMux(Behavioral)
		port map(
			a(0)=>a(2),
			a(1)=>a(3),
			c=>c(0),
			s=>a1
			);
	Mux2_1_FINAL:entity work.myMux(Behavioral)
		port map(
			a(0)=>a0,
			a(1)=>a1,
			c=>c(1),
			s=>s
			);
			

end my_Behavioral;

