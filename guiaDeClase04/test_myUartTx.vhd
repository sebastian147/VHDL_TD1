--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:55:32 11/28/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase04/test_myUartTx.vhd
-- Project Name:  guiaDeClase04
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myUartTx
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
 
ENTITY test_myUartTx IS
END test_myUartTx;
 
ARCHITECTURE behavior OF test_myUartTx IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myUartTx
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         dataWr : IN  std_logic;
         dataTx : IN  std_logic_vector(7 downto 0);
         ready : OUT  std_logic;
         tx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal dataWr : std_logic := '0';
   signal dataTx : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ready : std_logic;
   signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myUartTx PORT MAP (
          clk => clk,
          rst => rst,
          dataWr => dataWr,
          dataTx => dataTx,
          ready => ready,
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
		dataTx<="01010101";
		dataWr<= '1';
		wait for 50 ns;
		datawr <= '0';
		wait for 20 ns;

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
