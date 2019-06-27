--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:28:15 01/10/2017
-- Design Name:   
-- Module Name:   C:/Users/BO-YU TSENG/Documents/FPGA/Xilinx/ATLYS/Prj/processors/ALU/ALU/ALU_test.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         ALU_control_input : IN  std_logic_vector(3 downto 0);
         ALU_result : OUT  std_logic_vector(31 downto 0);
         Zero_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_control_input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_result : std_logic_vector(31 downto 0);
   signal Zero_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	signal clk : std_logic;
   constant clk_period : time := 100 ns;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_control_input => ALU_control_input,
          ALU_result => ALU_result,
          Zero_out => Zero_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
 		wait for 50 ns;
 		clk <= '1';
 		wait for 50 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
		A <= "00000000000000000000000000000011";
		B <= "00000000000000000000000000000001";
		ALU_control_input <= "0000"; -- AND
		wait for 100 ns;
	
		A <= "00000000000000000000000000000011";
		B <= "00000000000000000000000000000001";
		ALU_control_input <= "0001"; -- OR
		wait for 100 ns;
		
		A <= "00000000000000000000000000000011";
		B <= "00000000000000000000000000000001";
		ALU_control_input <= "0010"; -- ADD
		wait for 100 ns;
		
		A <= "00000000000000000000000000000011";
		B <= "00000000000000000000000000000001";
		ALU_control_input <= "0110"; -- SUB
		wait for 100 ns;
		
		A <= "00000000000000000000000000000001";
		B <= "00000000000000000000000000000011";
		ALU_control_input <= "0110"; -- SUB
		wait for 100 ns;
		
		A <= "00000000000000000000000000000011";
		B <= "00000000000000000000000000000001";
		ALU_control_input <= "0111"; -- SLT
		wait for 100 ns;

		A <= "00000000000000000000000000000001";
		B <= "00000000000000000000000000000011";
		ALU_control_input <= "0111"; -- SLT
		wait for 100 ns;

		A <= "00000000000000000000000000000011";
		B <= "00000000000000000000000000000001";
		ALU_control_input <= "1100"; -- NOR
		wait for 100 ns;		
		
      wait;
   end process;
	
	--Run the test once



END;
