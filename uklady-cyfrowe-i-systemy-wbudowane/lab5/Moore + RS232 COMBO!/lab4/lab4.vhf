--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4.vhf
-- /___/   /\     Timestamp : 10/24/2011 16:38:06
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family xc9500xl -flat -suppress -vhdl "C:/Users/lab/Desktop/lab4/Moore + RS232 COMBO!/lab4/lab4.vhf" -w "C:/Users/lab/Desktop/lab4/Moore + RS232 COMBO!/lab4/lab4.sch"
--Design Name: lab4
--Device: xc9500xl
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AND8_MXILINX_lab4 is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          I4 : in    std_logic; 
          I5 : in    std_logic; 
          I6 : in    std_logic; 
          I7 : in    std_logic; 
          O  : out   std_logic);
end AND8_MXILINX_lab4;

architecture BEHAVIORAL of AND8_MXILINX_lab4 is
   attribute BOX_TYPE   : string ;
   signal S0 : std_logic;
   signal S1 : std_logic;
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   I_36_110 : AND4
      port map (I0=>I0,
                I1=>I1,
                I2=>I2,
                I3=>I3,
                O=>S0);
   
   I_36_127 : AND4
      port map (I0=>I4,
                I1=>I5,
                I2=>I6,
                I3=>I7,
                O=>S1);
   
   I_36_142 : AND2
      port map (I0=>S0,
                I1=>S1,
                O=>O);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4 is
   port ( C      : in    std_logic; 
          Clk_LF : in    std_logic; 
          RS_RX  : in    std_logic; 
          D7S_D  : out   std_logic_vector (3 downto 0); 
          D7S_S  : out   std_logic_vector (7 downto 0); 
          Q0     : out   std_logic; 
          Q1     : out   std_logic; 
          Q2     : out   std_logic; 
          Y      : out   std_logic);
end lab4;

