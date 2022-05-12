LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
ENTITY my_temp IS
    PORT (
        clk, rst : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        G : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        A_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        B_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        V : OUT STD_LOGIC);
END my_temp;

ARCHITECTURE a_my_temp OF my_temp IS
    COMPONENT my_MOD IS
        PORT (
            A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            ModResult : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));

    END COMPONENT;
    SIGNAL mresult : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
    -- Initialize

    s0 : my_MOD PORT MAP(A, B, mresult);

END ARCHITECTURE;