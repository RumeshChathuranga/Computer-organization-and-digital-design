----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 12:48:31 PM
-- Design Name: 
-- Module Name: TB_HA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_HA is
--  Port ( );
end TB_HA;

architecture Behavioral of TB_HA is
    COMPONENT HA
        PORT(   A, B: IN STD_LOGIC;
                S, C : OUT STD_LOGIC);
    END COMPONENT;  
    SIGNAl A, B : std_logic;
    SIGNAL S, C : std_logic;     

begin UUT: HA PORT MAP(
                A => A,
                B => B,
                S => S,
                C => C
       );
process
begin
       A <= '0';
       B <= '0';
       WAIT FOR 100 ns;
       
       A <= '0'; 
       B <= '1';
       WAIT FOR 100 ns;
       
       A <= '1'; 
       B <= '0'; 
       WAIT FOR 100 ns;
       
       A <= '1'; 
       B <= '1'; 
       WAIT FOR 100 ns;
       
       WAIT; -- will wait forever
     end process;



end Behavioral;
