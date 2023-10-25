library ieee;
use ieee.std_logic_1164.all;

entity multiplexer24 is port(
A, Res : in std_logic_vector(3 downto 0);
sel : in std_logic;
A2 : out std_logic_vector(3 downto 0));
end entity;

architecture one of multiplexer24 is
  begin
    A2 <= A when sel = '0' else
          Res;
end architecture;
