--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:05:51 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase01/test_incGray.vhd
-- Project Name:  guiaDeClase01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: incGray
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
 
ENTITY test_incGray IS
END test_incGray;
 
ARCHITECTURE behavior OF test_incGray IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT incGray
    PORT(
         entrada : IN  std_logic_vector(15 downto 0);
         salida : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: incGray PORT MAP (
          entrada => entrada,
          salida => salida
        );
 

   -- Stimulus process
	process
   begin		
		entrada<="0000000010100000";
      wait for 100 ns;	
		entrada<="0000001000100000";
      wait for 100 ns;	
		entrada<="0000010000001000";
      wait for 100 ns;	
		entrada<="0001011000010000";
      wait for 100 ns;	
		entrada<="0000000000000000";
      wait for 100 ns;	
		entrada<="0000000000001000";
      wait for 100 ns;	
		entrada<="0000001100000000";
      wait for 100 ns;	
		entrada<="0000000000000000";
      wait for 100 ns;	
		entrada<="0011011100100110";
      wait for 100 ns;	
		entrada<="0001001001001100";
      wait for 100 ns;	
		entrada<="0001000011110100";
      wait for 100 ns;	
		entrada<="0101010101001001";
      wait for 100 ns;	
		entrada<="0001001001010010";
      wait for 100 ns;	
		entrada<="1100100110000111";
      wait for 100 ns;	
		entrada<="1111111111111111";
      wait for 100 ns;	
		entrada<="0011100101100110";
      wait for 100 ns;	
		entrada<="1111001001111100";
      wait for 100 ns;	
		entrada<="0111100000111000";
      wait for 100 ns;	
		entrada<="1111100000000000";
      wait for 100 ns;	
		entrada<="1010101001001000";
      wait for 100 ns;	
		entrada<="1001010110101000";
      wait for 100 ns;	
		entrada<="1000110001001001";
      wait for 100 ns;	
		entrada<="0000001001000110";
      wait for 100 ns;	
		entrada<="0000001110000000";
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
