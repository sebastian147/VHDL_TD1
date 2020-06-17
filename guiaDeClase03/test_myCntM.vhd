--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:01:09 11/22/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase03/test_myCntM.vhd
-- Project Name:  guiaDeClase03
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myCntM
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
 
ENTITY test_myCntM IS
END test_myCntM;
 
	ARCHITECTURE behavior OF test_myCntM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myCntM
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         salidaM_2 : OUT  std_logic;
         salidaM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';

 	--Outputs
   signal salidaM_2 : std_logic;
   signal salidaM : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myCntM PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          salidaM_2 => salidaM_2,
          salidaM => salidaM
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
		rst <= '1';
		ena <= '1';
		wait for 10 ns;
		rst <= '0';
      wait for 100 ns;	

      wait for clk_period*10;
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
