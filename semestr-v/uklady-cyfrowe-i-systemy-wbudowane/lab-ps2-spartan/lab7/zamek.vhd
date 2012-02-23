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
           lcd_line1 : out std_logic_vector (63 downto 0);
           lcd_blank1 : out std_logic_vector (15 downto 0);
           lcd_line2 : out std_logic_vector (63 downto 0);
           lcd_blank2 : out std_logic_vector (15 downto 0)           
    );
end zamek;


architecture FSM of zamek is
   type state_type is (S0, S1A, S1B, S1C, S2A, S2B, S2C, S3A, S3B, S3C, S4A, S4B, S4C);
   signal next_state, current_state: state_type;
   
   signal ocnt : INTEGER := 0;
   
    COMPONENT Reg64b
     PORT(
         Din : in STD_LOGIC_VECTOR (7 downto 0);
         Clk: in std_logic;
         Q : out STD_LOGIC_VECTOR ( 63 downto 0);
         Q2 : out STD_LOGIC_VECTOR ( 15 downto 0);
         E : in std_logic
     );
     END COMPONENT;
     
begin
   reg : Reg64b port map (DO, CLK, lcd_line2, lcd_blank2, DO_Rdy);
     
   state_reg: process(CLK)
   begin
      if rising_edge(CLK) then
         current_state <= next_state;
      end if;
   end process;
   
   ocnt_reg: process(CLK)
   begin
      if rising_edge(CLK) then
         if current_state = S4C then
            ocnt <= ocnt + 1;
          else
            ocnt <= 0;
         end if;
      end if;
   end process;

   comb_logic: process(current_state, DO, DO_Rdy)
   begin
      next_state <= current_state;
      
      if ocnt >= 50000000 then
         next_state <= S0;
      elsif DO_Rdy = '1' then
      case current_state is
            -- J
           when S0 =>   if DO = X"3B" then
                           next_state <= S1A;
                        end if;
                        
           when S1A =>  if DO = X"F0" then
                           next_state <= S1B;
                        end if;
           when S1B =>  if DO = X"3B" then
                           next_state <= S1C;
                        end if;
                        
                        
            -- W       
           when S1C =>  if DO = X"1D" then
                           next_state <= S2A;
                        elsif DO = X"3B" then
                           next_state <= S1A;
                        elsif DO /= X"00" then
                           next_state <= S0;
                        end if;
                        
           when S2A =>  if DO = X"F0" then
                           next_state <= S2B;
                        end if;
           when S2B =>  if DO = X"1D" then
                           next_state <= S2C;
                        end if;
                        
                        
            -- T
           when S2C =>  if DO = X"2C" then
                           next_state <= S3A;
                        elsif DO = X"3B" then
                           next_state <= S1A;
                        elsif DO /= X"00" then
                           next_state <= S0;
                        end if;
           when S3A =>  if DO = X"F0" then
                           next_state <= S3B;
                        end if;
           when S3B =>  if DO = X"2C" then
                           next_state <= S3C;
                        end if;
                        
                        
              -- T 
           when S3C =>  if DO = X"2C" then
                           next_state <= S4A;
                        elsif DO = X"3B" then
                           next_state <= S1A;
                        elsif DO /= X"00" then
                           next_state <= S0;
                        end if;
           when S4A =>  if DO = X"F0" then
                           next_state <= S4B;
                        end if;
           when S4B =>  if DO = X"2C" then
                           next_state <= S4C;
                        end if;

                        
           when S4C =>  if DO = X"3B" then
                           next_state <= S1A;
                        elsif DO /= X"00" then
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
         
         when S1A => 
            V <= "10000000";
            lcd_line1 <= X"1000000000000000";
            lcd_blank1 <= X"7FFF";
            
         when S1B => 
            V <= "10000000";
            lcd_line1 <= X"1000000000000000";
            lcd_blank1 <= X"7FFF";
         
         when S1C => 
            V <= "11000000";
            lcd_line1 <= X"1000000000000000";
            lcd_blank1 <= X"7FFF";
         
         
         
         when S2A => 
            V <= "11100000";
            lcd_line1 <= X"2200000000000000";
            lcd_blank1 <= X"3FFF";
            
         when S2B => 
            V <= "11100000";
            lcd_line1 <= X"2200000000000000";
            lcd_blank1 <= X"3FFF";
            
         when S2C => 
            V <= "11110000";
            lcd_line1 <= X"2200000000000000";
            lcd_blank1 <= X"3FFF";
         
         
         
         when S3A => 
            V <= "11111000";
            lcd_line1 <= X"3330000000000000";
            lcd_blank1 <= X"1FFF";
        
        when S3B => 
            V <= "11111000";
            lcd_line1 <= X"3330000000000000";
            lcd_blank1 <= X"1FFF";
         
         when S3C => 
            V <= "11111100";
            lcd_line1 <= X"3330000000000000";
            lcd_blank1 <= X"1FFF";
         
         
         
         
         when S4A => 
            V <= "11111110";
            lcd_line1 <= X"4444000000000000";
            lcd_blank1 <= X"0FFF";
         
         when S4B => 
            V <= "11111110";
            lcd_line1 <= X"4444000000000000";
            lcd_blank1 <= X"0FFF";
         
         when S4C => 
            V <= "11111111";
            lcd_line1 <= X"4444000000000000";
            lcd_blank1 <= X"0FFF";
            
       end case;
   end process;
   

end FSM;

