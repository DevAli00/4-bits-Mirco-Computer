library ieee;
use ieee.std_logic_1164.all;

entity MUX0 is 
port(
A_i, R_i : in std_logic_vector(3 downto 0);
SEL_MUX0_i : in std_logic;
A_o : out std_logic_vector(3 downto 0));
end MUX0;

architecture system of MUX0 is 

signal A_o_s : std_logic_vector(3 downto 0);

begin 

process(A_i, R_i, SEL_MUX0_i)
begin 

case SEL_MUX0_i is
when '0' => 
A_o_s <= R_i;
when '1' =>
A_o_s <= A_i;
when others =>
null;
end case;
end process;

A_o <= A_o_s;

end system;
