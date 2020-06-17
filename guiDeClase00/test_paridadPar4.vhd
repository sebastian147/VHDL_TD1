--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:30:04 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_paridadPar4.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: paridadPar4
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
 
ENTITY test_paridadPar4 IS
END test_paridadPar4;
 
ARCHITECTURE behavior OF test_paridadPar4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT paridadPar4
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         p : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal p : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: paridadPar4 PORT MAP (
          a => a,
          p => p
        );

   -- Clock process definitions

   -- Stimulus process
	process
   begin		
      -- hold reset state for 100 ns.
      a<="0000";
		wait for 100 ns;
		a<="0000";
		wait for 100 ns;
		a<="1111";
		wait for 100 ns;
		a<="1000";
		wait for 100 ns;
		a<="0110";
		wait for 100 ns;
		a<="0010";
		wait for 100 ns;
		a<="0101";
		wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
