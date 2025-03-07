
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

    --declaring variables for not signals
    signal NOT_S0, NOT_S1, NOT_S2 : std_logic;
    
begin
    --asign the not values for variables
    NOT_S0 <= not S(0);
    NOT_S1 <= not S(1);
    NOT_S2 <= not S(2);
    
    --implement the logic
    Y <= EN and ((NOT_S0 AND NOT_S1 AND NOT_S2 AND D(0))
             OR (NOT_S0 AND NOT_S1 AND S(2) AND D(1))
             OR (NOT_S0 AND S(1) AND NOT_S2 AND D(2))
             OR (NOT_S0 AND S(1) AND S(2) AND D(3))
             OR (S(0) AND NOT_S1 AND NOT_S2 AND D(4))
             OR (S(0) AND NOT_S1 AND S(2) AND D(5))
             OR (S(0) AND S(1) AND NOT_S2 AND D(6))
             OR (S(0) AND S(1) AND S(2) AND D(7)));


end Behavioral;
