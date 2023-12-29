library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_UAL is 
end tb_UAL;

architecture system of tb_UAL is 

component UAL 
port(
a_i, b_i : in std_logic_vector(3 downto 0);
CODEOP_i : in std_logic_vector(2 downto 0);
RES_o : out std_logic_vector(3 downto 0);
COUT_o, A_MT_B_o, A_LT_B_o, A_EQ_B_o, ZERO_o: out std_logic);
end component;

signal a_i_s,b_i_s,RES_o_s : std_logic_vector(3 downto 0);
signal CODEOP_i_s :  std_logic_vector(2 downto 0);
signal COUT_o_s, A_MT_B_o_s, A_LT_B_o_s, A_EQ_B_o_s, ZERO_o_s: std_logic;

begin
 
--Design Under Test
DUT :UAL 
port map(
a_i => a_i_s,
b_i => b_i_s,
CODEOP_i => CODEOP_i_s,
RES_o => RES_o_s,
COUT_o => COUT_o_s,
A_MT_B_o => A_MT_B_o_s,
A_LT_B_o => A_LT_B_o_s,
A_EQ_B_o => A_EQ_B_o_s,
ZERO_o => ZERO_o_s);

process
begin 
a_i_s <= "1010";
b_i_s <= "1000";
CODEOP_i_s <= "110";
wait for 20 ns;
a_i_s <= "1010";
b_i_s <= "0100";
CODEOP_i_s <= "111";
wait for 20 ns;
end process;
end system;







