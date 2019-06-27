----------------------------------------------------------------------------------
-- Company: Insight
-- Engineer: Marcelo Linck
-- 
-- Create Date:    21:18:05 05/07/2011 
-- Module Name:    MEM_cache - cache 
-- Project Name:	 MR4_cache
-- Description: internal architecture of a memory cache L1
-- with direct mapping.
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: gimme cache to go faster.
--
---------------------------------------------------------------------------------- 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.CachePackage.ALL;

entity L1_cache is
	generic ( 
		START_A: 			reg32 := (others => '0') --endereço inicial
	);
	port(
		address:  				in 	reg32; --PC
		data:		 				out	reg32; --Dado
		block_L2:				in		reg128; --Recebe os dados de L2
		ce_n,we_n,oe_n:	 	in		STD_LOGIC; --ce, oe e we
		hit,tx:					out   STD_LOGIC --hit/miss e um sinal aparentemente inútil
	);
end L1_cache;

architecture cache of L1_cache is
	signal RAM: L1_mem;
	signal tmp_address,switch_word: reg32;
	signal tmp_line: reg155;
begin

	------------------------------------------------------------------------------------
	-- Some notes:
	-- -> address(5 downto 4) = line
	-- -> address(31 downto 6) = tag 
	-- -> tmp_line (153 downto 128) = tag
	-- -> tmp_line (154) = valid bit
	-- -> switch_word = receives the correct word from the line (line has 4 words)
	-- -> block_L2 = a entire block from L2 (4 words)
	------------------------------------------------------------------------------------

	tmp_address <= address - START_A; --O endereço temporário recebe o endereço do PC menos o inicial do MIPS
	
	-- get cache line
	tmp_line <= RAM(CONV_INTEGER(tmp_address(5 downto 4))); --Acha a linha pelo endereço do PC
	
	-- indicates if had a hit or miss (equal tags and bit valid = '1')
	hit <= '1' when ( (tmp_line(153 downto 128) = address(31 downto 6)) and (tmp_line(154) = '1') ) else '0';
	--Se a tag da cache for igual a tag do PC e o bit de validade for 1, hit, senão deu miss
	
	-- mux to switch words
	switch_word <= tmp_line(31 downto 0) when address(3 downto 2) = "11" else 
						tmp_line(63 downto 32) when address(3 downto 2) = "10" else 
						tmp_line(95 downto 64) when address(3 downto 2) = "01" else 
						tmp_line(127 downto 96); 
	
	-- READ (only valid if hit = '1')
   process(ce_n, oe_n, switch_word)
   begin
		if(ce_n='0' and oe_n='0') then data <= switch_word; --Se a L1 tem o endereço, escreve na memória
		end if;
   end process;
	
	-- WRITE (instructions come from L2)
	process(ce_n, we_n,tmp_line,block_L2)
     begin
       if(ce_n='0' and we_n='0') then
			RAM(CONV_INTEGER(address(5 downto 4))) <= '1' & address(31 downto 6) & block_L2;  --Recebe os dados de L2 se der miss
		end if;
    end process; 
	
	

end cache;

