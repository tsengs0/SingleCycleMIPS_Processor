----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:21 01/24/2017 
-- Design Name: 
-- Module Name:    ALU_control - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_control is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALU_control_input : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_control;

architecture Behavioral of ALU_control is

begin

	process( ALUOp, Funct ) 
	begin
		case ALUOp is
			when "00" => ALU_control_input( 3 downto 0 ) <= "0010"; -- For lw, sw, addi
			when "01" => ALU_control_input( 3 downto 0 ) <= "0110"; -- For beq, bne
			when "10" => 
					case Funct is
						when "100000" => ALU_control_input( 3 downto 0 ) <= "0010"; -- For add
						when "100010" => ALU_control_input( 3 downto 0 ) <= "0110"; -- For sub
						when "100100" => ALU_control_input( 3 downto 0 ) <= "0000"; -- For and
						when "100101" => ALU_control_input( 3 downto 0 ) <= "0001"; -- For or
						when "101010" => ALU_control_input( 3 downto 0 ) <= "0111"; -- For slt
						when "001000" => ALU_control_input( 3 downto 0 ) <= "1000"; -- For jr
						when others   => ALU_control_input( 3 downto 0 ) <= "0000";
					end case;
			when others => ALU_control_input( 3 downto 0 ) <= "0000";
		end case;	
	end process;

end Behavioral;

