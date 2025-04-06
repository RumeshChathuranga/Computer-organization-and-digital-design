----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 04:10:16 PM
-- Design Name: 
-- Module Name: AU_SIm - Behavioral
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

entity AU_SIm is
--  Port ( );
end AU_SIm;

architecture Behavioral of AU_SIm is
component AU
    PORT(A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end component;
signal A, S : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal RegSel, Clk, Zero, Carry : std_logic := '0';
begin
UUT: AU
    PORT MAP(
        A => A,
        S => S,
        RegSel => RegSel,
        Clk => Clk,
        Zero => Zero,
        Carry => Carry
    );

process
begin
    Clk <= NOT(Clk); 
    wait for 2ns;
end process;

process
begin
    -- Initialize to 0
    A <= "0000";
    RegSel <= '0';
    wait for 20ns;
    
    -- Test Case 1: Addition 7 + 3 = 10 (no carry, no zero)
    -- Store 7 in Register A
    RegSel <= '1';     
    A <= "0111";        
    wait for 20ns;      
    -- Store 3 in Register B
    RegSel <= '0';      
    A <= "0011";       
    wait for 20ns;     
    
    -- Result should be S="1010" (10), Carry='0', Zero='0'
    
    wait for 20ns;
    
    -- Test Case 2: Addition with carry 9 + 8 = 17 (with carry)
    -- Store 9 in Register A
    RegSel <= '1'; 
    A <= "1001";        
    wait for 20ns;
    
    -- Store 8 in Register B
    RegSel <= '0';    
    A <= "1000";        
    wait for 20ns;
    
    -- Result should be S="0001" (1), Carry='1', Zero='0'
    wait for 20ns;
    
    -- Test Case 3: Zero result 8 + 8 = 16 (with carry and zero)
    -- Store 8 in Register A
    RegSel <= '1';
    A <= "1000";    
    wait for 20ns;
    
    -- Store 8 in Register B
    RegSel <= '0';
    A <= "1000";       
    wait for 20ns;
    
    -- Result should be S="0000" (0), Carry='1', Zero='1'
    

    
    
     
end process;
    
end Behavioral;
