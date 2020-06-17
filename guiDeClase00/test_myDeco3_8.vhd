--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:40:37 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_myDeco3_8.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myDeco3_8
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_myDeco3_8 IS
END test_myDeco3_8;
 
ARCHITECTURE behavior OF test_myDeco3_8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myDeco3_8
    PORT(
         entrada : IN  std_logic_vector(2 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myDeco3_8 PORT MAP (
          entrada => entrada,
          salida => salida
        );

 

   -- Stimulus process
   process
   begin		
      -- hold reset state for 100 ns.
		entrada<="001";
      wait for 100 ns;	
		entrada<="010";
      wait for 100 ns;
		entrada<="110";
      wait for 100 ns;
		entrada<="111";
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
