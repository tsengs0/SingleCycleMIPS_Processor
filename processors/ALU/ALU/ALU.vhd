----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:25 01/10/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( ALU_A : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_B : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_control_input : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_result : out  STD_LOGIC_VECTOR (31 downto 0);
			  Jr_en      : out STD_LOGIC;
           Zero_out : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

	signal slt_result: STD_LOGIC_VECTOR ( 31 downto 0 );
	signal result: STD_LOGIC_VECTOR ( 31 downto 0 );
	
begin

	process( ALU_A, ALU_B, ALU_control_input, slt_result )
	begin
	
		case ALU_control_input( 3 downto 0 ) is
			when "0000" => result( 31 downto 0 ) <= ALU_A( 31 downto 0 ) and ALU_B( 31 downto 0 );
			when "0001" => result( 31 downto 0 ) <= ALU_A( 31 downto 0 ) or  ALU_B( 31 downto 0 );
			when "0010" => result( 31 downto 0 ) <= ALU_A( 31 downto 0 ) +   ALU_B( 31 downto 0 );
			when "0110" => result( 31 downto 0 ) <= ALU_A( 31 downto 0 ) -   ALU_B( 31 downto 0 );
			when "0111" => result( 31 downto 0 ) <= slt_result( 31 downto 0 );
			when "1000" => result( 31 downto 0 ) <= ALU_A( 31 downto 0 ) and ALU_B( 31 downto 0 ); -- for jr
			when "1100" => result( 31 downto 0 ) <= ALU_A( 31 downto 0 ) nor ALU_B( 31 downto 0 );
			when others => result <= "00000000000000000000000000000000";
		end case;
	
	end process;
	
	Jr_en <= '1' when ( ALU_control_input( 3 downto 0) = "1000" ) else '0';
	
	slt_result( 31 downto 1 ) <= "0000000000000000000000000000000";
	process( ALU_A, ALU_B )
	begin
	
		if( ALU_A < ALU_B ) then
			slt_result(0) <= '1';
		else
			slt_result(0) <= '0';
		end if;
		
	end process;

	process( result )
	begin
	
		if( result = "00000000000000000000000000000000" ) then
			Zero_out <= '1';
		else
			Zero_out <= '0';
		end if;
	
	end process;
	
	ALU_result( 31 downto 0 ) <= result( 31 downto 0 );

end Behavioral;

