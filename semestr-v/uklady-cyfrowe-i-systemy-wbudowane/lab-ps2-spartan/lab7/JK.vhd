----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:15 11/21/2011 
-- Design Name: 
-- Module Name:    JK - Behavioral 
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

entity JK is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           CLR : in  STD_LOGIC);
end JK;

architecture Dataflow of JK is
   signal Y : STD_LOGIC := '0';
begin
   Q <= Y;


   process (CLK)
   begin
      if CLR = '1' then
         Y <= '0';
      elsif CE = '1' and rising_edge(CLK) then
         if Y = '0' then
            if J = '0' then
               Y <= '0';
            elsif J = '1' then
               Y <= '1';
            end if;
         else
            if K = '0' then
               Y <= '1';
            elsif K = '1' then
               Y <= '0';
            end if;
         end if;
            
      
--         if J = '1' then
--            if K = '1' then
--               Y <= not Y;
--             else
--               Y <= '1';
--             end if;
--         elsif K = '1' then
--            Y <= '0';
--         end if;
--         
      end if;
   end process;

end Dataflow;

