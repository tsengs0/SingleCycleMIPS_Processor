--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:21:42 01/17/2017
-- Design Name:   
-- Module Name:   C:/Users/BO-YU TSENG/Documents/FPGA/Xilinx/ATLYS/Prj/processors/REG_FILE/REG_FILE_testbench.vhd
-- Project Name:  REG_FILE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REG_FILE
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
 
ENTITY REG_FILE_testbench IS
END REG_FILE_testbench;
 
ARCHITECTURE behavior OF REG_FILE_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REG_FILE
    PORT(
         Read_addr_1 : IN  std_logic_vector(4 downto 0);
         Read_addr_2 : IN  std_logic_vector(4 downto 0);
         Write_addr : IN  std_logic_vector(4 downto 0);
         Write_data : IN  std_logic_vector(31 downto 0);
         RegWrite : IN  std_logic;
         Read_data_1 : OUT  std_logic_vector(31 downto 0);
         Read_data_2 : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rstn : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Read_addr_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Read_addr_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Write_addr : std_logic_vector(4 downto 0) := (others => '0');
   signal Write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';
   signal clk : std_logic := '0';
   signal rstn : std_logic := '0';

 	--Outputs
   signal Read_data_1 : std_logic_vector(31 downto 0);
   signal Read_data_2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REG_FILE PORT MAP (
          Read_addr_1 => Read_addr_1,
          Read_addr_2 => Read_addr_2,
          Write_addr => Write_addr,
          Write_data => Write_data,
          RegWrite => RegWrite,
          Read_data_1 => Read_data_1,
          Read_data_2 => Read_data_2,
          clk => clk,
          rstn => rstn
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rstn <= '0';
      wait for 101 ns;	-- Intentially insert 1 ns delay in order to simulate a latency during memory access
		rstn <= '1';
		
      --wait for clk_period*10;

      -- insert stimulus here 
----------------------------------------------------------------
--Step 1
	Read_addr_1 <= "00000";
	Read_addr_2 <= "00001";
	Write_addr  <= "00010";
	
	Write_data( 31 downto 0 ) <= x"02020202";
	RegWrite <= '1'; -- Enable write process
	
	wait for clk_period;
----------------------------------------------------------------
----------------------------------------------------------------
--Step 2
	Read_addr_1 <= "00001";
	Read_addr_2 <= "00010";
	Write_addr  <= "00000";
	
	Write_data( 31 downto 0 ) <= x"04040404";
	RegWrite <= '1'; -- Enable write process
	
	wait for clk_period;
----------------------------------------------------------------
----------------------------------------------------------------
--Step 3
	Read_addr_1 <= "00000";
	Read_addr_2 <= "00001";
	Write_addr  <= "00001";
	
	Write_data( 31 downto 0 ) <= x"08080808";
	RegWrite <= '1'; -- Enable write process
	
	wait for clk_period;
----------------------------------------------------------------		
----------------------------------------------------------------
--Step 4
	Read_addr_1 <= "00001";
	RegWrite <= '0';
	wait for clk_period;
----------------------------------------------------------------
		
		
		wait;
   end process;

END;
