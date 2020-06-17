----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:23:52 10/18/2018 
-- Design Name: 
-- Module Name:    myFFDREN - Behavioral 
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

entity myFFDREN is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (N-1 downto 0);
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myFFDREN;

architecture Behavioral of myFFDREN is

begin
	process(clk, rst, ena)
		begin
			if ena = '1' then
				if rst='1' then
					q<= (others => '0');
				else
					if rising_edge(clk) then
						q<=d;
					end if;
				end if;
			else
				q<= (others => '0');
			end if;
	end process;
end Behavioral;

