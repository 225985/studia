-- Vhdl test bench created from schematic C:\Users\lab\Desktop\lab1\lab1\zad1.sch - Mon Oct 03 14:50:59 2011
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
   PORT( x1	:	IN	STD_LOGIC; 
          x2	:	IN	STD_LOGIC; 
          y1	:	OUT	STD_LOGIC; 
          y2	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL x1	:	STD_LOGIC;
   SIGNAL x2	:	STD_LOGIC;
   SIGNAL y1	:	STD_LOGIC;
   SIGNAL y2	:	STD_LOGIC;

BEGIN

   UUT: zad1 PORT MAP(
		x1 => x1, 
		x2 => x2, 
		y1 => y1, 
		y2 => y2
   );

-- *** Test Bench - User Defined Section ***
--   tb : PROCESS
--   BEGIN
--      WAIT; -- will wait forever
--   END PROCESS;
-- *** End Test Bench - User Defined Section ***

   x1 <= '0', '1' after 100 ns, '0' after 300 ns;
   x2 <= '0', '1' after 200 ns, '0' after 400 ns;


END;
