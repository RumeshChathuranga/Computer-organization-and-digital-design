library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Counter is
    Port ( Clk : in STD_LOGIC;
           Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Counter;

architecture Behavioral of Counter is

component D_FF
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
           
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

Signal D0, D1, D2 : std_logic;
Signal Q0, Q1, Q2 : std_logic;
Signal Clk_slow : std_logic;
      
begin
Slow_Clk_0 : Slow_Clk
    Port map (
        Clk_in => Clk,
        Clk_out => Clk_slow);

D_FF_0: D_FF
    Port map(
        D => D0,
        Res => Res,
        Clk => Clk_slow,
        Q => Q0);

D_FF_1: D_FF
    Port map(
        D => D1,
        Res => Res,
        Clk => Clk_slow,
        Q => Q1);

D_FF_2: D_FF
    Port map (
        D => D2,
        Res => Res,
        Clk => Clk_slow,
        Q => Q2);
 
D0 <= ((not Q2) and (not Dir)) or (Q1 and Dir);
D1 <= (Q2 and Dir) or (Q0 and (not Dir)) or (Q2 and Q0);
D2 <= (Q1 and (not Dir)) or ((not Q0) and Dir) or (Q1 and not(Q0));  

Q(0) <= Q0;    
Q(1) <= Q1;    
Q(2) <= Q2;    
        
end Behavioral;
