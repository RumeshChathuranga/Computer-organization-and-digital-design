library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is
    COMPONENT Decoder_2_to_4
        PORT( I : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
              EN : IN STD_LOGIC;
              Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    SIGNAL I : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL EN : STD_LOGIC;
    SIGNAL Y : STD_LOGIC_VECTOR(3 DOWNTO 0);  

begin UUT: Decoder_2_to_4 port map(
    I => I,
    EN => EN,
    Y => Y);
    
PROCESS
BEGIN
    EN <= '0'; I <= "00";
    
    WAIT FOR 100NS;
    I <= "11";
    
    WAIT FOR 100NS;
    EN <= '1'; I <= "01";
    
    WAIT FOR 100NS;
    I <= "10";
    
    WAIT FOR 100NS;
    I <= "11";
    WAIT;
END PROCESS;
end Behavioral;
