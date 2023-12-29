library ieee;
use ieee.std_logic_1164.all;

entity controller is 
port(
CLK_i, RESETn_i, STEP_i : in std_logic;
INST_i : in std_logic_vector(7 downto 0);
CODEOP_o : out std_logic_vector(2 downto 0);
REG_ID_o : out std_logic_vector(1 downto 0);
BANK_WE_o, SEL_MUX0_o, CE_AB_o, CE_INST_o : out std_logic;
SEL_MUX1_o : out std_logic_vector(1 downto 0));
end controller;


architecture system of controller is

--signal REG_ID_o_s : std_logic_vector(1 downto 0);
--signal SEL_MUX1_o_s : std_logic_vector(1 downto 0);
--signal SEL_MUX0_o_s : std_logic;
--signal CODEOP_o_s : std_logic_vector(2 downto 0);

-- Moore Machine states creation
type TypeState is (S0,S1,S2,S3,S4,S5,S6);
signal present_state, next_state : TypeState;

begin 

--state register
process(CLK_i)
begin 

if(RESETn_i = '0') then
present_state <= S0;
elsif (CLK_i'event and CLK_i='1') then
present_state <= next_state;
end if;

end process;

-- next state calculation
process(present_state, STEP_i)

begin 

next_state <= S0;
case present_state is

when S0 => 
if (STEP_i = '0') then next_state <= S1;
else next_state <= S0;
end if;
when S1 => 
if (STEP_i = '1') then next_state <= S2;
else next_state <= S1;
end if;
when S2 =>
next_state <= S3;
when S3 => 
if (STEP_i = '0') then next_state <= S4;
else next_state <= S3;
end if;
when S4 => 
if (STEP_i = '1') then next_state <= S5;
else next_state <= S4;
end if;
when S5 =>
next_state <= S6;
when S6 =>
next_state <= S0;
when others =>
end case;
end process;

-- final values

process(present_state)
begin
case present_state is

when S0 =>
BANK_WE_o <= '0';
CE_AB_o <= '0';
CE_INST_o <= '0';

when S1 =>
BANK_WE_o <= '0';
CE_AB_o <= '0';
CE_INST_o <= '0';

when S2 =>
BANK_WE_o <= '0';
CE_AB_o <= '1';
CE_INST_o <= '0';

when S3 =>
BANK_WE_o <= '0';
CE_AB_o <= '0';
CE_INST_o <= '0';

when S4 =>
BANK_WE_o <= '0';
CE_AB_o <= '0';
CE_INST_o <= '0';

when S5 =>
BANK_WE_o <= '0';
CE_AB_o <= '0';
CE_INST_o <= '1';

when S6 =>
BANK_WE_o <= '1';
CE_AB_o <= '0';
CE_INST_o <= '0';

end case;
end process; 

REG_ID_o<= INST_i(7 downto 6);
SEL_MUX1_o <= INST_i(5 downto 4);
SEL_MUX0_o <= INST_i(3);
CODEOP_o <= INST_i(2 downto 0);

-- Question : When declare signals and when not ?

--REG_ID_o <= REG_ID_o_s;
--SEL_MUX1_o <= SEL_MUX1_o_s;
--SEL_MUX0_o <= SEL_MUX0_o_s;
--CODEOP_o <= CODEOP_o_s;


end system;












