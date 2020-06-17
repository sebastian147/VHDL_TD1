----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:36:45 10/18/2018 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myCnt is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myCnt;

architecture Behavioral of myCnt is
	signal aux: std_logic_vector(N-1 downto 0);
	signal sumar_restar: std_logic_vector(N downto 0);
	signal resultado: std_logic_vector(N downto 0);
begin
		q <= aux;
		sumar_restar(N downto 1) <= (others => '0');
		sumar_restar(0) <= '1';
		Adder:entity work.fullAdderN(Behavioral)
			Generic Map(N=>N)
			port map(
				a=>aux,
				b=>sumar_restar(N-1 downto 0),
				ci=>sumar_restar(N),
				co=>resultado(N),
				s=>resultado(N-1 downto 0)
				);
				
		temporizador: process(clk)
		begin
			if rising_edge(clk) then
				if rst = '1' then
					aux <= (others => '0');
				else
					if ena = '1' then
						aux <= resultado(N-1 downto 0);
					end if;
				end if;
			end if;
		end process;
end Behavioral;

