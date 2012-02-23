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


entity Reg64b is
   Port(
      Din : in STD_LOGIC_VECTOR (7 downto 0);
      Clk: in std_logic;
      Q : out STD_LOGIC_VECTOR ( 63 downto 0);
      Q2 : out STD_LOGIC_VECTOR ( 15 downto 0);
      E : in std_logic
   );
end Reg64b;

architecture RTL of Reg64b is
   signal iQ : STD_LOGIC_VECTOR( 63 downto 0);
   signal iQ2 : STD_LOGIC_VECTOR( 15 downto 0) := X"FFFF";
   signal skip : std_logic := '0';
begin
   Q <= iQ;
   Q2 <= iQ2;
   process ( Clk, E )
   begin
      if rising_edge( Clk )  then
         if E = '1' then
            if Din = X"F0" then
               skip <= '1';
            elsif skip = '1' then
               skip <= '0';
            else
               iQ(63 downto 0) <= iQ(55 downto 0) & Din;
               iQ2(15 downto 0) <= iQ2(13 downto 0) & "00";
            end if;
         end if;
      end if;
   end process;
end architecture;



