----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:11 11/21/2011 
-- Design Name: 
-- Module Name:    counter1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilin- primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter1 is
    Port ( CLK : in  STD_LOGIC ;
--           CLR : in  STD_LOGIC := '0';
--           Y : out STD_LOGIC := '0';
           Displ7S : out STD_LOGIC_VECTOR (7 downto 0) := "00000000";
--           Busy : out std_logic;
--           Clk_XT : in std_logic;
           PS2_Clk : in std_logic;
           PS2_Data : in std_logic;
           
--            LCD_E : out std_logic;
--            LCD_RS : out std_logic;
--            LCD_RW : out std_logic;
--            LCD_D : inout std_logic_vector (3 downto 0);
--            SF_CE : out std_logic;
            RESET : in std_logic;
            VGA_HS : out std_logic;
            VGA_VS : out std_logic;
            VGA_R : out std_logic;
            VGA_G : out std_logic;
            VGA_B : out std_logic
           
--           V : out std_logic_vector (6 downto 0)
    );
end counter1;

architecture FSM of counter1 is
   
--   signal X : STD_LOGIC;
--   signal CE : STD_LOGIC;
   
--   signal D7Sp : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   signal D7S : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   
   signal DO : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   signal DO_Rdy : std_logic;
   
   signal DI : STD_LOGIC_VECTOR(7 downto 0);
   
--   signal ocnt : INTEGER := 0;
   
   signal E0 : STD_LOGIC;
   signal F0 : STD_LOGIC;
   
   
   signal Blink : std_logic; 
   signal Cursor : std_logic;
   signal Busy : std_logic;
   
   
--   signal e_lcd_line1 : std_logic_vector (63 downto 0);
--   signal e_lcd_blank1 : std_logic_vector (15 downto 0);
--   signal e_lcd_line2 : std_logic_vector (63 downto 0);
--   signal e_lcd_blank2 : std_logic_vector (15 downto 0);
   
   signal DnI : std_logic;
   signal WE : std_logic;
           
     COMPONENT PS2_Kbd
     PORT(
         PS2_Clk : in std_logic;
         PS2_Data : in std_logic;
         Clk_50mhz : in std_logic;
         Clk_sys : in std_logic;
         DO : out std_logic_vector (7 downto 0);
         DO_Rdy : out std_logic;
         E0 : out std_logic;
         F0 : out std_logic         
     );
     END COMPONENT;
     
     COMPONENT zamek
     PORT(
         DO : in  STD_LOGIC_VECTOR (7 downto 0);
           DO_Rdy : in std_logic;
           V : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           DI : out  STD_LOGIC_VECTOR (7 downto 0);
           WE : out std_logic;
           DnI : out std_logic := '1';
           E0 : in std_logic;
           F0 : in std_logic;
           Busy : in std_logic        
           
     );
     END COMPONENT;
     
     
     COMPONENT LCDWrite
     PORT(
         WE : in std_logic;
         DnI : in std_logic;
         DI : in std_logic_vector (7 downto 0);
         Cursor : in std_logic;
         Blink : in std_logic;
         Reset : in std_logic;
         Clk_50MHz : in std_logic;
         Clk_Sys : in std_logic;
         LCD_E : out std_logic;
         LCD_RS : out std_logic;
         LCD_RW : out std_logic;
         LCD_D : inout std_logic_vector (3 downto 0);
         SF_CE : out std_logic;
         Busy : out std_logic
     );
     END COMPONENT;
     
     COMPONENT VGAtxt48x20
     PORT(
         Char_DI : in std_logic_vector (7 downto 0);
         Char_WE : in std_logic;
         Home : in std_logic;
         NewLine : in std_logic;
         Goto00 : in std_logic;
         CursorOn : in std_logic;
         ScrollEn : in std_logic;
         ScrollClear : in std_logic;
         Clk_50MHz : in std_logic;
         Clk_Sys : in std_logic;
         VGA_HS : out std_logic;
         VGA_VS : out std_logic;
         VGA_RGB : out std_logic;
         Busy : out std_logic
     );
     END COMPONENT;
     
     signal iHome : std_logic := '0';
     signal iNewLine : std_logic := '0';
     signal iGoto00 : std_logic := '0';
     signal iCursorOn : std_logic := '1';
     signal iScrollEn : std_logic := '0';
     signal iScrollClear : std_logic := '0';
     
     signal iVGA_RGB : std_logic := '0';
                

begin
--   ps2 : PS2_rx port map (PS2_Clk, PS2_Data, CLK, CLK, DO, DO_Rdy);
   ps2 : PS2_Kbd port map (PS2_Clk, PS2_Data, CLK, CLK, DO, DO_Rdy, E0, F0); 
   zmk : zamek port map (DO, DO_Rdy, D7S, Clk, DI, WE, DnI, E0, F0, Busy);
   --lcd : LCDWrite port map (WE, DnI, DI, Cursor, Blink, Reset, Clk, Clk, LCD_E, LCD_RS, LCD_RW, LCD_D, SF_CE, Busy);
   vga : VGAtxt48x20 port map (DI, WE, iHome, iNewLine, iGoto00, iCursorOn, iScrollEn, iScrollClear, Clk, Clk, VGA_HS, VGA_VS, iVGA_RGB, Busy);
   
   --dsp: LCD2x64 port map (e_lcd_line1, e_lcd_blank1, e_lcd_line2, e_lcd_blank2, RESET, CLK, LCD_E, LCD_RS, LCD_RW, LCD_D, SF_CE);
   
   Displ7S <= D7S;   
   
   Cursor <= '1';
   Blink <= '1';
   
   VGA_R <= iVGA_RGB;
   VGA_G <= iVGA_RGB;
   VGA_B <= iVGA_RGB;

      
end architecture;
