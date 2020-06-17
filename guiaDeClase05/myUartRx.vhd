----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:14:25 11/22/2018 
-- Design Name: 
-- Module Name:    myUartRx - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myUartRx is
	generic(baudRate: integer := 9600;
				sysClk:  integer :=50000000;
				dataSize: integer :=8);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           dataRd : out  STD_LOGIC;
           dataRx : out  STD_LOGIC_VECTOR (dataSize-1 downto 0);
           rx : in  STD_LOGIC);
end myUartRx;

architecture Behavioral of myUartRx is

	constant BIT_START:std_logic:='0';
	type Tstate is (ST_IDLE, ST_BIT_START,ST_BIT_D0,ST_BIT_D1,ST_BIT_D2,ST_BIT_D3,ST_BIT_D4,ST_BIT_D5,ST_BIT_D6,ST_BIT_D7,ST_STOP);
	signal sRegDataNow,sRegDataNext, dataOldNext, dataOldNow:std_logic_vector(dataSize-1 downto 0);
	signal start_timer:std_logic;
	signal sigTC_BR:std_logic;--siganl de terminal count 
	signal st_now,st_next:Tstate;
	signal c_now,c_next:unsigned(12 downto 0);

begin
	Temporarizador:process(clk)
	begin
		
		if rising_edge(clk) then
			if rst='1' then
				st_now <= ST_IDLE;
				SRegDataNow <=(others=>'0');
				dataOldNow<= (others =>'0');
			else
				st_now<=st_next;
				sRegDataNow <= sRegDataNext;
				dataOldNow<=dataOldNext;
			end if;
		end if;
	end process;

	Logica:process(rx, sigTC_BR, st_now, sRegDataNow, sRegDataNext, dataOldNext, dataOldNow)
	begin
		st_next<=st_now;
		dataRd<='0';
		start_timer<='0';
		sRegDataNext <= sRegDataNow;
		dataOldNext<=dataOldNow;
		--dataRx <= sRegDataNow;
		dataRx<=dataOldNow;
		case st_now is
			when ST_IDLE =>
				if rx = BIT_START then
					start_timer<='1';
					st_next<=ST_BIT_START;
				end if;
			when ST_BIT_START =>
				if sigTC_BR = '1' then
					st_next <= ST_BIT_D0;
					sRegDataNext(0)<=rx;
				end if;
			when ST_BIT_D0 =>
				if sigTC_BR = '1' then
					st_next <= ST_BIT_D1;
					sRegDataNext(1)<=rx;
				end if;
			when ST_BIT_D1 =>
				if sigTC_BR = '1' then
					st_next <= ST_BIT_D2;
					sRegDataNext(2)<=rx;
				end if;
			when ST_BIT_D2 =>
				if sigTC_BR = '1' then
					st_next <= ST_BIT_D3;
					sRegDataNext(3)<=rx;
				end if;
			when ST_BIT_D3 =>
				if sigTC_BR = '1' then
					st_next <= ST_BIT_D4;
					sRegDataNext(4)<=rx;
				end if;
			when ST_BIT_D4 =>
				if sigTC_BR = '1' then
					st_next <= ST_BIT_D5;
					sRegDataNext(5)<=rx;
				end if;
			when ST_BIT_D5 =>
				if sigTC_BR = '1' then
					st_next <= ST_BIT_D6;
					sRegDataNext(6)<=rx;
				end if;
			when ST_BIT_D6 =>
				if sigTC_BR = '1' then
					st_next <= ST_BIT_D7;
					sRegDataNext(7)<=rx;
				end if;
			when ST_BIT_D7 =>
				if sigTC_BR = '1' then
					st_next <= ST_STOP;
					dataOldNext<=sRegDataNow;
					--sRegDataNext(7)<=rx;
				end if;
			when ST_STOP =>
			
				if sigTC_BR = '1' then
					st_next <= ST_IDLE;
					dataRd<='1';
					dataOldNext<=sRegDataNow;
					---dataRx <= sRegDataNow;
				end if;
			when others =>
				st_next<=ST_IDLE;

		end case;
	end process;
	Contador:process(clk)
	begin
		if rising_edge(clk) then
			if start_timer ='1' then
				c_now<=to_unsigned(0,13);	
			else
				c_now<=c_next;
			end if;
		end if;
	end process;
	sigTC_BR <= '1' when c_now =(sysClk/baudRate)-1 else '0';
	c_next <= c_now+1 when c_now /= (sysClk/baudRate)-1 else to_unsigned(0,13);

end Behavioral;

