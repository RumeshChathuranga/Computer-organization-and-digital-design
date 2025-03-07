library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
    COMPONENT Decoder_3_to_8
        PORT( I : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
              EN : IN STD_LOGIC;
              Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
    
    SIGNAL I : STD_LOGIC_VECTOR( 2 DOWNTO 0);
    SIGNAL EN : STD_LOGIC;
    SIGNAL Y : STD_LOGIC_VECTOR( 7 DOWNTO 0);    

begin UUT: Decoder_3_to_8 PORT MAP(
    I => I,
    EN => EN,
    Y => Y );
    
PROCESS
BEGIN
    I <= "000"; EN <= '0';
    WAIT FOR 100NS;
    
    --Index 230104E -> 111 000 001 011 011 000    
    
    I <= "000"; EN <= '1'; -- 000
    WAIT FOR 100NS;
    
    I <= "011"; -- 011
    WAIT FOR 100NS; 

    I <= "001"; -- 001
    WAIT FOR 100NS; 
    
    I <= "111"; -- 111
    WAIT FOR 100NS; 
    WAIT;
END PROCESS;
         
end Behavioral;
