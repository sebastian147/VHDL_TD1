--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:01:40 07/12/2018
-- Design Name:   
-- Module Name:   /home/diego/UTN/Tecnicas Digitales/ISE/guia00/test_myTriState8.vhd
-- Project Name:  guia00
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myTriState8
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
 
ENTITY test_myTriState8 IS
END test_myTriState8;
 
ARCHITECTURE behavior OF test_myTriState8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myTriState8
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         control : IN  std_logic;
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	signal e : std_logic_vector (7 downto 0) ;
   signal c : std_logic ;
   signal s : std_logic_vector (7 downto 0);
 
BEGIN
 
instancia:myTriState8
	port map(
	entrada => e,
	control => c,
	salida => s);

   process
   begin
		e<="00110010";
		c<='0';
		wait for 100ns;
		e<="01001011";
		c<='0';
		wait for 100ns;
		e<="11011101";
		c<='1';
		wait for 100ns;	
		e<="11010010";
		c<='1';
		wait;
   end process;
end behavior;