--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:22:05 11/08/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase02/test_myShiftReg2.vhd
-- Project Name:  guiaDeClase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myShiftReg2
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
 
ENTITY test_myShiftReg2 IS
END test_myShiftReg2;
 
ARCHITECTURE behavior OF test_myShiftReg2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myShiftReg2
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myShiftReg2 PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          d => d,
          q => q
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
		rst <='1';
		ena <= '0';
		wait for 100 ns;	

      wait for clk_period*10;
		rst<='0';
		d<='1';
		wait for 100 ns;	
		d<='1';
		wait for 100 ns;
		d<='0';
		wait for 100 ns;
		d<='1';
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
		rst<='1';
		wait for 100 ns;
		wait for 100 ns;
		ena <= '0';
		wait for 100 ns;
		d<='1';
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
      wait;
   end process;

END;
