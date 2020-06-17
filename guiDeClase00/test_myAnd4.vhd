--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:37:23 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_myAnd4.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myAnd4
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
 
ENTITY test_myAnd4 IS
END test_myAnd4;
 
ARCHITECTURE behavior OF test_myAnd4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myAnd4
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myAnd4 PORT MAP (
          a => a,
          y => y
        );

   -- Stimulus process
   process
   begin		
	-- insert stimulus here 
		a<="0000";
		wait for 100ns;
      a<="0001";
		wait for 100ns;
		a<="0010";
		wait for 100ns;		
		a<="0100";
		wait for 100ns;
		a<="1000";
		wait for 100ns;
		a<="1111";
		wait for 100ns;
		a<="0110";
		wait for 100ns;
		a<="0011";
		wait for 100ns;
		wait;
   end process;

END;
