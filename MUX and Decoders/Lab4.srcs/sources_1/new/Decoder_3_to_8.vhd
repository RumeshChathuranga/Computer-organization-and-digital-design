library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
    COMPONENT Decoder_2_to_4
    port(
        I: IN STD_LOGIC_VECTOR;
        EN: IN STD_LOGIC;
        Y: OUT STD_LOGIC_VECTOR );
    END COMPONENT;
    SIGNAL I0,I1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Y0,Y1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL EN0, EN1, I2 : STD_LOGIC;

begin
    Decoder_2_to_4_0: Decoder_2_to_4
    PORT MAP(
        I => I0,
        EN => EN0,
        Y => Y0);
    
    Decoder_2_to_4_1 : Decoder_2_to_4
    PORT MAP(
        I => I1,
        EN => EN1,
        Y => Y1 );
        
    EN0 <= NOT(I(2)) AND EN; -- working first decoder when I2 = 0 and global enable on
    EN1 <= I(2) AND EN;
    I0 <= I(1 DOWNTO 0);
    I1 <= I(1 DOWNTO 0);
    I2 <= I(2);
    Y(3 DOWNTO 0) <= Y0;
    Y(7 DOWNTO 4) <= Y1;
    
end Behavioral;
