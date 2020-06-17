--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:36:14 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_myAnd2.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myAnd2
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
 
ENTITY test_myAnd2 IS
END test_myAnd2;
 
ARCHITECTURE behavior OF test_myAnd2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myAnd2
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myAnd2 PORT MAP (
          a => a,
          b => b,
          y => y
        );
 

   -- Stimulus process
   process
   begin		

		a<='0';
		b<='0';
		wait for 100ns;
		a<='1';
		b<='0';
		wait for 100ns;
		a<='1';
		b<='1';
		wait for 100ns;
      wait;
   end process;

END;
