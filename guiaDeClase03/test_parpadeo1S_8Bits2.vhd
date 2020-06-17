--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:32:39 11/22/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase03/test_parpadeo1S_8Bits2.vhd
-- Project Name:  guiaDeClase03
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: parpadeo1S_8Bits2
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
 
ENTITY test_parpadeo1S_8Bits2 IS
END test_parpadeo1S_8Bits2;
 
ARCHITECTURE behavior OF test_parpadeo1S_8Bits2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT parpadeo1S_8Bits2
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btn : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btn : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: parpadeo1S_8Bits2 PORT MAP (
          clk => clk,
          rst => rst,
          btn => btn,
          led => led
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
		rst<='1';
		wait for 100 ns;
		rst<='0';

      wait for clk_period*10;

		wait for 300 ns;
		btn<='1';
		wait for 20ns;
		btn<='0';		
		wait for 10000 ns;
		btn<='1';
		wait for 20ns;
		btn<='0';
		wait for 300 ns;


      wait;
   end process;

END;
