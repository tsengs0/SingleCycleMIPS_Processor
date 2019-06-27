----------------------------------------------------------------------------------
-- Company: Insight
-- Engineer: Marcelo Linck
-- 
-- Create Date:    23:20:04 05/07/2011 
-- Package Name:   CachePackage
-- Project Name:	 MR4_cache

-- Description: Package with auxiliary definitions for
-- cache implementation.
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: this may be useful, someday...
--
---------------------------------------------------------------------------------- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package CachePackage is

	subtype reg32  is STD_LOGIC_VECTOR(31 downto 0);
	subtype reg16  is std_logic_vector(15 downto 0);

	-- L1 -------------------------------------------------------------------------
	 
	-- line size
	subtype reg155 is STD_LOGIC_VECTOR(154 downto 0);
	-- total of bits to store 4 words in which line
	subtype reg128 is STD_LOGIC_VECTOR(127 downto 0);
	-- WriteBack
	subtype reg156 is STD_LOGIC_VECTOR(155 downto 0);
	-- L1 to L2
	subtype reg256 is STD_LOGIC_VECTOR(255 downto 0);
	
	-- number of lines
	constant L1_LINE : integer := 4;
	-- definition of cache size
	type L1_mem is array (0 to L1_LINE-1) of reg155;
	
	-------------------------------------------------------------------------------
	
	-- L2 -------------------------------------------------------------------------
	
	-- delay simulation
	constant WAIT_L2 : integer := 6;
	-- line size
	subtype reg280 is STD_LOGIC_VECTOR(279 downto 0);
	
	-- number of lines
	constant L2_LINE : integer := 16;
	-- definition of cache size
	type L2_mem is array (0 to L2_LINE-1) of reg280;
	
	-------------------------------------------------------------------------------
	
	-- MP -------------------------------------------------------------------------
	
	--delay simulation FOR MP!
	constant WAIT_MP : integer := 12;
	-- number of lines
	constant MP_LINE : integer := 16000;
	-- definition of MP size
	type MP_mem is array (0 to MP_LINE-1) of reg32;
	
	
	-------------------------------------------------------------------------------
	-- State Machine --------------------------------------------------------------
   
	type type_state is (SL1, SL2, WL2, SMP, WBL1, WMP, TMEMO); 
	
	-------------------------------------------------------------------------------
	
end CachePackage;
