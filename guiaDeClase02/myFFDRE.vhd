----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:22:54 10/18/2018 
-- Design Name: 
-- Module Name:    myFFDRE - Behavioral 
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

entity myFFDRE is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end myFFDRE;

architecture Behavioral of myFFDRE is

begin
	process(clk, rst, ena)
		begin
			if ena = '1' then
				if rst='1' then
					q<='0';
				else
					if rising_edge(clk) then
						q<=d;
					end if;
				end if;
			else
				q<='0';
			end if;
	end process;

end Behavioral;

