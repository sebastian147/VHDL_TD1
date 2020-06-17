--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:06:26 11/08/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase02/test_myEdgeDetector.vhd
-- Project Name:  guiaDeClase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myEdgeDetector
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
 
ENTITY test_myEdgeDetector IS
END test_myEdgeDetector;
 
ARCHITECTURE behavior OF test_myEdgeDetector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myEdgeDetector
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         d : IN  std_logic;
         ascendente : OUT  std_logic;
         descendente : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal ascendente : std_logic;
   signal descendente : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myEdgeDetector PORT MAP (
          clk => clk,
          rst => rst,
          d => d,
          ascendente => ascendente,
          descendente => descendente
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		d <= '1';
		rst <= '0';
		wait for 100 ns;
		d <= '0';
		rst <= '0';
		wait for 100 ns;
		d <= '0';
		rst <= '1';
		wait for 100 ns;
		d <= '1';
		rst <= '1';
		wait for 100 ns;
		d <= '1';
		rst <= '0';
		wait for 100 ns;				


      wait;
   end process;

END;
