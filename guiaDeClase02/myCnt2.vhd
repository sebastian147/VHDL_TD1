----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:37:53 10/18/2018 
-- Design Name: 
-- Module Name:    myCnt2 - Behavioral 
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

entity myCnt2 is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           dir : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myCnt2;

architecture Behavioral of myCnt2 is
	signal aux: std_logic_vector(N-1 downto 0);
	signal sumar_restar: std_logic_vector(N downto 0);
	signal resultado: std_logic_vector(N downto 0);

begin
		q <= aux;
		Adder:entity work.fullAdderN(Behavioral)
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
					sumar_restar <= (others => '0');
				else
					if ena = '1' then
						if dir = '0' then
							sumar_restar(N downto 1) <= (others => '0');
							sumar_restar(0) <= '1';
						else
							sumar_restar(N downto 1) <= (others => '1');
							sumar_restar(0) <= '0';
						end if;
						aux <= resultado(N-1 downto 0);
					end if;
				end if;
			end if;
		end process;

end Behavioral;

