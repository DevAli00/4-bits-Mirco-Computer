library ieee;
use ieee.std_logic_1164.all;

entity reg_bank is 
  port (
    CLK_i, RESETn_i, BANK_WE_i : in std_logic;
    REG_ID_i : in std_logic_vector(1 downto 0);
    DIN_i : in std_logic_vector(3 downto 0);
    R0_out, R1_out, R2_out, R3_out : out std_logic_vector(3 downto 0)
  );
end reg_bank;

architecture system of reg_bank is 

  component REGN
    generic (N:integer:=4); 
    port (
      CLK_i, RESETn_i, CE_i :  in std_logic;
      DIN_i : in std_logic_vector(N-1 downto 0);
      DOUT_o : out std_logic_vector(N-1 downto 0)
    );
  end component;

  signal  R0_out_s, R1_out_s, R2_out_s, R3_out_s : std_logic_vector(3 downto 0);

begin 

  R0 : REGN 
    port map (
      CLK_i => CLK_i,
      RESETn_i => RESETn_i,
      CE_i => BANK_WE_i,
      DIN_i => DIN_i,
      DOUT_o => R0_out
    );

  R1 : REGN 
    port map (
      CLK_i => CLK_i,
      RESETn_i => RESETn_i,
      CE_i => BANK_WE_i,
      DIN_i => DIN_i,
      DOUT_o => R1_out
    );

  R2 : REGN 
    port map (
      CLK_i => CLK_i,
      RESETn_i => RESETn_i,
      CE_i => BANK_WE_i,
      DIN_i => DIN_i,
      DOUT_o => R2_out
    );

  R3 : REGN 
    port map (
      CLK_i => CLK_i,
      RESETn_i => RESETn_i,
      CE_i => BANK_WE_i,
      DIN_i => DIN_i,
      DOUT_o => R3_out
    );

  
  process(CLK_i, RESETn_i)
  begin 
   if (RESETn_i = '0') then
	R0_out_s <= "UUUU";
 	R1_out_s <= "UUUU";
 	R2_out_s <= "UUUU";
 	R3_out_s <= "UUUU";
	
   
    elsif (BANK_WE_i = '1') then
      case REG_ID_i is
        when "00" =>
          R0_out_s <= DIN_i;
        when "01" =>
          R1_out_s <= DIN_i;
        when "10" =>
          R2_out_s <= DIN_i;
        when "11" =>
          R3_out_s <= DIN_i;
	when others =>
	  null;
      end case;
    
   end if;
  end process;

 R0_out <= R0_out_s;
 R1_out <= R1_out_s;
 R2_out <= R2_out_s;
 R3_out <= R3_out_s;


end system;








