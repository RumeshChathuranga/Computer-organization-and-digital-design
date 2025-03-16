library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2;

architecture Behavioral of Multiplier_2 is

component FA is 
    port(
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic
    );
end component;

--intermiate signals
signal b0a0, b0a1, b1a0, b1a1 : std_logic;
signal c1, s1, c2, s2: std_logic;

begin
    --Calculate Partial Products
    b0a0 <= A(0) and B(0);
    b0a1 <= A(1) and B(0);
    b1a0 <= A(0) and B(1);
    b1a1 <= A(1) and B(1);
    
    
    --1st Full Adder
    FA1 : FA port map(
        A =>b1a0,
        B => b0a1,
        C_in => '0',
        S => s1,
        C_out => c1
    );
    --2nd Full Adder
    FA2 : FA port map(
        A => c1,
        B => b1a1,
        C_in => '0',
        S => s2,
        C_out => c2
        );
--Output Assignment
    Y(0) <= b0a0;
    Y(1) <= s1;
    Y(2) <= s2;
    Y(3) <= c2;

end Behavioral;
