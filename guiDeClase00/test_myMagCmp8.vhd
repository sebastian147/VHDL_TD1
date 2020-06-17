--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:38:57 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_myMagCmp8.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myMagCmp8
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
 
ENTITY test_myMagCmp8 IS
END test_myMagCmp8;
 
ARCHITECTURE behavior OF test_myMagCmp8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myMagCmp8
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         igual : OUT  std_logic;
         aMayorB : OUT  std_logic;
         bMayorA : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal igual : std_logic;
   signal aMayorB : std_logic;
   signal bMayorA : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myMagCmp8 PORT MAP (
          a => a,
          b => b,
          igual => igual,
          aMayorB => aMayorB,
          bMayorA => bMayorA
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		a<="00000000";
		b<="00000000";
      wait for 100 ns;
		a<="01000000";
		b<="00111111";
		wait for 100 ns;
		a<="00011100";
		b<="01100000";
		wait for 100 ns;
		a<="11111000";
		b<="11000000";
		wait for 100 ns;
		a<="00001100";
		b<="00111100";
		wait for 100 ns;
		a<="00000000";
		b<="00000000";
		wait for 100 ns;
		a<="00000000";
		b<="00000000";
		wait for 100 ns;
		a<="00100100";
		b<="10010001";
		wait for 100 ns;
		a<="10001000";
		b<="01001000";
		wait for 100 ns;
		a<="00001100";
		b<="01000001";
		wait for 100 ns;
		a<="00000001";
		b<="00000010";
		wait for 100 ns;
		a<="00100000";
		b<="00000100";
		wait for 100 ns;
		a<="10000000";
		b<="00010000";
		wait for 100 ns;
		a<="00100100";
		b<="01100010";
		wait for 100 ns;
		a<="00000000";
		b<="00000000";
		wait for 100 ns;
		a<="00001000";
		b<="00100000";
		wait for 100 ns;
		a<="00101010";
		b<="00100100";
		wait for 100 ns;
		a<="10010010";
		b<="01010100";
		wait for 100 ns;
		a<="00000000";
		b<="11111111";
		wait for 100 ns;

      wait;
   end process;

END;
