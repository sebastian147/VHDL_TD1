----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:20:29 10/18/2018 
-- Design Name: 
-- Module Name:    myFFDR - Behavioral 
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

entity myFFDR is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end myFFDR;

architecture Behavioral of myFFDR is
	
	begin
		process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					q <= '0';
				else
					q <= d;
				end if;
			end if;
		end process;
end Behavioral;

