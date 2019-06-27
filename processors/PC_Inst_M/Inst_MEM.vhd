----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:18:06 01/13/2017 
-- Design Name: 
-- Module Name:    Inst_MEM - Behavioral 
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

entity Inst_MEM is
    Port ( CLKn : in  STD_LOGIC;
           ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Inst_MEM;

architecture Behavioral of Inst_MEM is

	type rom_type is array( 0 to 18 ) of std_logic_vector( 31 downto 0 );
	signal ROM : rom_type:= (

	--x"20030055", -- #0 addi $3, $0, 85
	--x"0c000003", -- #4 jal 3
	--x"00000820", -- #8 add $1, $zero, $zero
	--x"ac030000", -- #12 sw $3, 0($zero)
	--x"03e0f808", -- #16 jr $31
	--x"1000ffff"  -- #20 beq $0, $0, -1
		
		
		
		
		
		x"00000820", -- #0  add $1, $zero, $zero
		x"2002000a", -- #4  addi $2, $zero, $zero
		x"20030000", -- #8  addi $3, $zero, 0
		x"00002020", -- #12 add $4, $0, $0
	
		x"0c00000e", -- #16 jal 14
	
		x"00000820", -- #20 add $1, $zero, $zero
		x"00002020", -- #24 add $4, $zero, $zero
		x"8c850000", -- #28 lw $5, 0($4)
		x"00651820", -- #32 add $3, $3, $5
		x"20840004", -- #36 addi $4, $4, 4
		x"20210001", -- #40 addi $1, $1, 1
		x"1422fffb", -- #44 bne $1, $2, -5
		x"ac030000", -- #48 sw $3 0($zero)
		x"1000ffff",  --#52 beq $zero, $zero, -1
	
	
		x"ac810000", -- #56 sw $1, 0($4)
		x"20840004", -- #60 addi $4, $4, 4
		x"20210001", -- #64 addi $1, $1, 1
		x"1422fffc", -- #68 ben $1, $2, -4
		x"03e0f808"  -- #72 jr $31
				
	 );

begin

	process( CLKn ) 
	begin
	
		if( CLKn'event and CLKn = '0' ) then
		
			Dout <= ROM( conv_integer( ADDR( 31 downto 2 ) ) );
	
		end if;
	
	end process;

end Behavioral;

