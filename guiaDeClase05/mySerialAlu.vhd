----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:42:33 11/28/2018 
-- Design Name: 
-- Module Name:    mySerialAlu - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mySerialAlu is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           tx : out  STD_LOGIC;
           rx : in  STD_LOGIC);
end mySerialAlu;

architecture Behavioral of mySerialAlu is
	type Tstate is (ST_Comando, ST_Dato0, ST_Dato1, ST_Operacion, ST_EmpezarEnvio, ST_Dato0R, ST_Dato1R, ST_COMAMD);
	signal st_now, st_next:Tstate;

	signal Leido, Mandando,Listo_Para_Mandar: std_logic;
	signal sComando_now,scomando_next,SDato0_now,SDato0_next,SDato1_now,SDato1_next ,DatoALeer:std_logic_vector(7 downto 0);--,SDato0R_now,SDato0R_next,SDato1R_now,SDato1R_next
	signal Salida:std_logic_vector(7 downto 0);

--	signal Resultado, DatoSR0,DatoSR1:std_logic_vector(7 downto 0); 
--	signal SR: std_logic;--, carry
--	
--	signal Incrementer, Value,ANS:std_logic_vector(15 downto 0);
--	signal ID: std_logic;--, CAR
	signal ANS:std_logic_vector(15 downto 0);
	
	signal storage_next,storage_now:std_logic_vector(15 downto 0);
	
--	signal DarVuelta,DadoVuelta:std_logic_vector(7 downto 0);
	
	
begin
	Uart:entity work.myUart(Behavioral)
	--Generic Map(baudRate=>baudRate, sysClk=>sysClk, dataSize=>dataSize)
	port map(
			  clk =>clk,
           rst =>rst,
           dataWr =>Mandando,
           dataTx =>Salida,
           ready =>Listo_Para_Mandar,
           tx =>tx,
           dataRd =>Leido,
           dataRx =>DatoALeer,
           rx =>rx
			  );
--	Sumador8:entity work.fullAdderN(Behavioral)
--	Generic Map(N=>8)
--	port map(
--			  a =>DatoSR0,
--			  b =>DATOSR1,
--           ci =>SR,--si suma o resta
--           s  =>Resultado,
--           co =>open
--			  );
--	Sumador16:entity work.fullAdderN(Behavioral)
--	Generic Map(N=>16)
--	port map(
--			  a =>Incrementer,
--			  b =>Value,
--           ci =>ID,--si suma o resta
--           s  =>ANS,
--			  co =>open
--		);
--	Inverter:entity work.myReverse(arch_myReverse)
--	Generic Map(N=>8)
--	port map(
--			  dataIn=>DarVuelta,
--			  dataOut =>DadoVuelta
--		);
	Temporarizador:process(clk)
	begin
		
		if rising_edge(clk) then
			if rst='1' then
				st_now <= ST_Comando;
				
				sComando_now <= (others=>'0');
				SDato0_now <= (others=>'0');
				SDato1_now <= (others=>'0');
			--	SDato0R_now <= (others=>'0');
			--	SDato1R_now <= (others=>'0');
				storage_now <= (others=>'0');
			else
				st_now<=st_next;
				scomando_now<=scomando_next;
				SDato0_now<=SDato0_next;
				SDato1_now<=SDato1_next;
			--	SDato0R_now<=SDato0R_next;
			--	SDato1R_now<=SDato1R_next;
				storage_now<=storage_next;
			end if;
		end if;
	end process;

	Logica_entrada:process(  ANS, storage_now, Listo_Para_Mandar, mandando, scomando_now, Leido, st_now, SDato0_now, SDato1_now, DatoALeer)-- SDato0R_now, SDato1R_now, DadoVuelta, Resultado )
	begin
		st_next<=st_now;
		scomando_next<=scomando_now;
		SDato0_next<=SDato0_now;
		SDato1_next<=SDato1_now;
	--	SDato0R_next<=SDato0R_now;
	--	SDato1R_next<=SDato1R_now;
		
		salida <= (others => '0');
		mandando <= '0';
