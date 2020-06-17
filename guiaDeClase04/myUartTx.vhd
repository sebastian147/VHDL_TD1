----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:31 11/22/2018 
-- Design Name: 
-- Module Name:    myUartTx - Behavioral 
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

entity myUartTx is
	generic(baudRate: integer := 9600;
				sysClk:  integer :=50000000;
				dataSize: integer :=8);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           dataWr : in  STD_LOGIC;
           dataTx : in  STD_LOGIC_VECTOR (dataSize-1 downto 0);
           ready : out  STD_LOGIC;
           tx : out  STD_LOGIC);
end myUartTx;

architecture Behavioral of myUartTx is
	constant LINE_IDLE:std_logic:='1';
	constant BIT_STOP:std_logic:='1';
	constant BIT_START:std_logic:='0';

	type Tstate is (ST_IDLE,ST_START,ST_BIT_D0,ST_BIT_D1,ST_BIT_D2,ST_BIT_D3,ST_BIT_D4,ST_BIT_D5,ST_BIT_D6,ST_BIT_D7,ST_STOP);
	signal sRegData_now,sRegData_next:std_logic_vector(dataSize-1 downto 0);
	signal start_timer:std_logic;
	signal sigTC_BR:std_logic;--siganl de terminal count 
	signal st_now,st_next:Tstate;
	signal c_now,c_next:unsigned(12 downto 0);
begin
	Temporarizador:process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				st_now <= ST_IDLE;
				sRegData_now <= (others =>'0');--restear este dato no haria falta
			else
				st_now <= st_next;
				sRegData_now <= sRegData_next;
			end if;
		end if;
	end process;

	Logica:process(dataTx,sRegData_now,dataWr,st_now,sigTC_BR)--UART INTERNA
	begin
		sRegData_next <= sRegData_now;--no cambia, mantiene
		st_next<=st_now;
		ready<='0';
		start_timer<='0';
		tx <=LINE_IDLE;
	
		case st_now is
			when ST_IDLE =>
				ready<='1';--pongo ready en 1
				if dataWr='1' then --si la señal de start es 1 
					sRegData_next<= dataTx;--guardo la informacion en sRegData_next
					st_next<=ST_START; --paso a estado 'start'
					start_timer<='1';
					tx<=BIT_START;
				end if;
			when ST_START =>
				tx<=BIT_START;
				if sigTC_BR ='1' then--no va a hacer nada,a menos que llegue terminal count
					st_next<=ST_BIT_D0;
					tx<=sRegData_now(0);
				end if;
			when ST_BIT_D0 =>
				tx<=sRegData_now(0);
				if sigTC_BR='1' then
					st_next<=ST_BIT_D1;
					tx<=sRegData_now(1);
				end if;
			when ST_BIT_D1 =>
				tx<=sRegData_now(1);
				if sigTC_BR='1' then
					st_next<=ST_BIT_D2;
					tx<=sRegData_now(2);
				end if;
			when ST_BIT_D2 =>
				tx<=sRegData_now(2);
				if sigTC_BR='1' then
					st_next<=ST_BIT_D3;
					tx<=sRegData_now(3);
				end if;
			when ST_BIT_D3 =>
				tx<=sRegData_now(3);
				if sigTC_BR='1' then
					st_next<=ST_BIT_D4;
					tx<=sRegData_now(4);
				end if;
			when ST_BIT_D4 =>
				tx<=sRegData_now(4);
				if sigTC_BR='1' then
					st_next<=ST_BIT_D5;
					tx<=sRegData_now(5);
				end if;			
			when ST_BIT_D5 =>
				tx<=sRegData_now(5);
				if sigTC_BR='1' then
					st_next<=ST_BIT_D6;
					tx<=sRegData_now(6);
				end if;
			when ST_BIT_D6 =>
				tx<=sRegData_now(6);
				if sigTC_BR='1' then
					st_next<=ST_BIT_D7;
					tx<=sRegData_now(7);
				end if;
			when ST_BIT_D7 =>
				tx<=sRegData_now(7);
				if sigTC_BR='1' then
					st_next<=ST_STOP;
					tx<=BIT_STOP;
				end if;
			when ST_STOP =>
				tx<=BIT_STOP;
				if sigTC_BR='1' then
					st_next<=ST_IDLE;
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

