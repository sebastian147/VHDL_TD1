----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:38:53 11/15/2018 
-- Design Name: 
-- Module Name:    myCnt - Behavioral 
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
use ieee.math_real.all;
 USE ieee.numeric_std.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myCntM is
	Generic(M: integer := 100);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           salidaM_2 : out  STD_LOGIC;
           salidaM : out  STD_LOGIC);
end myCntM;

architecture Behavioral of myCntM is
	constant N : integer := integer(ceil(log2(real (M))));
	signal M_counter: std_logic_vector(N-1 downto 0);
	signal aux: std_logic;
	signal rst_count: std_logic;
	type Tstate is (A,B,C);
	signal q_next: Tstate;
	signal q_now: Tstate;
begin
	contador:entity work.myCnt(Behavioral)
		Generic Map(N=>N)
		port map(
			clk=>clk,
			ena=>aux,
			rst=>rst_count,
			q=>M_counter
		);
	temporizador:process(clk, rst)
	begin
		if rst = '1' then
			q_now <= C;
		else
			if rising_edge (clk) then
				if ena = '1' then
					q_now <= q_next;
					aux <= '1';
				end if;
			end if;
		end if;
	end process;
	
	
	logica: process(q_now, M_counter)
	begin
		rst_count <= '0';
		salidaM_2 <= '0';
		salidaM <= '0';
		q_next <= q_now;
		case q_now is
			when A =>
				if M_counter = "0110010" then
					q_next <= B;
					salidaM_2 <= '1';
				end if;
			when B =>
				if M_counter = "1100100" then--revisar como se hace generico
					salidaM <= '1';
					rst_count <= '1';
					q_next <= A;
				end if;
			when C =>
					rst_count <= '1';
					q_next <= A;
				
			when others =>
				q_next <= A;
				rst_count <= '1';
				
		end case;
	end process;		

--to_unsigned(entrada,N_bits)		

end Behavioral;

