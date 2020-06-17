--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:37:52 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_myTriState.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myTriState
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
 
ENTITY test_myTriState IS
END test_myTriState;
 
ARCHITECTURE behavior OF test_myTriState IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myTriState
    PORT(
         entrada : IN  std_logic;
         control : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic := '0';
   signal control : std_logic := '0';

 	--Outputs
   signal salida : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myTriState PORT MAP (
          entrada => entrada,
          control => control,
          salida => salida
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		entrada<='0';
		control<='0';
		wait for 100 ns;
		entrada<='1';
		control<='0';
		wait for 100 ns;
		entrada<='0';
		control<='1';
		wait for 100 ns;
		entrada<='1';
		control<='1';
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
