LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
ENTITY my_GCD IS
    PORT (
        clk, rst : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        G : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        A_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        B_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        V : OUT STD_LOGIC);
END my_GCD;

ARCHITECTURE a_GCD OF my_GCD IS
    COMPONENT my_MOD IS
        PORT (
            A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            ModResult : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));

    END COMPONENT;

    SIGNAL mresult : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL X, Y, R : STD_LOGIC_VECTOR(31 DOWNTO 0);

    SIGNAL a0 : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL init : INTEGER := - 1;

BEGIN
    -- Initialize
    A_out <= A;
    B_out <= B;

    -- Calc MOd
    s0 : my_MOD PORT MAP(X(31 DOWNTO 0), Y(31 DOWNTO 0), mresult(31 DOWNTO 0));

    PROCESS (clk, rst)
    BEGIN
        IF rst = '1'THEN
            G <= (OTHERS => '0');
            X <= (OTHERS => '0');
            Y <= (OTHERS => '0');
            init <= - 1;
            -- A_out <= (OTHERS => '0');
            -- B_out <= (OTHERS => '0');
        ELSE
            IF rising_edge(clk) THEN
                IF init =- 1 THEN
                    X <= A;
                    Y <= B;
                    init <= 0;
                ELSE
                    -- G <= mresult;
                    IF to_integer(unsigned(mresult)) > 0 THEN
                        R <= mresult;
                        X <= Y;
                        Y <= mresult;
                    ELSIF to_integer(unsigned(mresult)) <= 0 THEN
                        G <= Y;

                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    -- PROCESS (clk, rst)
    -- BEGIN

    --     IF rising_edge(clk) AND rst = '0'THEN
    --         a0 <= mresult;
    --     END IF;
    -- END PROCESS;
END ARCHITECTURE;