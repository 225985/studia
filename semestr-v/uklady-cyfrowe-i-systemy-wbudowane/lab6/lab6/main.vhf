--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : main.vhf
-- /___/   /\     Timestamp : 11/13/2011 14:45:11
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3adsp -flat -suppress -vhdl D:/politechnika/semestr5/semestr-v/uklady-cyfrowe-i-systemy-wbudowane/lab6/lab6/main.vhf -w D:/politechnika/semestr5/semestr-v/uklady-cyfrowe-i-systemy-wbudowane/lab6/lab6/main.sch
--Design Name: main
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

entity decoder_MUSER_main is
   port ( Q0 : in    std_logic; 
          Q1 : in    std_logic; 
          Q2 : in    std_logic; 
          Y  : out   std_logic_vector (0 to 7));
end decoder_MUSER_main;

architecture BEHAVIORAL of decoder_MUSER_main is
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



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity counter_MUSER_main is
   port ( C  : in    std_logic; 
          CE : in    std_logic; 
          Q0 : out   std_logic; 
          Q1 : out   std_logic; 
          Q2 : out   std_logic);
end counter_MUSER_main;

architecture BEHAVIORAL of counter_MUSER_main is
   attribute BOX_TYPE   : string ;
   signal XLXN_34  : std_logic;
   signal XLXN_44  : std_logic;
   signal XLXN_50  : std_logic;
   signal XLXN_51  : std_logic;
   signal XLXN_53  : std_logic;
   signal XLXN_54  : std_logic;
   signal XLXN_60  : std_logic;
   signal Q0_DUMMY : std_logic;
   signal Q1_DUMMY : std_logic;
   signal Q2_DUMMY : std_logic;
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   XLXI_8 : GND
      port map (G=>XLXN_34);
   
   XLXI_16 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>XLXN_34,
                D=>XLXN_44,
                Q=>Q0_DUMMY);
   
   XLXI_17 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>XLXN_34,
                D=>XLXN_50,
                Q=>Q1_DUMMY);
   
   XLXI_18 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>XLXN_34,
                D=>XLXN_60,
                Q=>Q2_DUMMY);
   
   XLXI_19 : INV
      port map (I=>Q0_DUMMY,
                O=>XLXN_44);
   
   XLXI_29 : XOR2
      port map (I0=>Q0_DUMMY,
                I1=>Q1_DUMMY,
                O=>XLXN_50);
   
   XLXI_30 : OR3
      port map (I0=>XLXN_51,
                I1=>XLXN_54,
                I2=>XLXN_53,
                O=>XLXN_60);
   
   XLXI_31 : AND2B1
      port map (I0=>Q1_DUMMY,
                I1=>Q2_DUMMY,
                O=>XLXN_51);
   
   XLXI_32 : AND2B1
      port map (I0=>Q0_DUMMY,
                I1=>Q2_DUMMY,
                O=>XLXN_54);
   
   XLXI_33 : AND3B1
      port map (I0=>Q2_DUMMY,
                I1=>Q0_DUMMY,
                I2=>Q1_DUMMY,
                O=>XLXN_53);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity main is
   port ( C   : in    std_logic; 
          CE  : in    std_logic; 
          Q0c : out   std_logic; 
          Q1c : out   std_logic; 
          Q2c : out   std_logic; 
          R   : out   std_logic; 
          Y   : out   std_logic_vector (0 to 7));
end main;

architecture BEHAVIORAL of main is
   attribute BOX_TYPE   : string ;
   signal Q0c_DUMMY : std_logic;
   signal Q1c_DUMMY : std_logic;
   signal Q2c_DUMMY : std_logic;
   signal Y_DUMMY   : std_logic_vector (0 to 7);
   component counter_MUSER_main
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             Q0 : out   std_logic; 
             Q1 : out   std_logic; 
             Q2 : out   std_logic);
   end component;
   
   component decoder_MUSER_main
      port ( Q0 : in    std_logic; 
             Q1 : in    std_logic; 
             Q2 : in    std_logic; 
             Y  : out   std_logic_vector (0 to 7));
   end component;
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
begin
   Q0c <= Q0c_DUMMY;
   Q1c <= Q1c_DUMMY;
   Q2c <= Q2c_DUMMY;
   Y(0 to 7) <= Y_DUMMY(0 to 7);
   cnt : counter_MUSER_main
      port map (C=>C,
                CE=>CE,
                Q0=>Q0c_DUMMY,
                Q1=>Q1c_DUMMY,
                Q2=>Q2c_DUMMY);
   
   dec : decoder_MUSER_main
      port map (Q0=>Q0c_DUMMY,
                Q1=>Q1c_DUMMY,
                Q2=>Q2c_DUMMY,
                Y(0 to 7)=>Y_DUMMY(0 to 7));
   
   XLXI_4 : OR3
      port map (I0=>Y_DUMMY(6),
                I1=>Y_DUMMY(2),
                I2=>Y_DUMMY(0),
                O=>R);
   
end BEHAVIORAL;


