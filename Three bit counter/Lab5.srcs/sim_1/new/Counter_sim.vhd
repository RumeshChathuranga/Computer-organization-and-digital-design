library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Counter_sim is
--  Port ( );
end Counter_sim;

architecture Behavioral of Counter_sim is
component Counter
        Port ( Dir : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;
    
SIGNAL dir : std_logic := '0';
SIGNAL res : std_logic := '0';
SIGNAL clk : std_logic := '0';
SIGNAL q : std_logic_vector(2 downto 0);

begin
UUT : Counter PORT MAP(
        Dir => dir,
        Res => res,
        Clk => clk,
        Q => q
    );
    
    -- Clock process
    process begin
        clk <= not clk;
        wait for 2ns;  
    end process;
    
    process begin
            -- Initial reset
            res <= '1';
            wait for 50ns;
            res <= '0';
            
            -- Start with clockwise counting (Dir = 0)
            dir <= '0';
            wait for 400ns;  -- Let it count clockwise for a while
            
            -- Switch to counterclockwise (Dir = 1)
            dir <= '1';
            wait for 400ns;  -- Let it count counterclockwise
            
            -- Switch back to clockwise
            dir <= '0';
            wait;
        end process;
    

end Behavioral;
