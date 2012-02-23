--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:49:23 11/21/2011
-- Design Name:   
-- Module Name:   C:/Users/lab/Desktop/lab/lab7/jk_test.vhd
-- Project Name:  lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: JK
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
 
ENTITY jk_test IS
END jk_test;
 
ARCHITECTURE behavior OF jk_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT JK
    PORT(
         J : IN  std_logic;
         K : IN  std_logic;
         CLK : IN  std_logic;
         CE : IN  std_logic;
         Q : OUT  std_logic;
         CLR : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '0';
   signal K : std_logic := '0';
   signal CLK : std_logic := '0';
   signal CE : std_logic := '1';
   signal CLR : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JK PORT MAP (
          J => J,
          K => K,
          CLK => CLK,
          CE => CE,
          Q => Q,
          CLR => CLR
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   J <= '1' after 50 ns;


END;
