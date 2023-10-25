library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity micro_calculator is port(
  CLK,RESET,VALID_A,VALID_B,VALID_instruction,VALID_CALC : in std_logic;
  A, B : in std_logic_vector(3 downto 0);
  instruction : in std_logic_vector(7 downto 0);
  R0_out, R1_out, R2_out, R3_out, A_out, B_out, Res_out : out std_logic_vector(3 downto 0);
  A_MT_B, A_LT_B, A_EQ_B, ZERO, COUT : out std_logic
);
end entity;

architecture one of micro_calculator is
  
  component register4 is port(
      d : in std_logic_vector(3 downto 0);
      clk : in std_logic := '0';
      clr,ce : in std_logic;
      q : out std_logic_vector(3 downto 0));
  end component;
  
  component register8 is port(
      d : in std_logic_vector(7 downto 0);
      clk : in std_logic := '0';
      clr,ce : in std_logic;
      q : out std_logic_vector(7 downto 0));
  end component;
  
  component multiplexer24 is port(
    A, Res : in std_logic_vector(3 downto 0);
    sel : in std_logic;
    A2 : out std_logic_vector(3 downto 0));
  end component;
  
  component multiplexer44 is port(
    R0, R1, R2, R3 : in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(1 downto 0);
    Res : out std_logic_vector(3 downto 0));
  end component;
  
  component controller is port(
    inst : in std_logic_vector(7 downto 0);
    VALID_CALC : in std_logic;
    code_op : out std_logic_vector(2 downto 0);
    CE : out std_logic_vector(3 downto 0);
    sel24 : out std_logic;
    sel44 : out std_logic_vector(1 downto 0));
  end component;
  
  component ual is port(
    a, b : in std_logic_vector(3 downto 0);
    code_op : in std_logic_vector(2 downto 0);
    res : out std_logic_vector(3 downto 0);
    cout, A_MT_B, A_LT_B, A_EQ_B, zero : out std_logic);
  end component;
  
  signal sel24 : std_logic;
  signal sel44 : std_logic_vector(1 downto 0);
  signal code_op : std_logic_vector(2 downto 0);
  signal a1_out, b1_out, a2_out, ual_out, r0, r1, r2, r3, Res, CE : std_logic_vector(3 downto 0);
  signal instruction_out : std_logic_vector(7 downto 0);

begin
  entree1:register4
  port map (A, CLK, RESET, VALID_A, a1_out);
  entree2:register4
  port map (B, CLK, RESET, VALID_B, b1_out);
    
  registre0:register4
  port map (ual_out, CLK, RESET, CE(3), r0);
  registre1:register4
  port map (ual_out, CLK, RESET, CE(2), r1);
  registre2:register4
  port map (ual_out, CLK, RESET, CE(1), r2);
  registre3:register4
  port map (ual_out, CLK, RESET, CE(0), r3);
    
  inst:register8
  port map (instruction, CLK, RESET, VALID_instruction, instruction_out);
    
  mux1:multiplexer24
  port map (a1_out, Res, sel24, a2_out);
  mux2:multiplexer44
  port map (r0, r1, r2, r3, sel44, Res);
    
  control:controller
  port map (instruction_out, VALID_CALC, code_op, CE, sel24, sel44);
  
  lua:ual
  port map (a2_out, b1_out, code_op, ual_out, COUT, A_MT_B, A_LT_B, A_EQ_B, ZERO);
    
  A_out <= a1_out;
  B_out <= b1_out;
  R0_out <= r0;
  R1_out <= r1;
  R2_out <= r2;
  R3_out <= r3;
  Res_out <= Res;
end architecture;