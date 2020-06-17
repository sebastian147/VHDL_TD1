----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:49 11/15/2018 
-- Design Name: 
-- Module Name:    parpadeo1S - Behavioral 
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

entity parpadeo1S is
	Generic(N: integer := 100);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC);
end parpadeo1S;

architecture Behavioral of parpadeo1S is
	signal aux: std_logic;
	signal tiempo: std_logic;
	type Tstate is (A,B);
	signal q_next: Tstate;
	signal q_now: Tstate;
begin

		alternador:entity work.FFT(Behavioral)
		port map(
				clk=>clk,
				rst=>rst,
				t=>aux,
				q=>tiempo
		);
		contador:entity work.myCntM(Behavioral)
		Generic Map(M=>N)
		port map(
				clk=>clk,
				rst=>rst,
				ena=>'1',
				salidaM=>aux
		);
		temporizador:process(clk,rst)
	begin
		if rst ='1' then
			q_now <= A;
		else
			if rising_edge (clk) then
				q_now <= q_next;
			end if;
		end if;
	end process;
	
	
	logica: process(q_now,  tiempo)
	begin
		q_next <= q_now;
		case q_now is
			when A =>
				led <= '0';
				if tiempo = '1' then
					led <= '1';
					q_next <= B;
				end if;
					
			when B =>
				led <= '1';
				if tiempo = '1' then
					led <= '0';
					q_next <= A;
				end if;
			when others =>
				q_next <= A;
				led <= '0';

				
		end case;
	end process;

end Behavioral;

