----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:19:24 11/22/2018 
-- Design Name: 
-- Module Name:    myUart - Behavioral 
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

entity myUart is
	generic(baudRate: integer := 9600;
				sysClk:  integer :=50000000;
				dataSize: integer :=8);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           dataWr : in  STD_LOGIC;
           dataTx : in  STD_LOGIC_VECTOR (datasize-1 downto 0);
           ready : out  STD_LOGIC;
           tx : out  STD_LOGIC;
           dataRd : out  STD_LOGIC;
           dataRx : out  STD_LOGIC_VECTOR (datasize-1 downto 0);
           rx : in  STD_LOGIC);
end myUart;

architecture Behavioral of myUart is

begin

	Receptor:entity work.myUartRx(Behavioral)
	Generic Map(baudRate=>baudRate, sysClk=>sysClk, dataSize=>dataSize)
	port map(
			clk=>clk,
			rst=>rst,
			dataRd=>dataRd,
			dataRx=>dataRx,
			Rx=>rx
	);
	Transmisor:entity work.myUartTx(Behavioral)
	Generic Map(baudRate=>baudRate, sysClk=>sysClk, dataSize=>dataSize)
	port map(
			clk=>clk,
			rst=>rst,
			dataWr=>DataWr,
			dataTx=>DataTx,
			ready=>ready,
			Tx=>tx
	);
end Behavioral;

