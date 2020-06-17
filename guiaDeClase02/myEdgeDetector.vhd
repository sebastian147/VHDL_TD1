----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:25:41 10/18/2018 
-- Design Name: 
-- Module Name:    myEdgeDetector - Behavioral 
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

entity myEdgeDetector is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           d : in  STD_LOGIC;
           ascendente : out  STD_LOGIC;
           descendente : out  STD_LOGIC);
end myEdgeDetector;

architecture Behavioral of myEdgeDetector is
	type Tstate is (A,B);
	signal q_next: Tstate;
	signal q_now: Tstate;
begin
	
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
	
	
	logica: process(q_now, d)
	begin
		ascendente <= '0';
		descendente <= '0';
		q_next <= q_now;
		case q_now is
			when A =>
				if d = '1' then
					ascendente <= '1';
					q_next <= B;

				end if;
					
			when B =>
				if d = '0' then
					descendente <= '1';
					q_next <= A;
				end if;
				
			when others =>
				q_next <= A;
				
		end case;
	end process;

end Behavioral;

