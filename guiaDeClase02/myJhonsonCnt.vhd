----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:35:53 10/18/2018 
-- Design Name: 
-- Module Name:    myJhonsonCnt - Behavioral 
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

entity myJhonsonCnt is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst  : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myJhonsonCnt;

architecture Behavioral of myJhonsonCnt is
	signal aux: STD_LOGIC_VECTOR(N-1 downto 0);
begin
		q <= aux;
		temporizador: process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					aux <= (others => '0');
				else
					if ena = '1' then
						aux <= aux(N-2 downto 0) & not aux(N-1);

					end if;
				end if;
			end if;
		end process;

end Behavioral;

