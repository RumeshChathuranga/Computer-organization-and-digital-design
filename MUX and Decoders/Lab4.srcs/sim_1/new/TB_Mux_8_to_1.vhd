library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_8_to_1 is
--  Port ( );
end TB_Mux_8_to_1;

architecture Behavioral of TB_Mux_8_to_1 is
    COMPONENT Mux_8_to_1
    PORT( S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          EN : IN STD_LOGIC;
          D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          Y : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL S : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL EN,Y : STD_LOGIC;
    SIGNAL D : STD_LOGIC_VECTOR( 7 DOWNTO 0);    

begin UUT: Mux_8_to_1 PORT MAP(
    S => S,
    EN => EN,
    Y => Y,
    D => D );

PROCESS
begin
    S <= "000"; EN <= '0'; D <= "00000000";
    WAIT FOR 100 NS;
    
    --Index 230104E -> 111 0000010 11011000 
    EN <= '1'; D <= "11011000";
    WAIT FOR 100 NS;
    
    S <= "001";
    WAIT FOR 100NS;
    
    S <= "010";
    WAIT FOR 100NS;

    S <= "011";
    WAIT FOR 100NS;

    S <= "100";
    WAIT FOR 100NS;

    S <= "101";
    WAIT FOR 100NS;

    S <= "110";
    WAIT FOR 100NS;

    S <= "111";
    WAIT;
END PROCESS;

end Behavioral;
