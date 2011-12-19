--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:49:17 12/12/2011
-- Design Name:   
-- Module Name:   C:/Users/lab/Desktop/lab/lab-ps2/lab7/zamekTest.vhd
-- Project Name:  lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zamek
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
 
ENTITY zamekTest IS
END zamekTest;
 
ARCHITECTURE behavior OF zamekTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zamek
    PORT(
         DO : IN  std_logic_vector(7 downto 0);
         DO_Rdy : in std_logic;
         V : OUT  std_logic_vector(6 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal DO : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal DO_Rdy : std_logic := '0';

 	--Outputs
   signal V : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zamek PORT MAP (
          DO => DO,
          DO_Rdy => DO_Rdy,
          V => V,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   

   -- Stimulus process
   stim_proc: process
    type typeArray is array (0 to 38) of STD_LOGIC_VECTOR (7 downto 0);
     constant znaki: typeArray := (
      X"12", X"43", X"76", -- x
      X"92", X"23", X"A6", -- x
      
      X"3B", X"F0", X"3B", -- J
      X"1D", X"F0", X"1D", -- W
      X"2C", X"F0", X"2C", -- T
      
      X"12", X"43", X"76", -- x
      X"92", X"23", X"A6", -- x
     
      X"3B", X"F0", X"3B", -- J
      X"1D", X"F0", X"1D", -- W
      X"2C", X"F0", X"2C", -- T
      X"2C", X"F0", X"2C", -- T 
      
      X"12", X"43", X"76", -- x
      X"92", X"23", X"A6"  -- x
     
     );
     
     
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
      
      
         for i in 0 to 38 loop
            DO <= znaki(i);
            
            DO_Rdy <= '1';
            wait for CLK_period;
            DO_Rdy <= '0';
            --wait for CLK_period/2;
            
            wait for 50 ns;
         End loop;
      wait;
   end process;

END;
