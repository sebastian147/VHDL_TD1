--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:38:08 11/08/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase02/test_myFFDC.vhd
-- Project Name:  guiaDeClase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myFFDC
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
 
ENTITY test_myFFDC IS
END test_myFFDC;
 
ARCHITECTURE behavior OF test_myFFDC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myFFDC
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myFFDC PORT MAP (
          clk => clk,
          clr => rst,
          d => d,
          q => q
        );

 

   -- Stimulus process
   process
   begin			
      clk<='1';
		wait for 50 ns;
		rst<='1';
		d<='1';
		wait for 50 ns;
		clk<='0';
      wait for 100 ns;
		clk<='1';
		rst<='1';
		d<='1';
		wait for 100 ns;
		clk<='0';
      wait for 100 ns;	
		clk<='1';
		rst<='1';
		d<='0';
		wait for 100 ns;
		clk<='0';
      wait for 100 ns;	


      -- insert stimulus here 

      wait;
   end process;

END;
