library ieee;
use ieee.std_logic_1164.all;

entity MUX1 is 
port(
R0_i, R1_i, R2_i, R3_i : in std_logic_vector(3 downto 0);
SEL_MUX1_i : in std_logic_vector(1 downto 0);
R_o : out std_logic_vector(3 downto 0));
end MUX1;

architecture system of MUX1 is 

signal R_o_s : std_logic_vector(3 downto 0);

begin 

process(R0_i, R1_i, R2_i, R3_i, SEL_MUX1_i)
begin 

case SEL_MUX1_i is
when "00" => 
R_o_s <= R0_i;
when "01" => 
R_o_s <= R1_i;
when "10" => 
R_o_s <= R2_i;
when "11" => 
R_o_s <= R3_i;
when others =>
null;
end case;
end process;

R_o <= R_o_s;

end system;
