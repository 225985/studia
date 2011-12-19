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
           V : out  STD_LOGIC_VECTOR (6 downto 0);
           CLK : in  STD_LOGIC
    );
end zamek;

architecture FSM of zamek is
   type state_type is (S0, S1A, S1B, S1C, S2A, S2B, S2C, S3A, S3B, S3C, S4A, S4B, S4C);
   signal next_state, current_state: state_type;
   
begin
   state_reg: process(CLK)
   begin
      if rising_edge(CLK) then
        current_state <= next_state;
      end if;
   end process;

   comb_logic: process(current_state, DO, DO_Rdy)
   begin
      if DO_Rdy = '1' then
      next_state <= current_state;
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
                        
          -- when others => next_state <= S0;
                     
      end case;
      end if;
 
   end process;
   
   di_com: process(current_state)
   begin
      case current_state is
         when S0 =>  V <= "1111111";
         when S1A => V <= "0111111";
         when S1B => V <= "0111111";
         when S1C => V <= "0111111";
         
         when S2A => V <= "0011111";
         when S2B => V <= "0011111";
         when S2C => V <= "0011111";
         
         when S3A => V <= "0011110";
         when S3B => V <= "0011110";
         when S3C => V <= "0011110";
         
         when S4A => V <= "0011100";
         when S4B => V <= "0011100";
         when S4C => V <= "0011100";
       end case;
   end process;
   

end FSM;

