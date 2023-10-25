library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_ual is
end tb_ual;

architecture one of tb_ual is
  component ual
    port(
      
  a, b : in std_logic_vector(3 downto 0);
  code_op : in std_logic_vector(2 downto 0);
  res : out std_logic_vector(3 downto 0);
  cout, A_MT_B, A_LT_B, A_EQ_B, zero : out std_logic);
  
end component;

signal a, b : std_logic_vector(3 downto 0);
signal code_op : std_logic_vector(2 downto 0);
signal  res : std_logic_vector(3 downto 0);
signal  cout, A_MT_B, A_LT_B, A_EQ_B, zero :  std_logic ;

begin
  dut:ual
  port map(a, b, code_op, res, cout, A_MT_B, A_LT_B, A_EQ_B, zero);
    
    testing: process
    begin
      a<="0001";
      b<="1110";
      code_op<="000";
      for i in 1 to 7 loop
        wait for 10ns;
        code_op <= code_op + 1;
      end loop;
      wait for 20ns;
      a<="1110";
      b<="0011";
      code_op<="000";
      for i in 1 to 7 loop
        wait for 10ns;
        code_op <= code_op + 1;
      end loop;
      wait for 20ns;
      a<="0110";
      b<="0110";
      code_op<="000";
      for i in 1 to 7 loop
        wait for 10ns;
        code_op <= code_op + 1;
      end loop;
end process;
end architecture;