architecture BEHAVIORAL of lab4 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal Blank                    : std_logic_vector (3 downto 0);
   signal CE                       : std_logic;
   signal D                        : std_logic_vector (7 downto 0);
   signal DI                       : std_logic_vector (15 downto 0);
   signal X                        : std_logic;
   signal XLXN_53                  : std_logic;
   signal XLXN_54                  : std_logic;
   signal XLXN_55                  : std_logic;
   signal XLXN_100                 : std_logic;
   signal XLXN_101                 : std_logic;
   signal XLXN_102                 : std_logic;
   signal XLXN_103                 : std_logic;
   signal XLXN_104                 : std_logic;
   signal XLXN_105                 : std_logic;
   signal XLXN_116                 : std_logic;
   signal XLXN_117                 : std_logic;
   signal XLXN_118                 : std_logic;
   signal XLXN_186                 : std_logic;
   signal XLXN_187                 : std_logic;
   signal XLXN_191                 : std_logic;
   signal XLXN_193                 : std_logic;
   signal XLXN_194                 : std_logic;
   signal XLXN_195                 : std_logic;
   signal XLXN_215                 : std_logic;
   signal XLXN_217                 : std_logic;
   signal XLXN_228                 : std_logic;
   signal XLXN_231                 : std_logic;
   signal XLXN_1234                : std_logic;
   signal XLXN_1237                : std_logic;
   signal Q0_DUMMY                 : std_logic;
   signal Q1_DUMMY                 : std_logic;
   signal Q2_DUMMY                 : std_logic;
   signal XLXI_62_Reset_openSignal : std_logic;
   signal XLXI_83_DP_openSignal    : std_logic_vector (3 downto 0);
   component AND8_MXILINX_lab4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             I6 : in    std_logic; 
             I7 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
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
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND4B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component RS232_RX
      port ( Reset  : in    std_logic; 
             Clk_XT : in    std_logic; 
             Rdy    : out   std_logic; 
             DO     : out   std_logic_vector (7 downto 0); 
             RS_RX  : in    std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component Display4x7S
      port ( DI    : in    std_logic_vector (15 downto 0); 
             D7S_D : out   std_logic_vector (3 downto 0); 
             D7S_S : out   std_logic_vector (7 downto 0); 
             DP    : in    std_logic_vector (3 downto 0); 
             Clk   : in    std_logic; 
             Blank : in    std_logic_vector (3 downto 0));
   end component;
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   attribute HU_SET of ESC : label is "ESC_2";
   attribute HU_SET of ONE : label is "ONE_1";
   attribute HU_SET of ZERO : label is "ZERO_0";
begin
   Q0 <= Q0_DUMMY;
   Q1 <= Q1_DUMMY;
   Q2 <= Q2_DUMMY;
   ESC : AND8_MXILINX_lab4
      port map (I0=>XLXN_186,
                I1=>XLXN_187,
                I2=>XLXN_228,
                I3=>D(4),
                I4=>D(3),
                I5=>XLXN_193,
                I6=>D(1),
                I7=>D(0),
                O=>XLXN_1234);
   
   ONE : AND8_MXILINX_lab4
      port map (I0=>XLXN_186,
                I1=>XLXN_187,
                I2=>D(5),
                I3=>D(4),
                I4=>XLXN_191,
                I5=>XLXN_193,
                I6=>XLXN_194,
                I7=>D(0),
                O=>X);
   
   XLXI_23 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>XLXN_1237,
                D=>XLXN_53,
                Q=>Q2_DUMMY);
   
   XLXI_24 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>XLXN_1237,
                D=>XLXN_54,
                Q=>Q1_DUMMY);
   
   XLXI_25 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>XLXN_1237,
                D=>XLXN_55,
                Q=>Q0_DUMMY);
   
   XLXI_40 : AND2
      port map (I0=>Q2_DUMMY,
                I1=>Q0_DUMMY,
                O=>Y);
   
   XLXI_41 : AND3B2
      port map (I0=>Q0_DUMMY,
                I1=>X,
                I2=>Q2_DUMMY,
                O=>XLXN_100);
   
   XLXI_42 : AND3B1
      port map (I0=>X,
                I1=>Q0_DUMMY,
                I2=>Q1_DUMMY,
                O=>XLXN_101);
   
   XLXI_45 : OR2
      port map (I0=>XLXN_101,
                I1=>XLXN_100,
                O=>XLXN_53);
   
   XLXI_46 : AND4B2
      port map (I0=>Q1_DUMMY,
                I1=>Q2_DUMMY,
                I2=>Q0_DUMMY,
                I3=>X,
                O=>XLXN_102);
   
   XLXI_48 : OR2
      port map (I0=>XLXN_103,
                I1=>XLXN_102,
                O=>XLXN_54);
   
   XLXI_49 : AND2B1
      port map (I0=>Q0_DUMMY,
                I1=>Q1_DUMMY,
                O=>XLXN_103);
   
   XLXI_50 : OR4
      port map (I0=>XLXN_118,
                I1=>XLXN_117,
                I2=>XLXN_116,
                I3=>XLXN_105,
                O=>XLXN_55);
   
   XLXI_52 : XOR2
      port map (I0=>X,
                I1=>Q1_DUMMY,
                O=>XLXN_104);
   
   XLXI_53 : AND2B1
      port map (I0=>Q0_DUMMY,
                I1=>XLXN_104,
                O=>XLXN_105);
   
   XLXI_54 : AND2B1
      port map (I0=>Q0_DUMMY,
                I1=>Q2_DUMMY,
                O=>XLXN_116);
   
   XLXI_60 : AND2
      port map (I0=>X,
                I1=>Q2_DUMMY,
                O=>XLXN_117);
   
   XLXI_61 : AND3
      port map (I0=>Q0_DUMMY,
                I1=>X,
                I2=>Q1_DUMMY,
                O=>XLXN_118);
   
   XLXI_62 : RS232_RX
      port map (Clk_XT=>C,
                Reset=>XLXI_62_Reset_openSignal,
                RS_RX=>RS_RX,
                DO(7 downto 0)=>D(7 downto 0),
                Rdy=>XLXN_231);
   
   XLXI_73 : INV
      port map (I=>D(7),
                O=>XLXN_186);
   
   XLXI_74 : INV
      port map (I=>D(6),
                O=>XLXN_187);
   
   XLXI_75 : INV
      port map (I=>D(2),
                O=>XLXN_193);
   
   XLXI_76 : INV
      port map (I=>D(3),
                O=>XLXN_191);
   
   XLXI_77 : INV
      port map (I=>D(1),
                O=>XLXN_194);
   
   XLXI_78 : INV
      port map (I=>D(0),
                O=>XLXN_195);
   
   XLXI_79 : INV
      port map (I=>D(5),
                O=>XLXN_228);
   
   XLXI_80 : AND2
      port map (I0=>XLXN_1234,
                I1=>XLXN_231,
                O=>XLXN_1237);
   
   XLXI_82 : AND2
      port map (I0=>XLXN_217,
                I1=>XLXN_231,
                O=>CE);
   
   XLXI_83 : Display4x7S
      port map (Blank(3 downto 0)=>Blank(3 downto 0),
                Clk=>Clk_LF,
                DI(15 downto 0)=>DI(15 downto 0),
                DP(3 downto 0)=>XLXI_83_DP_openSignal(3 downto 0),
                D7S_D(3 downto 0)=>D7S_D(3 downto 0),
                D7S_S(7 downto 0)=>D7S_S(7 downto 0));
   
   XLXI_84 : OR2
      port map (I0=>XLXN_215,
                I1=>X,
                O=>XLXN_217);
   
   XLXI_86 : BUF
      port map (I=>Q2_DUMMY,
                O=>DI(2));
   
   XLXI_87 : BUF
      port map (I=>Q1_DUMMY,
                O=>DI(1));
   
   XLXI_88 : BUF
      port map (I=>Q0_DUMMY,
                O=>DI(0));
   
   XLXI_90 : BUF
      port map (I=>D(0),
                O=>DI(8));
   
   XLXI_91 : BUF
      port map (I=>D(1),
                O=>DI(9));
   
   XLXI_92 : BUF
      port map (I=>D(2),
                O=>DI(10));
   
   XLXI_93 : BUF
      port map (I=>D(3),
                O=>DI(11));
   
   XLXI_94 : BUF
      port map (I=>D(4),
                O=>DI(12));
   
   XLXI_95 : BUF
      port map (I=>D(5),
                O=>DI(13));
   
   XLXI_96 : BUF
      port map (I=>D(6),
                O=>DI(14));
   
   XLXI_97 : BUF
      port map (I=>D(7),
                O=>DI(15));
   
   XLXI_100 : VCC
      port map (P=>Blank(1));
   
   ZERO : AND8_MXILINX_lab4
      port map (I0=>XLXN_186,
                I1=>XLXN_187,
                I2=>D(5),
                I3=>D(4),
                I4=>XLXN_191,
                I5=>XLXN_193,
                I6=>XLXN_194,
                I7=>XLXN_195,
                O=>XLXN_215);
   
end BEHAVIORAL;


