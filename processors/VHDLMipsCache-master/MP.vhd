----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Marcelo Linck
-- 
-- Create Date:    16:11:01 05/30/2011 
-- Design Name: 
-- Module Name:    MP - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_UNSIGNED.all;
use work.CachePackage.all;

entity MP is
      generic(  START_ADDRESS: reg32 := (others=>'0')  );
      port( ce_n, we_n, oe_n: in std_logic;    address: in reg32;   data: inout reg32);
end MP;

architecture MP of MP is 
   signal RAM : MP_mem;
   signal tmp_address: reg32;
   alias  low_address: reg16 is tmp_address(15 downto 0);    --  baixa para 16 bits devido ao CONV_INTEGER --
begin     

   tmp_address <= address - START_ADDRESS;   --  offset do endereamento  -- 
   
   -- writes in memory ASYNCHRONOUSLY  -- LITTLE ENDIAN -------------------
   process(ce_n, we_n, low_address, data)
     begin
       if ce_n='0' and we_n='0' then
			RAM(CONV_INTEGER(low_address  )) <= data; 
       end if;   
    end process;   
    
   -- read from memory
   process(ce_n, oe_n, low_address)
     begin
       if ce_n='0' and oe_n='0' then
            data <= RAM(CONV_INTEGER(low_address  ));
        else
            data <= (others=>'Z');
        end if;
   end process;   

end MP;
