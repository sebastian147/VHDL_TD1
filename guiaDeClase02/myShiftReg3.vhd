----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:34 10/18/2018 
-- Design Name: 
-- Module Name:    myShiftReg3 - Behavioral 
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

entity myShiftReg3 is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           dir : in  STD_LOGIC;
           dr,dl : in  STD_LOGIC;--entrada serie izquierda y derecha
			  fun: in STD_LOGIC_VECTOR (1 downto 0); -- 00 dir/ 01 d/ 10 dr/ dl 11
           d : in  STD_LOGIC_VECTOR (N-1 downto 0);--entrada paralela
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myShiftReg3;

architecture Behavioral of myShiftReg3 is
	signal aux: STD_LOGIC_VECTOR(N-1 downto 0);
	
begin
		q <= aux;
		temporizador: process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					aux(N-1 downto 1) <= (others => '0');
					aux(0) <= '1';
				else
					if ena = '1' then
						if fun = "00" then
							aux <= aux(N-2 downto 0) & dir; 
						elsif fun = "01" then
							aux <= d;
						elsif fun = "10" then
							aux <= dr & aux(N-1 downto 1);
						elsif fun = "11" then
							aux <= aux(N-2 downto 0) & dl;
						end if;
					end if;
				end if;
			end if;
		end process;

end Behavioral;

