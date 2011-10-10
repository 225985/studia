-- Vhdl test bench created from schematic C:\Users\lab\Desktop\lab3\zad1\zad1.sch - Mon Oct 10 15:26:00 2011
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY zad1_zad1_sch_tb IS
END zad1_zad1_sch_tb;
ARCHITECTURE behavioral OF zad1_zad1_sch_tb IS 

   COMPONENT zad1
   PORT( Y	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          K0	:	IN	STD_LOGIC; 
          CLK_LF	:	IN	STD_LOGIC; 
          K7	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL Y	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL K0	:	STD_LOGIC;
   SIGNAL CLK_LF	:	STD_LOGIC := '0';
   SIGNAL K7	:	STD_LOGIC;

BEGIN

   UUT: zad1 PORT MAP(
		Y => Y, 
		K0 => K0, 
		CLK_LF => CLK_LF, 
		K7 => K7
   );

   K0 <= '1';
   K7 <= '0';
   CLK_LF <= NOT CLK_LF after 100 ns;


END;
