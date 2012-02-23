--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:20:21 12/12/2011
-- Design Name:   
-- Module Name:   C:/Users/lab/Desktop/lab/lab-ps2/lab7/ps2test.vhd
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
 
ENTITY ps2test IS
END ps2test;
 
ARCHITECTURE behavior OF ps2test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter1
    PORT(
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         K : IN  std_logic_vector(4 downto 0);
         Y : OUT  std_logic;
         Displ7S : OUT  std_logic_vector(6 downto 0);
         RS_TX : OUT  std_logic;
         Busy : OUT  std_logic;
         Clk_XT : IN  std_logic;
         PS2_Clk : IN  std_logic;
         PS2_Data : IN  std_logic;
         V : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal K : std_logic_vector(4 downto 0) := (others => '0');
   signal Clk_XT : std_logic := '0';
   signal PS2_Clk : std_logic := '0';
   signal PS2_Data : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   signal Displ7S : std_logic_vector(6 downto 0);
   signal RS_TX : std_logic;
   signal Busy : std_logic;
   signal V : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
   constant Clk_XT_period : time := 10 ns;
   constant PS2_Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter1 PORT MAP (
          CLK => CLK,
          CLR => CLR,
          K => K,
          Y => Y,
          Displ7S => Displ7S,
          RS_TX => RS_TX,
          Busy => Busy,
          Clk_XT => Clk_XT,
          PS2_Clk => PS2_Clk,
          PS2_Data => PS2_Data,
          V => V
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   Clk_XT_process :process
   begin
		Clk_XT <= '0';
		wait for Clk_XT_period/2;
		Clk_XT <= '1';
		wait for Clk_XT_period/2;
   end process;
 
   PS2_Clk_process :process
   begin
		PS2_Clk <= '0';
		wait for PS2_Clk_period/2;
		PS2_Clk <= '1';
		wait for PS2_Clk_period/2;
   end process;
   
   

   -- Stimulus process
   stim_proc: process
    type typeArray is array (0 to 11) of STD_LOGIC_VECTOR (7 downto 0);
     constant znaki: typeArray := (X"3B", X"F0", X"3B", X"1D", X"F0", X"1D", X"2C", X"F0", X"2C", X"2C", X"F0", X"2C");
     
     
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
      
      
         for i in 0 to 11 loop
            DO <= znaki(i);
         End loop;
      wait;
   end process;

END;

--
--   tst: process 
--      constant Bity : std_logic_vector (0 to 20) := "111010011101010010110";
--   
--   begin
--      wait for 50 ns;
--      
--      for i in 0 to 20 loop
--         X <= Bity(i);
--         wait for CLK_period;
--      end loop;
--      
