--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:33:13 01/13/2017
-- Design Name:   
-- Module Name:   C:/Users/BO-YU TSENG/Documents/FPGA/Xilinx/ATLYS/Prj/processors/PC_Inst_M/PC_Inst_MEM_test.vhd
-- Project Name:  PC_Inst_M
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Inst_MEM
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
 
ENTITY Inst_MEM_test IS
END Inst_MEM_test;
 
ARCHITECTURE behavior OF Inst_MEM_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Inst_MEM
    PORT(
         CLKn : IN  std_logic;
         ADDR : IN  std_logic_vector(31 downto 0);
         Dout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal ADDR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Inst_MEM PORT MAP (
          CLKn => CLK,
          ADDR => ADDR,
          Dout => Dout
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for CLK_period*10;

      -- insert stimulus here 

		ADDR( 31 downto 0 ) <= "00000000000000000000000000000000";
		wait for 100 ns;
		
		ADDR( 31 downto 0 ) <= "00000000000000000000000000000100";
		wait for 100 ns;
		
		ADDR( 31 downto 0 ) <= "00000000000000000000000000001000";
		wait for 100 ns;
		
		ADDR( 31 downto 0 ) <= "00000000000000000000000000001100";
		wait for 100 ns;

      wait;
   end process;

END;
