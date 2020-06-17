----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:03:00 10/04/2018 
-- Design Name: 
-- Module Name:    grayBinario - Behavioral 
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

entity grayBinario is
	Generic(
		N: integer :=4
	);
    Port ( gray : in  STD_LOGIC_VECTOR (N-1 downto 0);
           binario : out  STD_LOGIC_VECTOR (N-1 downto 0));
end grayBinario;

architecture Behavioral of grayBinario is
signal binarioaux:STD_LOGIC_VECTOR(N-1 downto 0);
begin
	binarioaux(0) <= gray(0);
		Reiterativo: for i in 1 to N-1 generate
		binarioaux(i)<= gray(i) xor binarioaux(i-1);
	end generate;
	binario<=binarioaux;

end Behavioral;

