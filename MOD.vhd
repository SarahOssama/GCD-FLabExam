LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;
ENTITY my_MOD IS
    PORT (
        A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        ModResult : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END my_MOD;

ARCHITECTURE a_MOD OF my_MOD IS
    -- SIGNAL MODR : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

    ModResult <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(A)) MOD to_integer(unsigned(B)), 32)) WHEN to_integer(unsigned(B)) > 0
        ELSE
        (OTHERS => '0');

END ARCHITECTURE;