
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myMux is
	port(
		a:in std_logic_vector(1 downto 0);
		c:in std_logic;
		s:out std_logic
	);

end myMux;

architecture Behavioral of myMux is

begin

	s <= a(0) when c = '0' else
		  a(1) when c = '1';
--	process(a,c)
--		begin
--			if c='0' then
--				s<=a(0);
--			else
--				s<=a(1);
--			end if;
--		end process;
end Behavioral;
--
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--package my_data_types is
--
--constant m : integer := 8;       -- size in bits of each inputs , change it if you want to change the size of each input
--type matrix is array (natural range <>) of std_logic_vector (m-1 downto 0);
--end my_data_types;
--use work.my_data_types.all;
--
--
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--
--
--entity myMux is
--	generic(
--			N: integer:=2
--		);
--
--	port(
--		a:in matrix(2**N-1 downto 0);
--		c:in  integer range 2**N-1 downto 0;
--		s:out std_logic_vector (m-1 downto 0)
--	);
--
--end myMux;
--
--architecture Behavioral of myMux is
--
--begin
--
--	s <= a(c);
--
--end Behavioral;
--
--
	