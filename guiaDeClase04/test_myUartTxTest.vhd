--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:55:59 11/28/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase04/test_myUartTxTest.vhd
-- Project Name:  guiaDeClase04
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myUartTxTest
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
 
ENTITY test_myUartTxTest IS
END test_myUartTxTest;
 
ARCHITECTURE behavior OF test_myUartTxTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myUartTxTest
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         sw : IN  std_logic_vector(3 downto 0);
         tx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal sw : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myUartTxTest PORT MAP (
          clk => clk,
          rst => rst,
          sw => sw,
          tx => tx
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
      wait for 100 ns;
		rst <= '0';
		sw <= "0101";


      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
