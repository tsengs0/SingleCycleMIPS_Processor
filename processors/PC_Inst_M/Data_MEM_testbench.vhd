--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:27:40 01/13/2017
-- Design Name:   
-- Module Name:   C:/Users/BO-YU TSENG/Documents/FPGA/Xilinx/ATLYS/Prj/processors/PC_Inst_M/Data_MEM_testbench.vhd
-- Project Name:  PC_Inst_M
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_MEM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Data_MEM_testbench IS
END Data_MEM_testbench;
 
ARCHITECTURE behavior OF Data_MEM_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_MEM
    PORT(
         CLKn : IN  std_logic;
         ADDR : IN  std_logic_vector(31 downto 0);
         MemRead : IN  std_logic;
         MemWrite : IN  std_logic;
         Din : IN  std_logic_vector(31 downto 0);
         Dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLKn : std_logic := '0';
   signal ADDR : std_logic_vector(31 downto 0) := (others => '0');
   signal MemRead : std_logic := '0';
   signal MemWrite : std_logic := '0';
   signal Din : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLKn_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_MEM PORT MAP (
          CLKn => CLKn,
          ADDR => ADDR,
          MemRead => MemRead,
          MemWrite => MemWrite,
          Din => Din,
          Dout => Dout
        );

   -- Clock process definitions
   CLKn_process :process
   begin
		CLKn <= '0';
		wait for CLKn_period/2;
		CLKn <= '1';
		wait for CLKn_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

		ADDR( 31 downto 0 ) <= "--------------------------------";
      Din( 31 downto 0 )  <= "--------------------------------";
		wait for 100 ns;	


     -- wait for CLKn_period*10;
		wait for 200 ns;
      -- insert stimulus here 
-----------------------------------------------------------------------------
--Write testbench
		wait for 50 ns;
--Write 0
		--MemRead <= '0'; MemWrite <= '0';
		Din( 31 downto 0 )  <= "00000000000000000000000000000001";
		ADDR( 31 downto 0 ) <= "00000000000000000000000000000000";
--			wait for 50 ns;
		MemRead <= '0'; MemWrite <= '1';
			wait for 100 ns;
--		wait for 100 ns;

--Write 1			
--		MemRead <= '0'; MemWrite <= '0';
		Din( 31 downto 0 )  <= "00000000000000000000000000000010";
		ADDR( 31 downto 0 ) <= "00000000000000000000000000000100";
			--wait for 50 ns;
		MemRead <= '0'; MemWrite <= '1';
			wait for 100 ns;
--		wait for 100 ns;

--Write 2
--		MemRead <= '0'; MemWrite <= '0';
		Din( 31 downto 0 )  <= "00000000000000000000000000000100";
		ADDR( 31 downto 0 ) <= "00000000000000000000000000001000";
			--wait for 50 ns;
		MemRead <= '0'; MemWrite <= '1';
			wait for 100 ns;
--		wait for 100 ns;
	
--Write 3
--		MemRead <= '0'; MemWrite <= '0';
		Din( 31 downto 0 )  <= "00000000000000000000000000001000";
		ADDR( 31 downto 0 ) <= "00000000000000000000000000001100";
			--wait for 50 ns;	
		MemRead <= '0'; MemWrite <= '1';
			wait for 100 ns;
--		wait for 100 ns;

-----------------------------------------------------------------------------		
		MemRead <= '0'; MemWrite <= '0';
		ADDR( 31 downto 0 ) <= "--------------------------------";
		Din( 31 downto 0 )  <= "--------------------------------";
		wait for 200 ns;
-----------------------------------------------------------------------------
--Read testbench

--Read 0
		MemRead <= '1'; MemWrite <= '0';
		ADDR( 31 downto 0 ) <= "00000000000000000000000000000000";
		wait for 100 ns;

--Read 1			
		MemRead <= '1'; MemWrite <= '0';
		ADDR( 31 downto 0 ) <= "00000000000000000000000000000100";
		wait for 100 ns;

--Read 2
		MemRead <= '1'; MemWrite <= '0';
		ADDR( 31 downto 0 ) <= "00000000000000000000000000001000";
		wait for 100 ns;
			
--Read 3
		MemRead <= '1'; MemWrite <= '0';
		ADDR( 31 downto 0 ) <= "00000000000000000000000000001100";
		wait for 100 ns;
-----------------------------------------------------------------------------		
		
		MemRead <= '0'; MemWrite <= '0';
		ADDR( 31 downto 0 ) <= "--------------------------------";
		
      wait;
   end process;

END;
