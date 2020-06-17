--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:39:10 11/15/2018
-- Design Name:   
-- Module Name:   /home/seba-pc/Documentos/utn/DigitalesI/sdopazo/guiaDeClase02/test_myShiftReg3.vhd
-- Project Name:  guiaDeClase02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myShiftReg3
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
 
ENTITY test_myShiftReg3 IS
END test_myShiftReg3;
 
ARCHITECTURE behavior OF test_myShiftReg3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myShiftReg3
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         dir : IN  std_logic;
         dr : IN  std_logic;
         dl : IN  std_logic;
         fun : IN  std_logic_vector(1 downto 0);
         d : IN  std_logic_vector(3 downto 0);
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';
   signal dir : std_logic := '0';
   signal dr : std_logic := '0';
   signal dl : std_logic := '0';
   signal fun : std_logic_vector(1 downto 0) := (others => '0');
   signal d : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myShiftReg3 PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          dir => dir,
          dr => dr,
          dl => dl,
          fun => fun,
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
		ena <= '1';
		fun <= "10";--para debugear cambiar este valor
		
		wait for 100 ns;	

      wait for clk_period*10;
		rst<='0';
		d<="1101";
		dr<='1';
		dl<='1';
		dir<='1';
		wait for 100 ns;
		dr<='1';
		dl<='1';
		dir<='1';		
		wait for 100 ns;
		dr<='0';
		dl<='0';
		dir<='0';
		wait for 100 ns;
		dr<='1';
		dl<='1';
		dir<='1';
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
		d<="1111";
		dr<='1';
		dl<='1';
		dir<='1';
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
		wait for 100 ns;
      wait;

      wait;
   end process;

END;
