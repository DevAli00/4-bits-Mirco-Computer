library ieee;
use ieee.std_logic_1164.all;

entity tb_controller is
end tb_controller;

architecture system of tb_controller is

component controller 
port (
CLK_i, RESETn_i, STEP_i : in std_logic;
INST_i : in std_logic_vector(7 downto 0);
CODEOP_o : out std_logic_vector(2 downto 0);
REG_ID_o : out std_logic_vector(1 downto 0);
BANK_WE_o, SEL_MUX0_o, CE_AB_o, CE_INST_o : out std_logic;
SEL_MUX1_o : out std_logic_vector(1 downto 0));
end component;

signal CLK_i_s, RESETn_i_s, STEP_i_s : std_logic;
signal INST_i_s : std_logic_vector(7 downto 0);
signal CODEOP_o_s : std_logic_vector(2 downto 0);
signal REG_ID_o_s : std_logic_vector(1 downto 0);
signal BANK_WE_o_s, SEL_MUX0_o_s, CE_AB_o_s, CE_INST_o_s : std_logic;
signal SEL_MUX1_o_s : std_logic_vector(1 downto 0);

constant CLK_PERIOD : time := 10 ns; -- Adjust the clock period as needed

begin 

--Design Under Test
DUT : controller 
port map(
CLK_i => CLK_i_s,
RESETn_i => RESETn_i_s,
STEP_i => STEP_i_s,
INST_i => INST_i_s,
CODEOP_o => CODEOP_o_s,
REG_ID_o => REG_ID_o_s,
BANK_WE_o => BANK_WE_o_s,
SEL_MUX0_o => SEL_MUX0_o_s,
CE_AB_o => CE_AB_o_s,
CE_INST_o => CE_INST_o_s,
SEL_MUX1_o => SEL_MUX1_o_s);





  -- Clock generation process
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
   
      RESETn_i_s <= '1'; 
      wait for 10 ns;
    
    -- Test scenario 0
    INST_i_s <= "01011111"; 
    STEP_i_s <= '0';
    wait for 10 ns;

    -- Test scenario 1
    STEP_i_s <= '1';
    INST_i_s <= "01011111";
    wait for 10 ns;
    
    -- Test scenario 2
    STEP_i_s <= '0';
    INST_i_s <= "01011111";
    wait for 10 ns;
   
    -- Test scenario 3
    STEP_i_s <= '0';
    INST_i_s <= "01011111";
    wait for 10 ns;

    -- Test scenario 4
    STEP_i_s <= '1';
    INST_i_s <= "01011111";
    wait for 10 ns;

    -- Test scenario 5
    STEP_i_s <= '0';
    INST_i_s <= "01011111";
    wait for 10 ns;
    
    -- Test scenario 6
    STEP_i_s <= '0';
    INST_i_s <= "01011111";
    wait for 10 ns;
   
    -- Test scenario 7
    STEP_i_s <= '0';
    INST_i_s <= "01011111";
    wait for 10 ns;


  end process;

end system;
