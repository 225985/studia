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
           CLR : in  STD_LOGIC := '0';
--           DIR : in  STD_LOGIC := '1';
           K : in STD_LOGIC_VECTOR (4 downto 0) := "00000";
           Y : out STD_LOGIC := '0';
--           ROT_A : in STD_LOGIC;
--           ROT_B : in STD_LOGIC;
           Displ7S : out STD_LOGIC_VECTOR (6 downto 0) := "0000000";
           RS_TX : out std_logic;
           Busy : out std_logic;
           Clk_XT : in std_logic
    );
end counter1;

architecture FSM of counter1 is
   type state_type is (S0, SA1, SA0, SB1, SB0, SC1, SC0, SD1, SD0);
   signal next_state, current_state: state_type;
   
   signal X : STD_LOGIC;
   signal CE : STD_LOGIC;
   
   
   signal D7Sp : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
   signal D7S : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
   
   signal Start : STD_LOGIC;
   signal Reset : STD_LOGIC;
   signal DI : STD_LOGIC_VECTOR(7 downto 0);
   
   signal ocnt : INTEGER := 0;
--   signal RotL : STD_LOGIC;
--   signal RotR : STD_LOGIC;
   
--   COMPONENT RotaryEnc
--   PORT(
--         ROT_A : IN std_logic;
--         ROT_B : IN std_logic;
--         CLK : IN std_logic;
--         RotL : OUT std_logic;
--         RotR : OUT std_logic
--   );
--   END COMPONENT;
   
     COMPONENT RS232_TX
     PORT(
          DI : in std_logic_vector(7 downto 0);
          Start : in std_logic;
          Reset : in std_logic;
          Clk_XT : in std_logic;
          RS_TX : out std_logic;
          Busy : out std_logic
     );
     END COMPONENT;

--   
begin
   
   rs : RS232_TX port map (DI, Start, Reset, Clk_XT, RS_TX, Busy);
--   ro: RotaryEnc port map (ROT_A, ROT_B, CLK, RotL, RotR);
   
   CE <= '1'; --RotL or RotR;
   --X <= RotR;
   
   
   Displ7S <= D7S;

   state_reg: process(CLK, CE)
   begin
      if CLR = '1' then
         current_state <= S0;
      elsif CE = '1' and rising_edge(CLK) then
         if ocnt >= 500 then
            current_state <= S0;
         else
            current_state <= next_state;
         end if;
      end if;
   end process;
   
   ocnt_reg: process(CLK)
   begin
      if rising_edge(CLK) then
         if current_state = SD0 then
            ocnt <= ocnt + 1;
          else
            ocnt <= 0;
         end if;
      end if;

   end process;
 
   D7Sp <= D7S when rising_edge(Clk_XT);
   Start <= '1' when D7Sp /= D7S else '0';
 
