----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:40:08 10/18/2018 
-- Design Name: 
-- Module Name:    myEdgeCnt - Behavioral 
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

entity myEdgeCnt is
	 Generic(N:integer:=4);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myEdgeCnt;

architecture Behavioral of myEdgeCnt is
	signal aux: std_logic;

begin
			contador:entity work.myCnt(Behavioral)
			Generic Map(N=>N)
			port map(
				clk=>clk,
				ena=>aux,
				rst=>rst,
				q=>q
				);
			detector:entity work.myEdgeDetector(Behavioral)
			port map(
				clk=>clk,
				rst=>rst,
				d=>d,
				ascendente=>aux
				);

end Behavioral;

