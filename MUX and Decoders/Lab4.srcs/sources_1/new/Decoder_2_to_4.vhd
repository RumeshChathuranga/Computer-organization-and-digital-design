
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is

    --declaring variables for not signals
    signal NOT_I0, NOT_I1 : std_logic;

begin
    --asign the not values for variables
    NOT_I0 <= not I(0);
    NOT_I1 <= not I(1);
    
    --implement the logic
    Y(0) <= EN and (NOT_I0 and NOT_I1);
    Y(1) <= EN AND (NOT_I0 AND I(1));
    Y(2) <= EN AND (I(0) AND NOT_I1);
    Y(3) <= EN AND (I(0) AND I(1));
      
         

end Behavioral;