--		DatoSR0 <= (others => '1');
--		DatoSR1 <= (others => '1');
--		Sr <= '1';
--		iD<= '1';
--		Incrementer(15 downto 8)<= (others => '1');--
--		Incrementer(7 downto 0)<= (others => '1');--
--		value(0)<='1';--
--		value(15 downto 1) <= (others => '1');--
		ANS <= (others => '0');
		storage_next<= storage_now;
		--DarVuelta<=DatoALeer;--

		case st_now is
			when ST_Comando =>
				if Leido = '1' then
					st_next <= ST_Dato0;
					--DarVuelta<=DatoALeer;
					--sComando_next<=DadoVuelta;
					sComando_next<=DatoALeer;


				end if;
			when ST_Dato0 =>
				if Leido = '1' then
					st_next <= ST_Dato1;
					--DarVuelta <= DatoALeer;
					--SDato0_next<=DadoVuelta;
					SDato0_next<=DatoALeer;


				end if;
			when ST_Dato1 =>
				if Leido = '1' then
					st_next <= ST_Operacion;
					--DarVuelta <= DatoALeer;
					--SDato1_next<=DadoVuelta;
					SDato1_next<=DatoALeer;
					salida <= DatoALeer;




				end if;
			when ST_Operacion =>
				case sComando_now is
					when "00000000" =>--tested
						sDato0_next<=not(SDato0_now);
						sDato1_next<=not(sDato1_now);
						st_next<=ST_EmpezarEnvio;
					when "00000001" =>--tested
						--SR <= '0';
						--DatoSR0<=SDato0_now;
						--DatoSR1<=SDato1_now;
						--sDato0_next<=Resultado;
						sDato0_next<=std_logic_vector(signed(SDato0_now)+signed(SDato1_now));
						--sDato1_next<=(others=> ((not(SDato0_now(7)) and not(SDato1_now(7)) and Resultado(7)) or((SDato0_now(7)) and SDato1_now(7) and not(Resultado(7)))));
						sDato1_next<=(others=> ((not(SDato0_now(7)) and not(SDato1_now(7)) and sDato0_next(7)) or((SDato0_now(7)) and SDato1_now(7) and not(sDato0_next(7)))));
						st_next<=ST_EmpezarEnvio;
						
					when "00000010" =>
--						SR <= '1';
--						DatoSR0<=SDato0_now;
--						DatoSR1<=not(SDato1_now);
--						sDato0_next<=Resultado;
						sDato0_next<=std_logic_vector(signed(SDato0_now)-signed(SDato1_now));
						--sDato1_next<=(others=> ((not(SDato0_now(7)) and SDato1_now(7) and Resultado(7)) or((SDato0_now(7)) and not(SDato1_now(7)) and not(Resultado(7)))));
						sDato1_next<=(others=> ((not(SDato0_now(7)) and SDato1_now(7) and sDato0_next(7)) or((SDato0_now(7)) and not(SDato1_now(7)) and not(sDato0_next(7)))));
						st_next<=ST_EmpezarEnvio;


						
					when "00000011" =>
						sDato0_next <= SDato0_now and SDato1_now;
						sDato1_next <= (others => '0');
						st_next<=ST_EmpezarEnvio;
						
					when "00000100" => 
						sDato0_next <= SDato0_now or SDato1_now;
						sDato1_next <= (others => '0');
						st_next<=ST_EmpezarEnvio;
						
					when "00000101" =>
--						id <= '0';
--						Value(0) <= '1';
--						Value(15 downto 1) <= (others => '0');
--						Incrementer(15 downto 8) <= SDato0_now; 
--						Incrementer(7 downto 0) <= SDato1_now;
						ANS<=std_logic_vector(signed(SDato0_now & SDato1_now)+1);
						sDato0_next<=ANS(15 downto 8);
						sDato1_next<=ANS(7 downto 0);
						
						st_next<=ST_EmpezarEnvio;
					
					when "00000110" =>
