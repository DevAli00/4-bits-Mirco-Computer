library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is 
port(
a_i, b_i : in std_logic_vector(3 downto 0);
CODEOP_i : in std_logic_vector(2 downto 0);
RES_o : out std_logic_vector(3 downto 0);
COUT_o, A_MT_B_o, A_LT_B_o, A_EQ_B_o, ZERO_o: out std_logic);
end ALU;

architecture system of ALU is 

signal RES_o_s : std_logic_vector(4 downto 0);
begin 

  process(a_i,b_i,CODEOP_i)
  begin 

    case CODEOP_i is 

      when "000" =>
      RES_o_s <= ('0'&A_i) and ('0'&B_i);

      when "001" =>
      RES_o_s <= ('0'&A_i) nand ('0'&B_i);

      when "010" =>
      RES_o_s <= ('0'&A_i) or ('0'&B_i);

      when "011" =>
      RES_o_s <= ('0'&A_i) nor ('0'&B_i);

      when "100" =>
      RES_o_s <= ('0'&A_i) xor ('0'&B_i);

      when "101" =>
      RES_o_s <= not ('0'&A_i) ;

      when "110" =>
      RES_o_s <= ('0'&A_i) + ('0'&B_i);

      when others =>
      RES_o_s <= ('0'&A_i) - ('0'&B_i);

   end case;
 end process;

 COUT_o <= Res_o_s(4); 
 RES_o <= Res_o_s(3 downto 0);

 process(A_i, B_i)
 begin

   if A_i>B_i then A_MT_B_o <= '1';
   else  A_MT_B_o <= '0';
   
   end if;
 end process;

 
 process(A_i, B_i)
 begin
     
   if A_i<B_i then A_LT_B_o <= '1';
   else A_LT_B_o <= '0';
   
   end if;
 end process;

 process(A_i, B_i)
 begin

   if A_i = B_i then A_EQ_B_o <= '1';
   else A_EQ_B_o <= '0'; 

   end if;
 end process;

 process(RES_o_s)
 begin 

   if Res_o_s(3 downto 0) = "0000" then ZERO_o <= '1';
   else ZERO_o <= '0';

   end if;
 end process;


end system;









