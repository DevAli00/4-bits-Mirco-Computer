library ieee;
use ieee.std_logic_1164.all;

entity core is
port(
CLK_i, RESETn_i, STEP_i : in std_logic;
A_i,B_i : in std_logic_vector(3 downto 0);
INST_i : in std_logic_vector(7 downto 0);
R0_o, R1_o, R2_o, R3_o, A_o, B_o : out std_logic_vector(3 downto 0);
COUT_o, A_MT_B_o, A_LT_B_o, A_EQ_B_o, ZERO_o : out std_logic);
end core;

architecture system of core is 

component UAL
port(
a_i, b_i : in std_logic_vector(3 downto 0);
CODEOP_i : in std_logic_vector(2 downto 0);
RES_o : out std_logic_vector(3 downto 0);
COUT_o, A_MT_B_o, A_LT_B_o, A_EQ_B_o, ZERO_o: out std_logic);
end component;

component REGN
generic(N: integer := 4 );
port( 
CLK_i, RESETn_i, CE_i :  in std_logic;
DIN_i : in std_logic_vector(N-1 downto 0);
DOUT_o : out std_logic_vector(N-1 downto 0));
end component;

component REG_BANK
port (
CLK_i, RESETn_i, BANK_WE_i : in std_logic;
REG_ID_i : in std_logic_vector(1 downto 0);
DIN_i : in std_logic_vector(3 downto 0);
R0_out, R1_out, R2_out, R3_out : out std_logic_vector(3 downto 0));
end component;

component CONTROLLER
port(
CLK_i, RESETn_i, STEP_i : in std_logic;
INST_i : in std_logic_vector(7 downto 0);
CODEOP_o : out std_logic_vector(2 downto 0);
REG_ID_o : out std_logic_vector(1 downto 0);
BANK_WE_o, SEL_MUX0_o, CE_AB_o, CE_INST_o : out std_logic;
SEL_MUX1_o : out std_logic_vector(1 downto 0));
end component;

component MUX0
port(
A_i, R_i : in std_logic_vector(3 downto 0);
SEL_MUX0_i : in std_logic;
A_o : out std_logic_vector(3 downto 0));
end component;

component MUX1
port(
R0_i, R1_i, R2_i, R3_i : in std_logic_vector(3 downto 0);
SEL_MUX1_i : in std_logic_vector(1 downto 0);
R_o : out std_logic_vector(3 downto 0));
end component;

signal INST_s : std_logic_vector(7 downto 0);
signal CODEOP_s : std_logic_vector(2 downto 0);
signal REG_ID_s, SEL_MUX1_s : std_logic_vector(1 downto 0);
signal BANK_WE_s, SEL_MUX0_s, CE_AB_s , CE_INST_s : std_logic; 
signal A_s, B_s, R_s, A_F_s, RES_s : std_logic_vector(3 downto 0);
signal R0_s, R1_s, R2_s, R3_s :  std_logic_vector(3 downto 0);


begin

control : controller 
port map(
CLK_i => CLK_i, 
RESETn_i => RESETn_i, 
STEP_i => STEP_i,
INST_i => INST_s,
CODEOP_o => CODEOP_s,
REG_ID_o => REG_ID_s,
BANK_WE_o => BANK_WE_s,
SEL_MUX0_o => SEL_MUX0_s,
CE_AB_o => CE_AB_s,
CE_INST_o => CE_INST_s,
SEL_MUX1_o => SEL_MUX1_s);

RA : REGN
port map(
CLK_i => CLK_i,
RESETn_i =>RESETn_i,
CE_i => CE_AB_s,
DIN_i => A_i,
DOUT_o => A_s);

RB : REGN
port map(
CLK_i => CLK_i,
RESETn_i =>RESETn_i,
CE_i => CE_AB_s,
DIN_i => B_i,
DOUT_o => B_s);

RINST :REGN
port map(
CLK_i => CLK_i,
RESETn_i => RESETn_i,
CE_i => CE_INST_s,
DIN_i => INST_i,
DOUT_o => INST_s);

MUX_1 : MUX1
port map(
R0_i => R0_s, 
R1_i => R1_s, 
R2_i => R2_s, 
R3_i => R3_s, 
SEL_MUX1_i => SEL_MUX1_s,
R_o => R_s);

MUX_0 : MUX0
port map(
A_i => A_s,
R_i => R_s,
SEL_MUX0_i => SEL_MUX0_s,
A_o => A_F_s);

UAL_1 : UAL
port map(
a_i => A_F_s,
b_i => B_s,
CODEOP_i => CODEOP_s,
RES_o => RES_s,
COUT_o => COUT_o, 
A_MT_B_o => A_MT_B_o,
A_LT_B_o => A_LT_B_o,
A_EQ_B_o => A_EQ_B_o,
ZERO_o => ZERO_o);

BANK : REG_BANK
port map (
CLK_i => CLK_i, 
RESETn_i => RESETn_i, 
BANK_WE_i => BANK_WE_s, 
REG_ID_i => REG_ID_s, 
DIN_i => RES_s,
R0_out => R0_s,
R1_out => R1_s,
R2_out => R2_s,
R3_out => R3_s);


R0_o <= R0_s;
R1_o <= R1_s;
R2_o <= R2_s;
R3_o <= R3_s;
A_o  <= A_s;
B_o  <= B_s;




end system;




