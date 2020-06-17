--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:05:05 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase01/test_myTryStateN.vhd
-- Project Name:  guiaDeClase01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myTryStateN
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
 
ENTITY test_myTryStateN IS
END test_myTryStateN;
 
ARCHITECTURE behavior OF test_myTryStateN IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myTryStateN
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         c : IN  std_logic_vector(3 downto 0);
         s : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal c : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myTryStateN PORT MAP (
          a => a,
          c => c,
          s => s
        );

 

	process
   begin		
		a<="0110";
		c<="1000";
      wait for 100 ns;
			
		a<="1111";
		c<="1011";
      wait for 100 ns;
			
		a<="0000";
		c<="1100";
      wait for 100 ns;
			
		a<="1010";
		c<="1111";
      wait for 100 ns;
			
		a<="0100";
		c<="0000";
      wait for 100 ns;	
		a<="0001";
		c<="0101";
      wait for 100 ns;
			
		a<="0011";
		c<="1101";
      wait for 100 ns;
			
		a<="0101";
		c<="1010";
      wait for 100 ns;
			
		a<="1000";
		c<="1000";
      wait for 100 ns;
			
		a<="1010";
		c<="1101";
      wait for 100 ns;
			
		a<="1001";
		c<="1011";
      wait for 100 ns;
			
		a<="0110";
		c<="1001";
      wait for 100 ns;
		wait;
   end process;

END;
