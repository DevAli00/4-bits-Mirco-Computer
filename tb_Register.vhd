library ieee;
use ieee.std_logic_1164.all;

entity tb_register is
generic(M : integer := 4);
end tb_register;

architecture system of tb_register is 


component REGN 
generic(N: integer := 4 );
port( 
CLK_i, RESETn_i, CE_i :  in std_logic;
DIN_i : in std_logic_vector(N-1 downto 0);
DOUT_o : out std_logic_vector(N-1 downto 0));
end component;

constant CLK_PERIOD : time := 10 ns; -- Adjust the clock period as needed
signal  CLK_i_s, RESETn_i_s, CE_i_s : std_logic;
signal DIN_i_s, DOUT_o_s : std_logic_vector(M-1 downto 0);

begin

-- Design Under Test
DUT : REGN
port map(
CLK_i => CLK_i_s, 
RESETn_i => RESETn_i_s,
CE_i => CE_i_s,
DIN_i => DIN_i_s,
DOUT_o => DOUT_o_s);

 process
  begin
    while now < 1000 ns loop
      CLK_i_s <= '0';
      wait for CLK_PERIOD / 2;
      CLK_i_s <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

process
begin 

RESETn_i_s <= '0';
CE_i_s <= '1';
DIN_i_s <= "1000";
wait for 10 ns;

RESETn_i_s <= '0';
CE_i_s <= '0';
DIN_i_s <= "0010";
wait for 10 ns;

RESETn_i_s <= '1';
CE_i_s <= '1';
DIN_i_s <= "1000";
wait for 10 ns;

end process;
end system;





