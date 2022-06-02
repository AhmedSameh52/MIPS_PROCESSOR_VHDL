library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Adder_32_BIT is
    port(
        X, Y : in std_logic_vector(31 downto 0);
        SUM : out std_logic_vector(31 downto 0)
      );
end entity Adder_32_BIT;


architecture behavior of Adder_32_BIT is
    begin
        SUM <= std_logic_vector(signed(X) + signed(Y));
end architecture behavior;