library ieee;
use ieee.std_logic_1164.all;

entity controller is port(
  inst : in std_logic_vector(7 downto 0);
  VALID_CALC : in std_logic;
  code_op : out std_logic_vector(2 downto 0);
  CE : out std_logic_vector(3 downto 0);
  sel24 : out std_logic;
  sel44 : out std_logic_vector(1 downto 0)
  );
end entity;

architecture one of controller is
  signal CEinst : std_logic_vector(2 downto 0);
begin
  code_op <= inst(2) & inst(1) & inst(0) when VALID_CALC='1';
  sel24 <= inst(3) when VALID_CALC='1';
  sel44 <= inst(5) & inst(4) when VALID_CALC='1';
  CEinst <= inst(7) & inst(6) & VALID_CALC;
  with CEinst select
  CE <= "1000" when "001",
        "0100" when "011",
        "0010" when "101",
        "0001" when "111",
        "0000" when others;
end architecture;
  
