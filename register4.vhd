library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity register4 is port(
  d : in std_logic_vector(3 downto 0);
  clk : in std_logic := '0';
  clr,ce : in std_logic;
  q : out std_logic_vector(3 downto 0));
end entity;

architecture one of register4 is
begin

  process(clk,clr)
    begin
	if clr = '1' then
        q <= "0000";
    elsif clk'event and clk='1' then
		if ce='1' then
		q <= d;
		end if;
    end if;
  end process;
  
 
end architecture;