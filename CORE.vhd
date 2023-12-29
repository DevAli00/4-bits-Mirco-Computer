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

component Registre
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

begin
end system;




