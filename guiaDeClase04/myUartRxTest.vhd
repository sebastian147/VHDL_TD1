----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:47 11/22/2018 
-- Design Name: 
-- Module Name:    myUartRxTest - Behavioral 
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

entity myUartRxTest is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0);
           rx : in  STD_LOGIC);
end myUartRxTest;

architecture Behavioral of myUartRxTest is
	
	signal aux, salida : std_logic;

	
begin
	Receptor:entity work.myUartRx(Behavioral)
	port map(
			clk=>clk,
			rst=>rst,
			dataRd=>aux,
			dataRx=>led,
			Rx=>salida
	);
	Temporarizador:process(clk)
	begin
		
		if rising_edge(clk) then
			if rst='1' then
				salida <= '0';
			else
				--if aux = '1' then
					salida <= rx;
				--end if;
			end if;
		end if;
	end process;
	

	
end Behavioral;

