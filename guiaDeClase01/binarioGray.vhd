----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:48 10/04/2018 
-- Design Name: 
-- Module Name:    binarioGray - Behavioral 
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

entity binarioGray is
	Generic(
		N: integer :=4
	);
    Port ( binario : in  STD_LOGIC_VECTOR (N-1 downto 0);
           gray : out  STD_LOGIC_VECTOR (N-1 downto 0));
end binarioGray;

architecture Behavioral of binarioGray is
signal binariodesplazado: STD_LOGIC_VECTOR (N-1 downto 0);
begin
	binariodesplazado <= '0' & binario(N-1 downto 1);
	Reiterativo: for i in 0 to N-1 generate
		gray(i)<= binario(i) xor binariodesplazado(i);
	end generate;
end Behavioral;

