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
           Y : out STD_LOGIC := '0';
           Displ7S : out STD_LOGIC_VECTOR (7 downto 0) := "00000000";
--           Busy : out std_logic;
--           Clk_XT : in std_logic;
           PS2_Clk : in std_logic;
           PS2_Data : in std_logic;
           
            LCD_E : out std_logic;
            LCD_RS : out std_logic;
            LCD_RW : out std_logic;
            LCD_D : inout std_logic_vector (3 downto 0);
            SF_CE : out std_logic;
            RESET : in std_logic            
           
           
--           V : out std_logic_vector (6 downto 0)
    );
end counter1;

architecture FSM of counter1 is
   
   signal X : STD_LOGIC;
   signal CE : STD_LOGIC;
   
   signal D7Sp : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   signal D7S : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   
   signal DO : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   signal DO_Rdy : std_logic;
   
   signal DI : STD_LOGIC_VECTOR(7 downto 0);
   
   signal ocnt : INTEGER := 0;
   
   signal e_lcd_line1 : std_logic_vector (63 downto 0);
   signal e_lcd_blank1 : std_logic_vector (15 downto 0);
   signal e_lcd_line2 : std_logic_vector (63 downto 0);
   signal e_lcd_blank2 : std_logic_vector (15 downto 0);
           
     COMPONENT PS2_Rx
     PORT(
         PS2_Clk : in std_logic;
         PS2_Data : in std_logic;
         Clk_50mhz : in std_logic;
         Clk_sys : in std_logic;
         DO : out std_logic_vector (7 downto 0);
         DO_Rdy : out std_logic
     );
     END COMPONENT;
     
     COMPONENT zamek
     PORT(
         DO : in  STD_LOGIC_VECTOR (7 downto 0);
         DO_Rdy : in std_logic;
         V : out  STD_LOGIC_VECTOR (7 downto 0);
         CLK : in  STD_LOGIC;
         lcd_line1 : out std_logic_vector (63 downto 0);
         lcd_blank1 : out std_logic_vector (15 downto 0);
         lcd_line2 : out std_logic_vector (63 downto 0);
         lcd_blank2 : out std_logic_vector (15 downto 0)
           
     );
     END COMPONENT;
     
     COMPONENT LCD2x64
     PORT(
         Line1 : in STD_LOGIC_VECTOR (63 downto 0);
         Blank1 : in STD_LOGIC_VECTOR (15 downto 0);
         Line2 : in STD_LOGIC_VECTOR (63 downto 0);
         Blank2 : in STD_LOGIC_VECTOR (15 downto 0);
         Reset : in std_logic;
         Clk_50mhz : in std_logic;
         LCD_E : out std_logic;
         LCD_RS : out std_logic;
         LCD_RW : out std_logic;
         LCD_D : inout std_logic_vector (3 downto 0);
         SF_CE : out std_logic
     );
     END COMPONENT;

begin
   ps2 : PS2_rx port map (PS2_Clk, PS2_Data, CLK, CLK, DO, DO_Rdy);
   zmk : zamek port map (DO, DO_Rdy, D7S, Clk, e_lcd_line1, e_lcd_blank1, e_lcd_line2, e_lcd_blank2);
   dsp: LCD2x64 port map (e_lcd_line1, e_lcd_blank1, e_lcd_line2, e_lcd_blank2, RESET, CLK, LCD_E, LCD_RS, LCD_RW, LCD_D, SF_CE);
   
   Displ7S <= D7S;   

      
end architecture;
