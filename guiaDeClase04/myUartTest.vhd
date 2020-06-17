----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:40 11/22/2018 
-- Design Name: 
-- Module Name:    myUartTest - Behavioral 
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

entity myUartTest is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (3 downto 0);
           tx : out  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0);
           rx : in  STD_LOGIC);
end myUartTest;

architecture Behavioral of myUartTest is

begin
	Receptor:entity work.myUartRxTest(Behavioral)
	port map(
			clk=>clk,
			rst=>rst,
			led=>led,
			Rx=>rx
	);
	Transmisor:entity work.myUartTxTest(Behavioral)
	port map(
			clk=>clk,
			rst=>clk,
			sw=>sw,
			Tx=>tx
			);

end Behavioral;

