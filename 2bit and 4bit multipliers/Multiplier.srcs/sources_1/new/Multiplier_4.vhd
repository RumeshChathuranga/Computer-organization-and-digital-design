library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 4x4 Multiplier Entity
entity Multiplier_4 is
    Port (
        A : in  STD_LOGIC_VECTOR (3 downto 0);
        B : in  STD_LOGIC_VECTOR (3 downto 0);
        Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Multiplier_4;

architecture Behavioral of Multiplier_4 is
    -- Declare the FA component
    component FA is
        Port (
            A    : in  std_logic;
            B    : in  std_logic;
            C_in : in  std_logic;
            S    : out std_logic;
            C_out: out std_logic
        );
    end component;

    -- Internal signals for partial products
    signal b0a0, b0a1, b0a2, b0a3 : std_logic;
    signal b1a0, b1a1, b1a2, b1a3 : std_logic;
    signal b2a0, b2a1, b2a2, b2a3 : std_logic;
    signal b3a0, b3a1, b3a2, b3a3 : std_logic;

    -- Internal signals for adders
    signal s_0_0, s_0_1, s_0_2, s_0_3 : std_logic;
    signal c_0_0, c_0_1, c_0_2, c_0_3 : std_logic;
    signal s_1_0, s_1_1, s_1_2, s_1_3 : std_logic;
    signal c_1_0, c_1_1, c_1_2, c_1_3 : std_logic;
    signal s_2_0, s_2_1, s_2_2, s_2_3 : std_logic;
    signal c_2_0, c_2_1, c_2_2, c_2_3 : std_logic;

    -- Final product bits
    signal Y_temp : std_logic_vector(7 downto 0);

begin
    -- Generate partial products
    b0a0 <= B(0) AND A(0);
    b0a1 <= B(0) AND A(1);
    b0a2 <= B(0) AND A(2);
    b0a3 <= B(0) AND A(3);

    b1a0 <= B(1) AND A(0);
    b1a1 <= B(1) AND A(1);
    b1a2 <= B(1) AND A(2);
    b1a3 <= B(1) AND A(3);

    b2a0 <= B(2) AND A(0);
    b2a1 <= B(2) AND A(1);
    b2a2 <= B(2) AND A(2);
    b2a3 <= B(2) AND A(3);

    b3a0 <= B(3) AND A(0);
    b3a1 <= B(3) AND A(1);
    b3a2 <= B(3) AND A(2);
    b3a3 <= B(3) AND A(3);

    -- First row
    FA_0_0: FA port map (A => b0a1, B => b1a0, C_in => '0', S => s_0_0, C_out => c_0_0);
    FA_0_1: FA port map (A => b0a2, B => b1a1, C_in => c_0_0, S => s_0_1, C_out => c_0_1);
    FA_0_2: FA port map (A => b0a3, B => b1a2, C_in => c_0_1, S => s_0_2, C_out => c_0_2);
    FA_0_3: FA port map (A => '0', B => b1a3, C_in => c_0_2, S => s_0_3, C_out => c_0_3);

    -- Second row
    FA_1_0: FA port map (A => s_0_1, B => b2a0, C_in => '0', S => s_1_0, C_out => c_1_0);
    FA_1_1: FA port map (A => s_0_2, B => b2a1, C_in => c_1_0, S => s_1_1, C_out => c_1_1);
    FA_1_2: FA port map (A => s_0_3, B => b2a2, C_in => c_1_1, S => s_1_2, C_out => c_1_2);
    FA_1_3: FA port map (A => c_0_3, B => b2a3, C_in => c_1_2, S => s_1_3, C_out => c_1_3);

    -- Third row
    FA_2_0: FA port map (A => s_1_1, B => b3a0, C_in => '0', S => s_2_0, C_out => c_2_0);
    FA_2_1: FA port map (A => s_1_2, B => b3a1, C_in => c_2_0, S => s_2_1, C_out => c_2_1);
    FA_2_2: FA port map (A => s_1_3, B => b3a2, C_in => c_2_1, S => s_2_2, C_out => c_2_2);
    FA_2_3: FA port map (A => c_1_3, B => b3a3, C_in => c_2_2, S => s_2_3, C_out => c_2_3);

    -- Final product assignment
    Y_temp(0) <= b0a0;
    Y_temp(1) <= s_0_0;
    Y_temp(2) <= s_1_0;
    Y_temp(3) <= s_2_0;
    Y_temp(4) <= s_2_1;
    Y_temp(5) <= s_2_2;
    Y_temp(6) <= s_2_3;
    Y_temp(7) <= c_2_3;

    Y <= Y_temp;
end Behavioral;