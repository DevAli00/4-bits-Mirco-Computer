library ieee;
use ieee.std_logic_1164.all;

entity tb_reg_bank is 
end tb_reg_bank;

architecture system of tb_reg_bank is

component reg_bank
 port (
    CLK_i, RESETn_i, BANK_WE_i : in std_logic;
    REG_ID_i : in std_logic_vector(1 downto 0);
    DIN_i : in std_logic_vector(3 downto 0);
    R0_out, R1_out, R2_out, R3_out : out std_logic_vector(3 downto 0)
  );
end component; 

signal CLK_i_s, RESETn_i_s, BANK_WE_i_s : std_logic;
signal REG_ID_i_s : std_logic_vector(1 downto 0);
signal DIN_i_s, R0_out_s, R1_out_s, R2_out_s, R3_out_s : std_logic_vector(3 downto 0);


begin 

--Design Under Test
DUT : reg_bank
port map(
    CLK_i => CLK_i_s,
    RESETn_i => RESETn_i_s, 
    BANK_WE_i => BANK_WE_i_s,
    REG_ID_i => REG_ID_i_s, 
    DIN_i => DIN_i_s,
    R0_out => R0_out_s,
    R1_out => R1_out_s,
    R2_out => R2_out_s,
    R3_out => R3_out_s
 );


process
begin
CLK_i_s <= '1';
RESETn_i_s <= '0'; 
BANK_WE_i_s <= '1';
REG_ID_i_s <= "10"; 
DIN_i_s <= "1000";
wait for 20 ns;

CLK_i_s <= '1';
RESETn_i_s <= '1'; 
BANK_WE_i_s <= '1';
REG_ID_i_s <= "01"; 
DIN_i_s <= "1010";
wait for 20 ns;

CLK_i_s <= '1';
RESETn_i_s <= '0'; 
BANK_WE_i_s <= '1';
REG_ID_i_s <= "11"; 
DIN_i_s <= "1001";
wait for 20 ns;
end process;
end system;







