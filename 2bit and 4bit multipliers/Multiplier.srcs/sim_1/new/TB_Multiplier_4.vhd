library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_Multiplier_4 is
--  Port ( );
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is

component Multiplier_4 is
 Port( A: IN STD_LOGIC_VECTOR(3 downto 0);
       B: IN STD_LOGIC_VECTOR(3 downto 0);
       Y: OUT STD_LOGIC_VECTOR(7 downto 0)
 );
end component;
signal A,B : STD_LOGIC_VECTOR(3 downto 0);
signal Y : STD_LOGIC_VECTOR(7 downto 0);
begin
UUT : Multiplier_4 PORT MAP (
        A => A,
        B => B,
        Y => Y
    );
process
begin
     A<="0000";
     B<="0000";
     wait for 100ns;
     
     A<="0001";
     wait for 100ns;
     
     B<="0001";
     wait for 100ns;
     
     B<="0010";
     wait for 100ns;
     
     B<="0011";
     wait for 100ns;
     
     B<="0100";
     wait for 100ns;
     
     B<="0101";
     wait for 100ns;
     
     B<="0110";
     wait for 100ns;

     B<="0111";
     wait for 100ns;

     B<="1000";
     wait;
end process;
end Behavioral;
