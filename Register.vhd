library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity REGN is
generic(N: integer := 4 );
port( 
CLK_i, RESETn_i, CE_i :  in std_logic;
DIN_i : in std_logic_vector(N-1 downto 0);
DOUT_o : out std_logic_vector(N-1 downto 0));
end REGN;

architecture system of REGN is 
begin 

process(CLK_i,RESETn_i,CE_i)
begin 
if (CE_i = '1') then
	if (RESETn_i = '0') then
	DOUT_o <= (OTHERS => '0'); --DOUT_o is an array so we use other to change every part of it to 0
	elsif (CLK_i'event and CLK_i = '1') then
	DOUT_o <= DIN_i;
	end if;
end if;
end process;

end system;



