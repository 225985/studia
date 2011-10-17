-- Vhdl test bench created from schematic C:\Users\lab\Desktop\lab4\lab4\lab4.sch - Mon Oct 17 15:26:09 2011
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
ENTITY lab4_lab4_sch_tb IS
END lab4_lab4_sch_tb;
ARCHITECTURE behavioral OF lab4_lab4_sch_tb IS 

   COMPONENT lab4
   PORT( X	:	IN	STD_LOGIC; 
          CLR	:	IN	STD_LOGIC; 
          CE	:	IN	STD_LOGIC; 
          C	:	IN	STD_LOGIC; 
          Y	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL X	:	STD_LOGIC;
   SIGNAL CLR	:	STD_LOGIC;
   SIGNAL CE	:	STD_LOGIC;
   SIGNAL C	:	STD_LOGIC := '0';
   SIGNAL Y	:	STD_LOGIC;

BEGIN

   UUT: lab4 PORT MAP(
		X => X, 
		CLR => CLR, 
		CE => CE, 
		C => C, 
		Y => Y
   );

   CE <= '1';
   CLR <= '0';

   X <=  '1' after 10 ns, 
         '0' after 60 ns, 
         '0' after 110 ns, 
         '1' after 160 ns, 
         '1' after 210 ns, 
         '0' after 260 ns,
         '0' after 310 ns,
         '0' after 360 ns,
         '0' after 410 ns, 
         '1' after 460 ns, 
         '0' after 510 ns, 
         '1' after 560 ns, 
         '1' after 610 ns, 
         '0' after 660 ns, 
         '0' after 710 ns, 
         '1' after 760 ns, 
         '0' after 810 ns, 
         '1' after 860 ns, 
         '0' after 910 ns;
         
   C <= not C after 25 ns;

END;
