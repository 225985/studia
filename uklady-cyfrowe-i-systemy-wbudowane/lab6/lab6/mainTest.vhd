-- Vhdl test bench created from schematic C:\Users\lab\Desktop\lllllll\lab6\main.sch - Mon Nov 07 16:07:50 2011
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
ENTITY main_main_sch_tb IS
END main_main_sch_tb;
ARCHITECTURE behavioral OF main_main_sch_tb IS 

   COMPONENT main
   PORT( Q0c	:	OUT	STD_LOGIC; 
          Q1c	:	OUT	STD_LOGIC; 
          Q2c	:	OUT	STD_LOGIC; 
          Y	:	OUT	STD_LOGIC_VECTOR (0 TO 7); 
          R	:	OUT	STD_LOGIC; 
          C	:	IN	STD_LOGIC; 
          CE	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL Q0c	:	STD_LOGIC;
   SIGNAL Q1c	:	STD_LOGIC;
   SIGNAL Q2c	:	STD_LOGIC;
   SIGNAL Y	:	STD_LOGIC_VECTOR (0 TO 7);
   SIGNAL R	:	STD_LOGIC;
   SIGNAL C	:	STD_LOGIC := '0';
   SIGNAL CE	:	STD_LOGIC := '1';

BEGIN

   UUT: main PORT MAP(
		Q0c => Q0c, 
		Q1c => Q1c, 
		Q2c => Q2c, 
		Y => Y, 
		R => R, 
		C => C, 
		CE => CE
   );

   C <= not C after 50 ns;

END;
