----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 02:01:24 PM
-- Design Name: 
-- Module Name: TB_FA - Behavioral
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

entity TB_FA is
--  Port ( );
end TB_FA;

architecture Behavioral of TB_FA is
    COMPONENT FA
        PORT(   A, B, C_in : IN STD_LOGIC;
                S, C_out : OUT STD_LOGIC);
    END COMPONENT;  
    SIGNAl A, B, C_in : std_logic;
    SIGNAL S, C_out : std_logic;
    
begin UUT: FA PORT MAP(
                A => A,
                B => B,
                S => S,
                C_in => C_in,
                C_out => C_out
           );
process
begin
        A <= '0'; -- set initial values
        B <= '0';
        C_in <= '0';
        
        WAIT FOR 100 ns; -- after 100 ns change inputs
        C_in <= '1';
        
        WAIT FOR 100 ns; --change again
        B <= '1';
        C_in <= '0';
        
        WAIT FOR 100 ns; --change again
        C_in <= '1';
        
        WAIT FOR 100 ns; --change again
        A <= '1';
        B <= '0';
        C_in <= '0';
        
        WAIT FOR 100 ns; --change again
        C_in <= '1';
        
        WAIT FOR 100 ns; --change again
        B <= '1';
        C_in <= '0';
        
        WAIT FOR 100 ns; --change again
        C_in <= '1';
        WAIT; -- will wait forever
    end process;

end Behavioral;
