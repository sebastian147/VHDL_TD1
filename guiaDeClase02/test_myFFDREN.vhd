--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:53:15 11/08/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase02/test_myFFDREN.vhd
-- Project Name:  guiaDeClase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myFFDREN
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
 
ENTITY test_myFFDREN IS
END test_myFFDREN;
 
ARCHITECTURE behavior OF test_myFFDREN IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myFFDREN
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         d : IN  std_logic_vector(3 downto 0);
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';
   signal d : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(3 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myFFDREN PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          d => d,
          q => q
        );


 

   -- Stimulus process
   process
   begin		

		ena<='1';
      clk<='1';
		rst<='0';
		d<= "1010";
		wait for 100 ns;
		clk<='0';
      wait for 100 ns;
		clk<='1';
		rst<='1';
		d<="1010";
		wait for 100 ns;
		clk<='0';
      wait for 100 ns;	
		clk<='1';
		rst<='1';
		d<="0000";
		wait for 100 ns;
		clk<='0';
      wait for 100 ns;	
		
		ena<='0';
		clk<='1';
		rst<='0';
		d<="1010";
		wait for 100 ns;
		clk<='0';
      wait for 100 ns;
		clk<='1';
		rst<='1';
		d<="1010";
		wait for 100 ns;
		clk<='0';
      wait for 100 ns;	
		clk<='1';
		rst<='1';
		d<="0000";
		wait for 100 ns;
		clk<='0';
      wait for 100 ns;	

      wait;
   end process;

END;
