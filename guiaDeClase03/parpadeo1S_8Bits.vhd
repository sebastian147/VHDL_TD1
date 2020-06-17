----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:41:53 11/15/2018 
-- Design Name: 
-- Module Name:    parpadeo1S_8Bits - Behavioral 
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

entity parpadeo1S_8Bits is
	 Generic(N:integer:=8);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (N-1 downto 0));
end parpadeo1S_8Bits;

	architecture Behavioral of parpadeo1S_8Bits is
	constant M : integer := 100;--tiempo
	signal aux: std_logic;
	signal d: std_logic_vector(N-1 downto 0);
	signal p:std_logic;
	signal f_value: std_logic_vector(N-1 downto 0);
	signal comparer: std_logic_vector(N-1 downto 0);
	type Tstate is (A,B,C);
	signal q_next: Tstate;
	signal q_now: Tstate;
begin
		d(N-1 downto 1) <= (others => '0');
		d(0) <= '1';
		led <= comparer;
		f_value(N-1) <= '1';
		f_value(N-2 downto 0) <= (others => '0');
		Desplazador:entity work.myShiftReg3(Behavioral)
		Generic Map(N=>N)
		port map(
			  clk => clk,
           rst => rst,
           ena => aux,
           dir => '0',
           dr => '0',
			  dl => p,
			  fun =>"11", -- 00 dir/ 01 d/ 10 dr/ dl 11
			  d=> d,--revisar
           q => comparer
		);	--esto no se mueve cada segundo arreglar
		contador:entity work.myCntM(Behavioral)
		Generic Map(M=>M)
		port map(
				clk=>clk,
				rst=>rst,
				ena=>'1',
				salidaM=>aux
		);
	temporizador: process(clk, rst)
	begin
		if rst = '1' then
			q_now <= A;
		else
			if rising_edge (clk) then
				q_now <= q_next;
			end if;
		end if;
	end process;
	
	
	logica: process(q_now, rst, comparer, f_value)
	begin
		q_next <= q_now;
		case q_now is
			when A =>
				p <= '0';
				if rst = '0' then
					p <= '1';
					q_next <= B;
				end if;
			when B =>
				p <= '0';
				if comparer = f_value then
					q_next <= C;
					p <= '1';
				end if;
			when C=>
				if comparer /= f_value then
					p<='0';
					q_next <= B;
				end if;
			when others =>
				q_next <= A;
				p <= '0';

				
		end case;
	end process;
		

end Behavioral;

