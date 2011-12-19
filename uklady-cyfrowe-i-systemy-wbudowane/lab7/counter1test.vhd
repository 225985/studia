--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:14:42 11/21/2011
-- Design Name:   
-- Module Name:   C:/Users/lab/Desktop/lab/lab7/counter1test.vhd
-- Project Name:  lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter1
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
 
ENTITY counter1test IS
END counter1test;
 
ARCHITECTURE behavior OF counter1test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter1
    PORT(
         CLK : IN  std_logic;
         CE : IN  std_logic;
         CLR : IN  std_logic;
         DIR : in  STD_LOGIC;
         X : in STD_LOGIC;
         Y : out STD_LOGIC
    );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CE : std_logic := '1';
   signal CLR : std_logic := '0';
   signal DIR : std_logic := '1';
   signal X : std_logic := '0';

 	--Outputs
   signal Y : std_logic := '0';

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter1 PORT MAP (
          CLK => CLK,
          CE => CE,
          CLR => CLR,
          X => X,
          Y => Y,
          DIR => DIR
        );

   -- Clock process definitions
--   CLK_process :process
--   begin
--		CLK <= '0';
--		wait for CLK_period/2;
--		CLK <= '1';
--		wait for CLK_period/2;
--   end process;
 
--   CLK <= not CLK after 10 ns;
   CLK <= not CLK after CLK_period / 2;
   
   tst: process 
      constant Bity : std_logic_vector (0 to 20) := "111010011101010010110";
   
   begin
      wait for 50 ns;
      
      for i in 0 to 20 loop
         X <= Bity(i);
         wait for CLK_period;
      end loop;
      
      wait;
   end process;

END;
