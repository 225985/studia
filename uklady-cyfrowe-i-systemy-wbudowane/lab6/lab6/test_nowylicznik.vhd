-- Vhdl test bench created from schematic D:\politechnika\semestr5\semestr-v\uklady-cyfrowe-i-systemy-wbudowane\lab6\lab6\counter_asyn.sch - Sun Nov 13 14:41:38 2011
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
ENTITY counter_asyn_counter_asyn_sch_tb IS
END counter_asyn_counter_asyn_sch_tb;
ARCHITECTURE behavioral OF counter_asyn_counter_asyn_sch_tb IS 

   COMPONENT counter_asyn
   PORT( Q0	:	OUT	STD_LOGIC; 
          Q1	:	OUT	STD_LOGIC; 
          Q2	:	OUT	STD_LOGIC; 
          C	:	IN	STD_LOGIC; 
          CE	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL Q0	:	STD_LOGIC;
   SIGNAL Q1	:	STD_LOGIC;
   SIGNAL Q2	:	STD_LOGIC;
   SIGNAL C	:	STD_LOGIC := '0';
   SIGNAL CE	:	STD_LOGIC := '1';

BEGIN

   UUT: counter PORT MAP(
		Q0 => Q0, 
		Q1 => Q1, 
		Q2 => Q2, 
		C => C, 
		CE => CE
   );

   C <= not C after 25 ns;
   

END;
