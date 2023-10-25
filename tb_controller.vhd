library ieee;
use ieee.std_logic_1164.all;

entity tb_controller is
end tb_controller ;

architecture one of  tb_controller is
  component controller
    port(
  inst : in std_logic_vector(7 downto 0);
  VALID_CALC : in std_logic;
  code_op : out std_logic_vector(2 downto 0);
  CE : out std_logic_vector(3 downto 0);
  sel24 : out std_logic;
  sel44 : out std_logic_vector(1 downto 0)
  );
end component;

signal inst : std_logic_vector(7 downto 0);
 signal VALID_CALC :  std_logic;
  signal code_op :  std_logic_vector(2 downto 0);
  signal CE :  std_logic_vector(3 downto 0);
  signal sel24 :  std_logic;
  signal sel44 : std_logic_vector(1 downto 0);

begin
  dut: controller
  port map (inst,VALID_CALC,code_op,CE,sel24,sel44 );
    
    testing:process
    begin
      
      inst<="00011101";
      VALID_CALC<='1';
      
      wait for 20ns;
      
      inst<="01111001";
      VALID_CALC<='0';
      
      wait for 20ns;
      
      inst<="01111001";
      VALID_CALC<='1';
      
      wait for 20ns;
      
 end process;
end architecture;