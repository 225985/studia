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
           DnI : out std_logic := '1';
           E0 : in std_logic;
           F0 : in std_logic;
           Busy : in std_logic        
    );
end zamek;


architecture FSM of zamek is
   type state_type is (S0, S0a, S1, S1a, S2, S2a, S3, S3a, B0, B1, B2, B3, S4, R1, R2, R3, R4);
   signal next_state, current_state: state_type;
   
--   signal ocnt : INTEGER := 0;
   signal weSig : std_logic := '0';
   

begin
   DnI <= '1';
     
   state_reg: process(CLK)
   begin
      if rising_edge(CLK) then
         current_state <= next_state;
      end if;
   end process;
   
--   ocnt_reg: process(CLK)
--   begin
--      if rising_edge(CLK) then
----         if current_state = S4 then
----            ocnt <= ocnt + 1;
----          else
----            ocnt <= 0;
----         end if;
----         
----         if current_state /= next_state then
----            weSig <= '1';
----         else 
----            weSig <= '0';
----         end if;
--      end if;
--   end process;
--



   comb_logic: process(current_state, DO, DO_Rdy, F0, E0, Busy)
   begin
      next_state <= current_state;
      
--      if ocnt >= 50000000 then
--         next_state <= S0;
--      els
--      
      
--      if DO_Rdy = '1' AND  then
      case current_state is

          when S0 =>   if DO_Rdy = '1' AND DO = X"3B" AND E0 = '0' AND F0 = '0' then
                          next_state <= S0a;
                       elsif DO_Rdy = '1' AND E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= B0; 
                       end if;
                       
          when S0a => next_state <= S1;
         
                                            
          when S1 =>   if DO_Rdy = '1' AND DO = X"1D" AND E0 = '0' AND F0 = '0' then
                          next_state <= S1a;
                       elsif DO_Rdy = '1' AND E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= R1;
                       elsif DO_Rdy = '1' AND E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= B0;    
                       elsif DO_Rdy = '1' AND DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       end if;
                       
          when R1 => next_state <= S0;
          when R2 => next_state <= S0a;
          when R3 => next_state <= S1a;
          when R4 => next_state <= S2a;
                       
          when S1a => next_state <= S2;
                       
          when S2 =>   if DO_Rdy = '1' AND DO = X"2C" AND E0 = '0' AND F0 = '0' then
                          next_state <= S2a;
                       elsif DO_Rdy = '1' AND E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= R2;
                       elsif DO_Rdy = '1' AND E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= B0; 
                       elsif DO_Rdy = '1' AND DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       elsif DO_Rdy = '1' AND DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S0a;
                       end if;
                       
          when S2a => next_state <= S3;
                       
          when S3 =>   if DO_Rdy = '1' AND DO = X"2C" AND E0 = '0' AND F0 = '0' then
                          next_state <= S3a;
                       elsif DO_Rdy = '1' AND E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= R3;
                       elsif DO_Rdy = '1' AND E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= B0; 
                       elsif DO_Rdy = '1' AND DO /= X"3B"  AND E0 = '0' AND F0 = '0' then 
                           next_state <= S0;
                       elsif DO_Rdy = '1' AND DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S0a;
                       end if;
                       
          when S3a => next_state <= B0;
                       
          when B0 => next_state <= B1;
                     
          when B1 => next_state <= B2;
                     
          when B2 => if Busy = '0' then
                        next_state <= B3;
                     end if;
                     
          when B3 => next_state <= S4;
                       
                       
          when S4 =>  if DO_Rdy = '1' AND DO = X"3B"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S0a;
                        elsif DO_Rdy = '1' AND E0 ='1' AND F0='0' AND DO = X"6B"then
                           next_state <= R4;
                       elsif DO_Rdy = '1' AND E0 ='0' AND F0='0' AND DO = X"76"then
                           next_state <= B0; 
                        elsif DO_Rdy = '1' AND DO /= X"00"  AND E0 = '0' AND F0 = '0' then
                           next_state <= S0;
                        end if;
                     
      end case;
--      end if;
 
   end process;
--   

   
   
   dispplayCode : process(current_state)
   begin
        case current_state is
                       
          when B0 => DI <= X"4F";
                     WE <= '1';
                     
          when B1 => DI <= X"4F";
                     WE <= '0';
                     
          when B2 => DI <= X"4B";
                     WE <= '0';
                     
          when B3 => DI <= X"4B";
                      WE <= '1';
                      
          when S0a => DI <= X"31";
                       WE <= '1';
                       
          when S1a => DI <= X"32";
                       WE <= '1';
                       
          when S2a => DI <= X"33";
                       WE <= '1';
                       
          when S3a => DI <= X"34";
                       WE <= '1';
                       
          when R1 => DI <= X"3C";
                       WE <= '1';
                       
          when R2 => DI <= X"3C";
                       WE <= '1';
                       
          when R3 => DI <= X"3C";
                       WE <= '1';
                       
          when R4 => DI <= X"3C";
                       WE <= '1';
          
          when others =>
                     DI <= X"30";
                     WE <= '0';
               
        end case;
   end process;
    
    
   ledCode : process(current_state)
   begin
         case current_state is
            when S0 =>  
               V <= "00000000";
            when S1 => 
               V <= "00000001";
            when S2 => 
               V <= "00000010";
            when S3 => 
               V <= "00000100";
            when S4 => 
               V <= "00001000";
            when others =>
               V <= "00000000";
               
         end case;
   end process;
    

end FSM;

