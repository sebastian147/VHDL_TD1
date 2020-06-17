----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:23 11/22/2018 
-- Design Name: 
-- Module Name:    myUartTxTest - Behavioral 
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

entity myUartTxTest is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (3 downto 0);
           tx : out  STD_LOGIC);
end myUartTxTest;

architecture Behavioral of myUartTxTest is
	constant LINE_IDLE:std_logic:='1';
	constant BIT_STOP:std_logic:='1';
	constant BIT_START:std_logic:='0';
	
	signal sRegData:std_logic_vector(7 downto 0);
	signal aux: std_logic;
	signal sw_old: std_logic_vector(3 downto 0);
	signal Escribir: std_logic;
begin	
	Transmisor:entity work.myUartTx(Behavioral)
	port map(
			clk=>clk,
			rst=>rst,
			dataWr=>Escribir,
			dataTx=>sRegData,
			ready=>aux,
			Tx=>tx
	);
	Temporarizador:process(clk, aux, sw_old, sw, sRegData)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				Escribir <= not(BIT_START);
				sw_old <= (others =>'0');
				sRegData <= "00001010";
			else
				sRegData <= sw & "0101";
				Escribir <= not(BIT_START);
				if aux = BIT_STOP then 
					if sRegData /= (sw_old & "0101") then
						sw_old <= sw;						
						Escribir <= BIT_START;-- este muestra que le paso el dato para transmitir la cadena
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
