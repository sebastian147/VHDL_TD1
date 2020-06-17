----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:42:54 11/15/2018 
-- Design Name: 
-- Module Name:    parpadeo1S_8Bits2 - Behavioral 
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

entity parpadeo1S_8Bits2 is
	 Generic(N:integer:=8);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end parpadeo1S_8Bits2;

architecture Behavioral of parpadeo1S_8Bits2 is
	signal fun: std_logic_vector (1 downto 0);
	constant M : integer := 100;--tiempo
	signal aux: std_logic;
	signal d: std_logic_vector(N-1 downto 0);
	signal p:std_logic;
	signal f_valueR,f_valueL: std_logic_vector(N-1 downto 0);
	signal comparer: std_logic_vector(N-1 downto 0);
	type Tstate is (A,B,C);
	signal q_next,q_nextD: Tstate;
	signal q_now,q_nowD: Tstate;
	signal precionado: std_logic;
begin
		d(N-1 downto 1) <= (others => '0');
		d(0) <= '1';
		led <= comparer;
		f_valueL(N-2 downto 0) <= (others => '0');
		f_valueL(N-1) <= '1';
		f_valueR(N-1 downto 1) <= (others => '0');
		f_valueR(0) <= '1';
		
		Desplazador:entity work.myShiftReg3(Behavioral)
		Generic Map(N=>N)
		port map(
			  clk => clk,
           rst => rst,
           ena => aux,
           dir => '0',
           dr => p,
			  dl => p,
			  fun =>fun, -- 00 dir/ 01 d/ 10 dr/ dl 11
			  d => d,--revisar
           q => comparer
		);	--esto no se mueve cada segundo arreglar
		Detector:entity work.myEdgeDetector(Behavioral)
		Generic Map(N=>N)
		port map(
			  clk => clk,
           rst => rst,
           d => btn,
           ascendente => precionado 
		);
		contador:entity work.myCntM(Behavioral)
		Generic Map(M=>M)
		port map(
				clk=>clk,
				rst=>rst,
				ena=>'1',
				salidaM=>aux
		);
			temporizador:process(clk,rst)
	begin
			if rst = '1' then
				q_now <= C;
				q_nowD <= A;
			else		
				if rising_edge (clk) then
					q_now <= q_next;
					q_nowD <=q_nextD;
				end if;
			end if;
	end process;
	
	
	logica_pulsador: process(q_now, precionado)
	begin
		q_next <= q_now;
		case q_now is
			when A =>
				fun <= "10";
				if precionado = '1' then
					q_next <= B;
					fun <= "11";
				end if;
			when B =>
				fun <= "11";
				if precionado = '1' then
					fun <= "10";
					q_next <= A;
				end if;
				
			when C =>
				fun<="10";
				q_next <= A;
				
			when others =>
				q_next <= A;
				fun <= "10";
				
		end case;
	end process;
	logica_dirs: process(q_nowD, comparer, f_valueR, f_valueL, fun, rst)
	begin
		q_nextD <= q_nowD;
		case q_nowD is
			when A =>
				p <= '0';
				if rst = '0' then
					q_nextD <= B;
					p <='1';
				end if;
			when B =>
				p <= '0';
				if fun = "11" then
					if comparer = f_valueL then
						q_nextD <= C;
						p <= '1';
					end if;
				else
					if comparer = f_valueR then
						q_nextD <= C;
						p <= '1';
					end if;
				end if;			
				
			when C =>
				p <= '1';
				if fun = "11" then
					if comparer /= f_valueL then
						q_nextD <= B;

					end if;
				else
					if comparer /= f_valueR then
						q_nextD <= B;
					end if;
				end if;				
			when others =>
				q_nextD <= A;
				p <= '0';
				
		end case;
	end process;

end Behavioral;