--   x_reg: process(Clk_XT, X)
--   begin
--      if rising_edge(Clk_XT) then
--         if D7Sp /= D7S then
--            Start <= '1';
--            D7Sp <= D7S;
--         else
--            Start <= '0';
--         end if;
--      end if;
--   end process;

   comb_logic: process(current_state, K)
   begin
      next_state <= current_state;
      case current_state is
         when S0 => if K = "00100" then
                        next_state <= SA1;
                    end if;
                    
         when SA1 => if K = "00000" then
                        next_state <= SA0;
                     end if;
                     
         when SA0 => if K = "10000" then
                        next_state <= SB1;
                     elsif K = "00100" then
                        -- nic
                     elsif K /= "00000" then
                        next_state <= S0;
                     end if;    
                     
         when SB1 => if K = "00000" then
                         next_state <= SB0;
                     end if;
                     
         when SB0 => if K = "10000" then
                        next_state <= SC1;
                     elsif K = "00100" then
                        next_state <= SA1;
                     elsif K /= "00000" then
                        next_state <= S0;
                     end if;
                     
         when SC1 => if K = "00000" then
                         next_state <= SC0;
                     end if;
                 
         when SC0 => if K = "01000" then
                        next_state <= SD1;
                     elsif K = "00100" then
                        next_state <= SA1;
                     elsif K /= "00000" then
                        next_state <= S0;
                     end if;
                     
         when SD1 => if K = "00000" then
                         next_state <= SD0;
                     end if;
                     
         when SD0 => if K = "00100" then
                        next_state <= SA1;
                     elsif K /= "00000" then
                        next_state <= S0;
                     end if;
            when others => 
      end case;
 
   end process;
   
   
   
   comb_output: process(current_state)
   begin
      case current_state is
         when SD0 =>  Y <= '1';
         when others => Y <= '0';
         
      end case;
 
   end process;
   
   comb_displ: process(current_state)
   begin
      case current_state is
         when S0  =>  D7S <= "0000000";
         
         when SA1 =>    D7S <= "0111111";
         when SA0 =>    D7S <= "0111111";
         
         when SB1 =>    D7S <= "0011111";
         when SB0 =>    D7S <= "0011111";
         
         when SC1 =>    D7S <= "0011110";
         when SC0 =>    D7S <= "0011110";
         
         when SD1 =>    D7S <= "0011100";
         when SD0 =>    D7S <= "0011100";
         
      end case;
 
   end process;
   
   
   di_com: process(current_state)
   begin
      case current_state is
         when S0 => DI <= "00000000";
         when SA1 => DI <= "00000001";
         when SA0 => DI <= "00000001";
         when SB1 => DI <= "00000010";
         when SB0 => DI <= "00000010";
         when SC1 => DI <= "00000011";
         when SC0 => DI <= "00000011";
         when SD1 => DI <= "00000100";
         when SD0 => DI <= "00000100";
       end case;
   end process;
      
end architecture;




--architecture Dataflow of counter1 is
--   signal JK_S : STD_LOGIC_VECTOR (5 downto 0) := "000000";
--   signal Y : STD_LOGIC_VECTOR (2 downto 0) := "000";
--   signal H : STD_LOGIC_VECTOR (3 downto 0) := "0000";
--   signal RotL : STD_LOGIC;
--   signal RotR : STD_LOGIC;
  
   
--   COMPONENT JK
--   PORT(
--         J : IN  std_logic;
--         K : IN  std_logic;
--         CLK : IN  std_logic;
--         CE : IN  std_logic;
--         Q : OUT  std_logic;
--         CLR : IN  std_logic
--        );
--   END COMPONENT;
--   
--   COMPONENT HexTo7Seg
--   PORT(
--         Hex : IN std_logic_vector (3 downto 0);
--         Displ7S : OUT std_logic_vector (6 downto 0)
--    );
--    END COMPONENT;
    
--   COMPONENT RotaryEnc
--   PORT(
--         ROT_A : IN std_logic;
--         ROT_B : IN std_logic;
--         Clk_XT : IN std_logic;
--         RotL : OUT std_logic;
--         RotR : OUT std_logic
--    );
--    END COMPONENT;
    
--begin
--
--   jks: for i in 0 to 2 generate
--            jkx: JK port map (JK_S(2*i+1), JK_S(2*i), CLK, CE, Y(i), CLR);
--         end generate;
--         
--   dspl: HexTo7Seg port map (H, Displ7S);
--   ro: RotaryEnc port map (ROT_A, ROT_B, Clk_XT, RotL, RotR);
--   
--   CLK <= RotL or RotR;
--   DIR <= (not RotL) and RotR;
--   Q <= Y;
--   H <= ('0' & Y);
--
--      with (DIR & Y) select
--         JK_S <= "0-0-1-" when "1000",
--                 "0-1--1" when "1001",
--                 "0--01-" when "1010",
--                 "1--1-1" when "1011",
--                 "-01-0-" when "1100",
--                 "-0-01-" when "1110",
--                 "-0-1-0" when "1111",
--                 "-10--1" when "1101",
--                 
--                 "0-0--1" when "0001",
--                 "0--11-" when "0010",
--                 "0--0-1" when "0011",
--                 "-11-1-" when "0100",
--                 "-0-10-" when "0110",
--                 "-0-0-1" when "0111",
--                 "-01--0" when "0101",
--                 
--                 "1-0-1-" when others;
--
--   

--end Dataflow;