--						id <= '1';
--						Value(0) <= '0';
--						Value(15 downto 1) <= (others => '1');
--						Incrementer(15 downto 8) <= SDato0_now; 
--						Incrementer(7 downto 0) <= SDato1_now;
						ANS<=std_logic_vector(signed(SDato0_now & SDato1_now)-1);
						sDato0_next<=ANS(15 downto 8);
						sDato1_next<=ANS(7 downto 0);
						st_next<=ST_EmpezarEnvio;
						
					when "00000111" =>
						storage_next(15 downto 8)<= SDato0_now;
						storage_next(7 downto 0) <= SDato1_now;
						st_next<=ST_Comando;

					when "00001000" =>
						sDato0_next<=storage_now(15 downto 8);
						sDato1_next<=storage_now(7 downto 0);
						st_next<=ST_EmpezarEnvio;
					
					when "00001001" =>
						st_next<=ST_EmpezarEnvio;
						sDato0_next<=SDato0_now;
						case SDato0_now is
							when "00000000" =>
								sDato1_next<=SDato1_now;
							when "00000001" =>
								sDato1_next<=SDato1_now(6 downto 0) & SDato1_now(7);
							when "00000010" =>
								sDato1_next<=SDato1_now(5 downto 0) & SDato1_now(7 downto 6);											
							when "00000011" =>
								sDato1_next<=SDato1_now(4 downto 0) & SDato1_now(7 downto 5);
							when "00000100" =>
								sDato1_next<=SDato1_now(3 downto 0) & SDato1_now(7 downto 4);
							when "00000101" =>
								sDato1_next<=SDato1_now(2 downto 0) & SDato1_now(7 downto 3);
							when "00000110" =>
								sDato1_next<=SDato1_now(1 downto 0) & SDato1_now(7 downto 2);
							when "00000111" =>
								sDato1_next<=SDato1_now(0) & SDato1_now(7 downto 1);
							when "11111111" =>
								sDato1_next<=SDato1_now(0) & SDato1_now(7 downto 1);

							when "11111110" =>
								sDato1_next<=SDato1_now(1 downto 0) & SDato1_now(7 downto 2);
							when "11111101" =>
								sDato1_next<=SDato1_now(2 downto 0) & SDato1_now(7 downto 3);
							when "11111100" =>
								sDato1_next<=SDato1_now(3 downto 0) & SDato1_now(7 downto 4);
							when "11111011" =>
								sDato1_next<=SDato1_now(4 downto 0) & SDato1_now(7 downto 5);
							when "11111010" =>
								sDato1_next<=SDato1_now(5 downto 0) & SDato1_now(7 downto 6);
							when "11111001" =>
								sDato1_next<=SDato1_now(6 downto 0) & SDato1_now(7);
							when others =>
								sDato1_next<=(others=>'0');
						end case;
					
					when "00001010" =>
						if (SDato1_now(7) = '1') then
							SDato0_next <= (others =>'1');
						else
							SDato0_next <= (others =>'0');
						end if;
						st_next<=ST_EmpezarEnvio;
						SDato1_next<=SDato1_now;
						


						
					when others =>--tested
						sDato0_next<=sComando_now;
						sDato1_next<=sComando_now;
						st_next<=ST_EmpezarEnvio;
						
				end case;
			when ST_EmpezarEnvio =>
				if Listo_Para_Mandar = '1' then
					mandando <= '1';
					st_next <= ST_COMAMD;
					--DarVuelta<=sComando_now;
					--Salida<=DadoVuelta;
					Salida<=sComando_now;

				end if;
			when ST_COMAMD =>
				if Listo_Para_Mandar = '1' then
					mandando <= '1';
					st_next <= ST_Dato0R;
					--DarVuelta<=SDato0R_now;
					--Salida<=DadoVuelta;
					Salida<=SDato0_now;
				end if;
			when ST_Dato0R =>
				if Listo_Para_Mandar = '1' then
					mandando <= '1';
					st_next <= ST_Dato1R;
					--DarVuelta<=SDato1R_now;
					--Salida<=DadoVuelta;
					Salida<=SDato1_now;
				end if;
			when ST_Dato1R =>
				if Listo_Para_Mandar = '1' then
					st_next <= ST_Comando;
				end if;
			when others =>
				st_next<=ST_Comando;

		end case;
	end process;
	


end Behavioral;

