--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:40:12 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_myDeco7Seg.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myDeco7Seg
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
 
ENTITY test_myDeco7Seg IS
END test_myDeco7Seg;
 
ARCHITECTURE behavior OF test_myDeco7Seg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myDeco7Seg
    PORT(
         entrada : IN  std_logic_vector(3 downto 0);
         a : OUT  std_logic;
         b : OUT  std_logic;
         c : OUT  std_logic;
         d : OUT  std_logic;
         e : OUT  std_logic;
         f : OUT  std_logic;
         g : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal a : std_logic;
   signal b : std_logic;
   signal c : std_logic;
   signal d : std_logic;
   signal e : std_logic;
   signal f : std_logic;
   signal g : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myDeco7Seg PORT MAP (
          entrada => entrada,
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
          f => f,
          g => g
        );

 

   -- Stimulus process
	process
   begin		
		entrada<="0000";
      wait for 100 ns;
		entrada<="0001";
      wait for 100 ns;
		entrada<="0010";
      wait for 100 ns;
		entrada<="0011";
      wait for 100 ns;
		entrada<="0100";
      wait for 100 ns;
		entrada<="0101";
      wait for 100 ns;
		entrada<="0110";
      wait for 100 ns;
		entrada<="0111";
      wait for 100 ns;
		entrada<="1000";
      wait for 100 ns;
		entrada<="1001";
      wait for 100 ns;
		entrada<="1010";
      wait for 100 ns;
		entrada<="1011";
      wait for 100 ns;
		entrada<="1100";
      wait for 100 ns;
		entrada<="1101";
      wait for 100 ns;
		entrada<="1110";
      wait for 100 ns;
		entrada<="1111";
      wait for 100 ns;



      wait;
   end process;

END;
