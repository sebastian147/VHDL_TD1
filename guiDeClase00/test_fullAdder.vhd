--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:41:24 10/25/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiDeClase00/test_fullAdder.vhd
-- Project Name:  guiDeClase00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fullAdder
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
 
ENTITY test_fullAdder IS
END test_fullAdder;
 
ARCHITECTURE behavior OF test_fullAdder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fullAdder
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         ci : IN  std_logic;
         s : OUT  std_logic;
         co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal ci : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fullAdder PORT MAP (
          a => a,
          b => b,
          ci => ci,
          s => s,
          co => co
        );


 

   -- Stimulus process
	process
   begin
		a<='0';
		b<='0';
		ci<='0';
      wait for 100 ns;
		a<='0';
		b<='1';
		ci<='0';
		wait for 100 ns;		
		a<='0';
		b<='0';
		ci<='1';
		wait for 100 ns;
		a<='0';
		b<='1';
		ci<='1';
		wait for 100 ns;
		a<='1';
		b<='1';
		ci<='0';
		wait for 100 ns;
		a<='1';
		b<='0';
		ci<='0';
		ci<='1';
		wait for 100 ns;
		a<='1';
		b<='1';
		ci<='1';
		wait for 100 ns;
		a<='1';
		b<='0';
		ci<='1';
		wait for 100 ns;
		a<='1';
		b<='1';
		ci<='1';
		wait for 100 ns;

      wait;
   end process;

END;
