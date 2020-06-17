----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:09 11/15/2018 
-- Design Name: 
-- Module Name:    FFT - Behavioral 
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

entity FFT is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           t : in  STD_LOGIC;
           q : out  STD_LOGIC);
end FFT;

architecture Behavioral of FFT is
	signal aux: STD_LOGIC;
begin
		process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					q <= '0';
					aux <= '0';
				else
					if t = '1' then 
						q <= not(aux);
					else
						q <= aux;
					end if;
				end if;
			end if;
		end process;

end Behavioral;

