----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:23 07/12/2018 
-- Design Name: 
-- Module Name:    myDeco7Seg - Behavioral 
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

entity myDeco7Seg is
	port(entrada:in std_logic_vector (3 downto 0);
		a,b,c,d,e,f,g:out std_logic);
end myDeco7Seg;

architecture Behavioral of myDeco7Seg is

begin

	with entrada select
		a<= '1' when "0000", --0
			'1' when "0010", --2
			'1' when "0011", --3
			'1' when "0101", --5
			'1' when "0111", --7
			'1' when "1000", --8
			'1' when "1001", --9
			'0' when others;

	with entrada select
		b<= '1' when "0000", --0
			 '1' when "0001", --1
			 '1' when "0010", --2
			 '1' when "0011", --3
			 '1' when "0100", --4
			 '1' when "0111", --7
			 '1' when "1000", --8
			 '1' when "1001", --9
			 '0' when others;
	
	with entrada select
		c<= '1' when "0000", --0
			 '1' when "0001", --1
			 '1' when "0011", --3
			 '1' when "0100", --4
			 '1' when "0101", --5
			 '1' when "0110", --6
			 '1' when "0111", --7
			 '1' when "1000", --8
			 '1' when "1001", --9
			 '0' when others;
	with entrada select
		d<= '1' when "0000", --0
			 '1' when "0010", --2
			 '1' when "0011", --3
			 '1' when "0101", --5
			 '1' when "0110", --6
			 '1' when "1000", --8
			 '0' when others;
	with entrada select
		e<= '1' when "0000", --0
			 '1' when "0110", --6
			 '1' when "1000", --8
			 '0' when others;

	with entrada select
		f<= '1' when "0000", --0
			 '1' when "0100", --4
			 '1' when "0101", --5
			 '1' when "0110", --6
			 '1' when "1000", --8
			 '1' when "1001", --9
			 '0' when others;

	with entrada select
		g<= '1' when "0010", --2
			 '1' when "0011", --3
			 '1' when "0100", --4
			 '1' when "0101", --5
			 '1' when "0110", --6
			 '1' when "1000", --8
			 '1' when "1001", --9
			 '0' when others;
		 
	

end Behavioral;

