----------------------------------------------------------------------------------
-- Company: Insight
-- Engineer: Marcelo Linck
-- 
-- Create Date:    01:07:15 05/08/2011 
-- Module Name:    L2_cache - cache 
-- Project Name:   MR4_cache
-- Description: internal architecture of a memory cache L2
-- with direct mapping.
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: OMG it's a lot of cache!
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.CachePackage.ALL;

entity L2_cache is
	generic (
		START_A: 			reg32 := (others => '0') --endereço inicial
	);
	port(
		address:  				in 	reg32; --PC
		block_L1:				out	reg128; --Passa os dados para L1
		block_MP:				inout		reg32; --Recebe os dados da memória principal
		ce_n,we_n,oe_n: 		in		STD_LOGIC; --ce, we e oe
		hit:						out   STD_LOGIC --hit/miss
	);
end L2_cache;

architecture cache of L2_cache is
	signal RAM: L2_mem;
	signal tmp_address: reg32 := (others=>'0');
	signal switch_block: reg128 := (others=>'0');
	signal tmp_line: reg280 := (others=>'0');
begin

	------------------------------------------------------------------------------------
	-- Some notes:
	-- -> address(4 downto 2) = block
	-- -> address(8 downto 5) = line
	-- -> address(31 downto 9) = tag 
	-- -> tmp_line (277 downto 256) = tag
	-- -> tmp_line (278) = valid bit
	-- -> switch_block = receives the correct block from the line (block has 4 words) - (there are 2 blocks)
	-- -> block_MP = a entire block from MP (8 words)
	------------------------------------------------------------------------------------

	tmp_address <= address - START_A; --endereço temporário recebe endereço do PC - endereço inicial

	block_L1 <= switch_block; --Passa os dados para L1
	
	-- indicates if had a hit or miss (equal tags and bit valid = '1')
	hit <= '1' when ( (RAM(CONV_INTEGER(tmp_address(8 downto 5)))(278 downto 256) = address(31 downto 9)) and (tmp_line(279) = '1') ) else '0';
	--Se a tag da cache for igual à tag do PC e o bit de validade for 1, hit, senão miss
	
	-- mux to switch blocks
	switch_block <= tmp_line(127 downto 0) when address(4 downto 2) >= "100" else
						 tmp_line(255 downto 128) when address(4 downto 2) < "100";
						 
	lineWB <= '1' & address(279 downto 256) & dataWBL1;
						 
	-- READ (only valid if hit = '1')
   process(ce_n, oe_n, switch_block)
   begin
		if(ce_n='0' and oe_n='0') then 
		-- get cache line
		tmp_line <= RAM(CONV_INTEGER(tmp_address(8 downto 5)));
		end if;
   end process;
	
	-- WRITE (instructions come from MP)
	process(ce_n, we_n,address,block_MP)
     begin
       if(ce_n='0' and we_n='0') then
			-- up valid bit and tag
			RAM(CONV_INTEGER(tmp_address(8 downto 5)))(279 downto 256) <= '1' & address(31 downto 9);
			if WriteBack = '0' then 
				case tmp_address(4 downto 2) is
					when "000" => RAM(CONV_INTEGER(tmp_address(8 downto 5)))(255 downto 224) <= block_MP;
					when "001" => RAM(CONV_INTEGER(tmp_address(8 downto 5)))(223 downto 192) <= block_MP;
					when "010" => RAM(CONV_INTEGER(tmp_address(8 downto 5)))(191 downto 160) <= block_MP;
					when "011" => RAM(CONV_INTEGER(tmp_address(8 downto 5)))(159 downto 128) <= block_MP;
					when "100" => RAM(CONV_INTEGER(tmp_address(8 downto 5)))(127 downto 96) <= block_MP;
					when "101" => RAM(CONV_INTEGER(tmp_address(8 downto 5)))(95 downto 64) <= block_MP;
					when "110" => RAM(CONV_INTEGER(tmp_address(8 downto 5)))(63 downto 32) <= block_MP;
					when others => RAM(CONV_INTEGER(tmp_address(8 downto 5)))(31 downto 0) <= block_MP;
				end case;
			else 
				RAM(CONV_INTEGER(tmp_address(8 downto 5)))(255 downto 0) <= lineWB;
			end if;
			
		end if;
    end process; 

end cache;

