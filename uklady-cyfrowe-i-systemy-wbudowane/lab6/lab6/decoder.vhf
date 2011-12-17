--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : decoder.vhf
-- /___/   /\     Timestamp : 11/13/2011 14:45:11
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3adsp -flat -suppress -vhdl D:/politechnika/semestr5/semestr-v/uklady-cyfrowe-i-systemy-wbudowane/lab6/lab6/decoder.vhf -w D:/politechnika/semestr5/semestr-v/uklady-cyfrowe-i-systemy-wbudowane/lab6/lab6/decoder.sch
--Design Name: decoder
--Device: spartan3adsp
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity decoder is
   port ( Q0 : in    std_logic; 
          Q1 : in    std_logic; 
          Q2 : in    std_logic; 
          Y  : out   std_logic_vector (0 to 7));
end decoder;

architecture BEHAVIORAL of decoder is
   attribute BOX_TYPE   : string ;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B3 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND3
      port map (I0=>Q2,
                I1=>Q1,
                I2=>Q0,
                O=>Y(7));
   
   XLXI_2 : AND3B3
      port map (I0=>Q2,
                I1=>Q1,
                I2=>Q0,
                O=>Y(0));
   
   XLXI_3 : AND3B2
      port map (I0=>Q2,
                I1=>Q1,
                I2=>Q0,
                O=>Y(1));
   
   XLXI_4 : AND3B2
      port map (I0=>Q2,
                I1=>Q0,
                I2=>Q1,
                O=>Y(2));
   
   XLXI_5 : AND3B2
      port map (I0=>Q1,
                I1=>Q0,
                I2=>Q2,
                O=>Y(4));
   
   XLXI_6 : AND3B1
      port map (I0=>Q2,
                I1=>Q1,
                I2=>Q0,
                O=>Y(3));
   
   XLXI_7 : AND3B1
      port map (I0=>Q1,
                I1=>Q2,
                I2=>Q0,
                O=>Y(5));
   
   XLXI_8 : AND3B1
      port map (I0=>Q0,
                I1=>Q1,
                I2=>Q2,
                O=>Y(6));
   
end BEHAVIORAL;


