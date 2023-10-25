library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ual is port(
  a, b : in std_logic_vector(3 downto 0);
  code_op : in std_logic_vector(2 downto 0);
  res : out std_logic_vector(3 downto 0);
  cout, A_MT_B, A_LT_B, A_EQ_B, zero : out std_logic);
end entity;

architecture one of ual is
  signal resPlus, aP, bP : std_logic_vector(4 downto 0);
begin
  aP <= '0'&a;
  bP <= '0'&b;
  
  resPlus <=  aP and bP when code_op = "000" else
          aP nand bP when code_op = "001" else
          aP or bP when code_op = "010" else
          aP nor bP when code_op = "011" else
          aP xor bP when code_op = "100" else
          not aP when code_op = "101" else
          aP + bP when code_op = "110" else
          aP - bP;
  cout <= resPlus(4);
  res <= resPlus(3 downto 0);
  
  process(a, b, code_op)
    begin
      if a > b then
        A_MT_B <= '1';
      else
        A_MT_B <= '0';
    end if;
  end process;
  
  process(a, b, code_op)
    begin
      if a < b then
        A_LT_B <= '1';
      else
        A_LT_B <= '0';
    end if;
  end process;
  
  process(a, b, code_op)
    begin
      if a = b then
        A_EQ_B <= '1';
      else
        A_EQ_B <= '0';
    end if;
  end process;
  
  zero <= not  (resPlus(0) or resPlus(1) or resPlus(2) or resPlus(3));
  
end architecture;