----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:08 12/12/2011 
-- Design Name: 
-- Module Name:    zamek - Behavioral 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity zamek is
    Port ( DO : in  STD_LOGIC_VECTOR (7 downto 0);
           DO_Rdy : in std_logic;
           V : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           DI : out  STD_LOGIC_VECTOR (7 downto 0);
           WE : out std_logic;
           DnI : out std_logic := 1;
           E0 : in std_logic;
           F0 : in std_logic             
    );
end zamek;


architecture FSM of zamek is
   type state_type is (S0, S1, S2, S3, S4);
   signal next_state, current_state: state_type;
   
   signal ocnt : INTEGER := 0;
   signal weSig : INTEGER := 0;
   
    COMPONENT Reg64b
     PORT(
         Din : in STD_LOGIC_VECTOR (7 downto 0);
         Clk: in std_logic;
         Q : out STD_LOGIC_VECTOR ( 63 downto 0);
         Q2 : out STD_LOGIC_VECTOR ( 15 downto 0);
         E : in std_logic;
         E0 : in std_logic;
         F0 : in std_logic
     );
     END COMPONENT;
     
begin
   reg : Reg64b port map (DO, CLK, lcd_line2, lcd_blank2, DO_Rdy, E0, F0);
     
   state_reg: process(CLK)
   begin
      if rising_edge(CLK) then
         current_state <= next_state;
      end if;
   end process;
   
   ocnt_reg: process(CLK)
   begin
      if rising_edge(CLK) then
         if current_state = S4 then
            ocnt <= ocnt + 1;
          else
            ocnt <= 0;
         end if;
      end if;
   end process;

   comb_logic: process(current_state, DO, DO_Rdy, F0, E0)
   begin
      next_state <= current_state;
      
      if ocnt >= 50000000 then
         next_state <= S0;
      elsif DO_Rdy = '1' then
      case current_state is

          when S0 =>   if DO = X"3B" AND E0 = '0' AND F0 = '0' then
                          next_state <= S1;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4; 
                       end if;
                       
          when S1 =>   if DO = X"1D" AND E0 = '0' AND F0 = '0' then
                          next_state <= S2;
                       elsif E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= S0;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4;    
                       elsif DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       end if;
          when S2 =>   if DO = X"2C" AND E0 = '0' AND F0 = '0' then
                          next_state <= S3;
                       elsif E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= S1;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4; 
                       elsif DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       elsif DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S1;
                       end if;
          when S3 =>   if DO = X"2C" AND E0 = '0' AND F0 = '0' then
                          next_state <= S4;
                       elsif E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= S2;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4; 
                       elsif DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       elsif DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S1;
                       end if;
          when S4 =>  if DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S1;
                        elsif E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= S3;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4; 
                        elsif DO /= X"00"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S0;
                        end if;
                        
           when others => 
                     
      end case;
      end if;
 
   end process;
   
   we_reg: process(CLK)
   begin
      if rising_edge(CLK) then
        if weSig = 1 then
         weSig <= 0;

        end if;
      end if;
   end process;
   
   
   dispplayCode : process(current_state, DO, DO_Rdy, F0, E0)
   begin
      next_state <= current_state;
      
      if ocnt >= 50000000 then
         next_state <= S0;
      elsif DO_Rdy = '1' then
      case current_state is

          when S0 =>   if DO = X"3B" AND E0 = '0' AND F0 = '0' then
                          next_state <= S1;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4; 
                       end if;
                       
          when S1 =>   if DO = X"1D" AND E0 = '0' AND F0 = '0' then
                          next_state <= S2;
                       elsif E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= S0;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4;    
                       elsif DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       end if;
          when S2 =>   if DO = X"2C" AND E0 = '0' AND F0 = '0' then
                          next_state <= S3;
                       elsif E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= S1;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4; 
                       elsif DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       elsif DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S1;
                       end if;
          when S3 =>   if DO = X"2C" AND E0 = '0' AND F0 = '0' then
                          next_state <= S4;
                       elsif E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= S2;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4; 
                       elsif DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       elsif DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S1;
                       end if;
          when S4 =>  if DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S1;
                        elsif E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= S3;
                       elsif E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= S4; 
                        elsif DO /= X"00"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S0;
                        end if;
                        
           when others => 
                     
      end case;
      end if;
 
   end process;
   
   
   
   
   
   di_com: process(current_state)
   begin
      case current_state is
         when S0 =>  
            V <= "00000000";
            lcd_line1 <= X"0000000000000000";
            lcd_blank1 <= X"7FFF";
         
         when S1 => 
            V <= "10000000";
            lcd_line1 <= X"1000000000000000";
            lcd_blank1 <= X"7FFF";
         when S2 => 
            V <= "11100000";
            lcd_line1 <= X"2200000000000000";
            lcd_blank1 <= X"3FFF";
        when S3 => 
            V <= "11111000";
            lcd_line1 <= X"3330000000000000";
            lcd_blank1 <= X"1FFF";
       when S4 => 
            V <= "11111110";
            lcd_line1 <= X"4444000000000000";
            lcd_blank1 <= X"0FFF";
         
      end case;
   end process;
   

end FSM;

