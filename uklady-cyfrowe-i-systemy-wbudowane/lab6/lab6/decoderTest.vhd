-- Vhdl test bench created from schematic C:\Users\lab\Desktop\lllllll\lab6\decoder.sch - Mon Nov 07 15:16:31 2011
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
ENTITY decoder_decoder_sch_tb IS
END decoder_decoder_sch_tb;
ARCHITECTURE behavioral OF decoder_decoder_sch_tb IS 

   COMPONENT decoder
   PORT( Q0	:	IN	STD_LOGIC; 
          Q2	:	IN	STD_LOGIC; 
          Q1	:	IN	STD_LOGIC; 
          Y	:	OUT	STD_LOGIC_VECTOR (0 TO 7));
   END COMPONENT;

   SIGNAL Q0	:	STD_LOGIC;
   SIGNAL Q2	:	STD_LOGIC;
   SIGNAL Q1	:	STD_LOGIC;
   SIGNAL Y	:	STD_LOGIC_VECTOR (0 TO 7);

BEGIN

   UUT: decoder PORT MAP(
		Q0 => Q0, 
		Q2 => Q2, 
		Q1 => Q1, 
		Y => Y
   );


   Q0 <= '0', '1' after 50 ns, '0' after 100 ns, '1' after 150 ns, '0' after 200 ns, '1' after 250 ns, '0' after 300 ns, '1' after 350 ns;
   Q1 <= '0', '0' after 50 ns, '1' after 100 ns, '1' after 150 ns, '0' after 200 ns, '0' after 250 ns, '1' after 300 ns, '1' after 350 ns;
   Q2 <= '0', '0' after 50 ns, '0' after 100 ns, '0' after 150 ns, '1' after 200 ns, '1' after 250 ns, '1' after 300 ns, '1' after 350 ns;
   


END;
