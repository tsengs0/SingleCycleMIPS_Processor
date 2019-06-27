----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:27 01/24/2017 
-- Design Name: 
-- Module Name:    Main_control - Behavioral 
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

entity Main_control is
    Port ( Op : in  STD_LOGIC_VECTOR (5 downto 0);
			  Jump : out STD_LOGIC;
           RegDst : out  STD_LOGIC_VECTOR( 1 downto 0 );
           MemtoReg : out  STD_LOGIC_VECTOR( 1 downto 0 );
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
			  Branch_n : out STD_LOGIC; 
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
			  ALUSrc : out STD_LOGIC
	 );
end Main_control;

architecture Behavioral of Main_control is

begin

-- RegDst
	process( Op )
	begin
		if( Op( 5 downto 0 ) = "000000" ) then -- R-format
			RegDst <= "01";
		elsif( Op( 5 downto 0 ) = "100011" ) then -- lw
			RegDst <= "00";
		elsif( Op( 5 downto 0 ) = "001000" ) then -- addi
			RegDst <= "00";
		elsif( Op( 5 downto 0 ) = "000011" ) then -- jal
			RegDst <= "10";
		else
			RegDst <= "00"; 
		end if;
	end process;

-- ALUSrc
	process( Op )
	begin
		if( Op( 5 downto 0 ) = "000000" ) then
			ALUSrc <= '0'; -- R-format
		elsif( Op( 5 downto 0 ) = "100011" ) then
			ALUSrc <= '1'; -- lw
		elsif( Op( 5 downto 0 ) = "101011" ) then
			ALUSrc <= '1'; -- sw
		elsif( Op( 5 downto 0 ) = "000100" ) then
			ALUSrc <= '0'; -- beq
		elsif( Op( 5 downto 0 ) = "000101" ) then
			ALUSrc <= '0'; -- bne
		elsif( Op( 5 downto 0 ) = "001000" ) then
			ALUSrc <= '1'; -- addi
		elsif( Op( 5 downto 0 ) = "000011" ) then -- jal
			ALUSrc <= '0'; -- don't care
		else
			ALUSrc <= '0';
		end if;
	end process;
	
-- MemtoReg
	process( Op )
	begin
		case Op( 5 downto 0 ) is
			when "000000" => MemtoReg <= "00"; -- R-format
			when "100011" => MemtoReg <= "01"; -- lw
			when "101011" => MemtoReg <= "00"; -- sw (don't care)
			when "000100" => MemtoReg <= "00"; -- beq (don't care)
			when "000101" => MemtoReg <= "00"; -- bne (don't care)
			when "001000" => MemtoReg <= "00"; -- addi
			when "000011" => MemtoReg <= "10"; -- jal
			when others   => MemtoReg <= "00";
		end case;
	end process;
	
-- RegWrite
	process( Op )
	begin
		case Op( 5 downto 0 ) is
			when "000000" => RegWrite <= '1'; -- R-format
			when "100011" => RegWrite <= '1'; -- lw
			when "101011" => RegWrite <= '0'; -- sw 
			when "000100" => RegWrite <= '0'; -- beq 
			when "000101" => RegWrite <= '0'; -- bne 
			when "001000" => RegWrite <= '1'; -- addi
			when "000011" => RegWrite <= '1'; -- jal, write address to $ra
			when others   => RegWrite <= '0';
		end case;
	end process;

-- MemRead
	process( Op )
	begin
		case Op( 5 downto 0 ) is
			when "000000" => MemRead <= '0'; -- R-format
			when "100011" => MemRead <= '1'; -- lw
			when "101011" => MemRead <= '0'; -- sw 
			when "000100" => MemRead <= '0'; -- beq 
			when "000101" => MemRead <= '0'; -- bne 
			when "001000" => MemRead <= '0'; -- addi
			when "000011" => MemRead <= '0'; -- jal
			when others   => MemRead <= '0';
		end case;
	end process;
	
-- MemWrite
	process( Op )
	begin
		case Op( 5 downto 0 ) is
			when "000000" => MemWrite <= '0'; -- R-format
			when "100011" => MemWrite <= '0'; -- lw
			when "101011" => MemWrite <= '1'; -- sw 
			when "000100" => MemWrite <= '0'; -- beq 
			when "000101" => MemWrite <= '0'; -- bne 
			when "001000" => MemWrite <= '0'; -- addi
			when "000011" => MemWrite <= '0'; -- jal
			when others   => MemWrite <= '0';
		end case;
	end process;
	
-- Branch
	process( Op )
	begin
		case Op( 5 downto 0 ) is
			when "000000" => Branch <= '0'; -- R-format
			when "100011" => Branch <= '0'; -- lw
			when "101011" => Branch <= '0'; -- sw 
			when "000100" => Branch <= '1'; -- beq 
			when "000101" => Branch <= '0'; -- bne 
			when "001000" => Branch <= '0'; -- addi
			when "000011" => Branch <= '0'; -- jal -- don't care
			when others   => Branch <= '0';
		end case;
	end process;
	
-- ALUOp[1:0]
	process( Op )
	begin
		case Op( 5 downto 0 ) is
			when "000000" => ALUOp( 1 downto 0 ) <= "10"; -- R-format
			when "100011" => ALUOp( 1 downto 0 ) <= "00"; -- lw
			when "101011" => ALUOp( 1 downto 0 ) <= "00"; -- sw 
			when "000100" => ALUOp( 1 downto 0 ) <= "01"; -- beq 
			when "000101" => ALUOp( 1 downto 0 ) <= "01"; -- bne 
			when "001000" => ALUOp( 1 downto 0 ) <= "00"; -- addi
			when "000011" => ALUOp( 1 downto 0 ) <= "00"; -- jal -- dont't care
			when others   => ALUOp( 1 downto 0 ) <= "00";
		end case;
	end process;
	
-- Branch_n
	process( Op )
	begin
		case Op( 5 downto 0 ) is
			when "000000" => Branch_n <= '0'; -- R-format
			when "100011" => Branch_n <= '0'; -- lw
			when "101011" => Branch_n <= '0'; -- sw 
			when "000100" => Branch_n <= '0'; -- beq 
			when "000101" => Branch_n <= '1'; -- bne 
			when "001000" => Branch_n <= '0'; -- addi
			when "000011" => Branch_n <= '0'; -- jal -- don't care
			when others   => Branch_n <= '0';
		end case;
	end process;	
	
-- Jump
	process( Op )
	begin
		case Op( 5 downto 0 ) is
			when "000000" => Jump <= '0'; -- R-format
			when "100011" => Jump <= '0'; -- lw
			when "101011" => Jump <= '0'; -- sw 
			when "000100" => Jump <= '0'; -- beq 
			when "000101" => Jump <= '0'; -- bne 
			when "001000" => Jump <= '0'; -- addi
			when "000011" => Jump <= '1'; -- jal 
			when others   => Jump <= '0';
		end case;
	end process;	

end Behavioral;

