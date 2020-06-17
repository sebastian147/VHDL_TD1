--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:38:22 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_myMux.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myMux
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
 
ENTITY test_myMux IS
END test_myMux;
 
ARCHITECTURE behavior OF test_myMux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myMux
    PORT(
         a : IN  std_logic_vector(1 downto 0);
         c : IN  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(1 downto 0) := (others => '0');
   signal c : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myMux PORT MAP (
          a => a,
          c => c,
          s => s
        );

   -- Stimulus process
   stim_proc: process
   begin		
		
		a<="00";
		c<='0';
      wait for 100 ns;
		a<="01";
		c<='0';
		wait for 100 ns;
		a<="10";
		c<='0';
		wait for 100 ns;
		a<="11";
		c<='0';
		wait for 100 ns;
		a<="00";
		c<='1';
		wait for 100 ns;
		a<="01";
		c<='1';
		wait for 100 ns;
		a<="10";
		c<='1';
		wait for 100 ns;
		a<="11";
		c<='1';
		wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
