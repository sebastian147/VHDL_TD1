--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:39:53 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_myDiv8.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myDiv8
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
 
ENTITY test_myDiv8 IS
END test_myDiv8;
 
ARCHITECTURE behavior OF test_myDiv8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myDiv8
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         div : IN  std_logic_vector(1 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal div : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myDiv8 PORT MAP (
          entrada => a,
          div => div,
          salida => salida
        );

   -- Clock process definitions
 

   -- Stimulus process
   process
   begin		
      -- hold reset state for 100 ns.
		a<="10000000";
		div<="00";
		wait for 100 ns;
		a<="01000000";
		div<="01";
		wait for 100 ns;
		a<="00011100";
		div<="10";
		wait for 100 ns;
		a<="11111000";
		div<="01";
		wait for 100 ns;
		a<="00001100";
		div<="00";
		wait for 100 ns;
		a<="10001000";
		div<="11";
		wait for 100 ns;
		a<="11000000";
		div<="11";
		wait for 100 ns;
		a<="00100100";
		div<="01";
		wait for 100 ns;
		a<="10001000";
		div<="11";
		wait for 100 ns;
		a<="00001100";
		div<="10";
		wait for 100 ns;
		a<="00000001";
		div<="00";
		wait for 100 ns;
		a<="00100000";
		div<="01";
		wait for 100 ns;
		a<="10000000";
		div<="00";
		wait for 100 ns;
		a<="00100100";
		div<="11";
		wait for 100 ns;
		a<="00000000";
		div<="10";
		wait for 100 ns;
		a<="00001000";
		div<="01";
		wait for 100 ns;
		a<="00101010";
		div<="11";
		wait for 100 ns;
		a<="10010010";
		div<="10";
		wait for 100 ns;
		a<="00011000";
		div<="01";
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
