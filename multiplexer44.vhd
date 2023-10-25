library ieee;
use ieee.std_logic_1164.all;

entity multiplexer44 is port(
R0, R1, R2, R3 : in std_logic_vector(3 downto 0);
sel : in std_logic_vector(1 downto 0);
Res : out std_logic_vector(3 downto 0));
end entity;

architecture one of multiplexer44 is
  begin
    with sel select
    Res <=  R0 when "00",
            R1 when "01",
            R2 when "10",
            R3 when others;
end architecture;
