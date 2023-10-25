library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_register4 is
end tb_register4;

architecture one of tb_register4 is
  component register4
    port(
     d : in std_logic_vector(3 downto 0);
  clk : in std_logic := '0';
  clr,ce : in std_logic;
  q : out std_logic_vector(3 downto 0));
  
end component;

 signal d :  std_logic_vector(3 downto 0);
  signal clk : std_logic := '0';
  signal clr,ce : std_logic;
 signal q : std_logic_vector(3 downto 0);
 
 begin
   dut: register4
   port map(d,clk,clr,ce,q);
     
  
    clk<= not clk after (10 ns) ;
     testing:process
     begin
       d<="0101";
       ce<='1';
       clr<='0';
       
       wait for 40 ns;
       
       d<="0101";
    
       ce<='1';
       clr<='1';
       
       wait for 40 ns;
       
       d<="0101";
       
       ce<='0';
       clr<='0';
       
       wait for 40 ns;
     end process;
end architecture;
  