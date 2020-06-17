----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:29:14 10/18/2018 
-- Design Name: 
-- Module Name:    myShiftReg2 - Behavioral 
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

entity myShiftReg2 is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end myShiftReg2;

architecture Behavioral of myShiftReg2 is
	signal aux: STD_LOGIC_VECTOR(N-1 downto 0);
begin
		temporizador: process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					q <= '0';
					aux <= (others => '0');
				else
					if ena = '1' then
						q <= aux(0);
						aux <= d & aux(N-1 downto 1);
					else
						q<= '0';
					end if;
				end if;
			end if;
		end process;

end Behavioral;

