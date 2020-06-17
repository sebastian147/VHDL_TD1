--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:54:51 11/28/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase04/test_myUartRx.vhd
-- Project Name:  guiaDeClase04
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myUartRx
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
 
ENTITY test_myUartRx IS
END test_myUartRx;
 
ARCHITECTURE behavior OF test_myUartRx IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myUartRx
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         dataRd : OUT  std_logic;
         dataRx : OUT  std_logic_vector(7 downto 0);
         rx : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal rx : std_logic := '0';

 	--Outputs
   signal dataRd : std_logic;
   signal dataRx : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myUartRx PORT MAP (
          clk => clk,
          rst => rst,
          dataRd => dataRd,
          dataRx => dataRx,
          rx => rx
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
		wait for clk_period*10;

		rst <= '0';
		--wait for 10000 ns;
		rx<='0';
		wait for 52080 ns;
		rx<='1';
		wait for 52080 ns;
		rx<='0';
		wait for 52080 ns;
		rx<='1';
		wait for 52080 ns;
		rx<='0';
		wait for 52080 ns;
		rx<='1';
		wait for 52080 ns;
		rx<='0';
		wait for 52080 ns;
		rx<='1';
		wait for 52080 ns;
		rx<='0';
		wait for 52080 ns;
		rx<='1';
		wait for 52080 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
