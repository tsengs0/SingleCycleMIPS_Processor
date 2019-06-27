----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:35:52 01/20/2017 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

entity CPU is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  LED   : out std_logic_vector( 7 downto 0 )
	 );
end CPU;

architecture Behavioral of CPU is

--System clk gen
	signal cclk, mclk, crst : STD_LOGIC;

--PC
	signal PCout : std_logic_vector( 31 downto 0 );
	signal PCin : std_logic_vector( 31 downto 0 );
	signal PCin_temp_1, PCin_temp_2 : std_logic_vector( 31 downto 0 );
	signal PC_en : std_logic;
	
--Instruction fetch
	signal Inst : std_logic_vector( 31 downto 0 ); --outpot
	
--Instructoin decoder
	signal Write_register : std_logic_vector( 4 downto 0 );
	--signal Inst_in        : std_logic_vector( 31 downto 0 );
	signal Opcode         : std_logic_vector( 5  downto 0 );
	signal RS, RT, RD     : std_logic_vector( 4  downto 0 );
	signal Immediate      : std_logic_vector( 15 downto 0 );
	signal Shamt          : std_logic_vector( 4  downto 0 );
	signal Func           : std_logic_vector( 5  downto 0 );
	signal Jump_addr      : std_logic_vector( 25 downto 0 );
	 
--Register file
	signal Read_data_1, Read_data_2 : std_logic_vector( 31 downto 0 );
	signal Read_addr_1, Read_addr_2 : std_logic_vector( 4 downto 0 );
	
--ALU
	signal ALU_A, ALU_B 		  : std_logic_vector( 31 downto 0 );
	signal ALU_result 		  : std_logic_vector( 31 downto 0 );
	signal Jr_en  			     : std_logic;
	signal Zero_out			  : std_logic;
	
--Data memory
	signal Mem_out    : std_logic_vector( 31 downto 0 );
	signal Write_data : std_logic_vector( 31 downto 0 );
	
--Control signal
	signal Imm32, Imm32_2 	 : std_logic_vector( 31 downto 0 );
	signal Jump_addr_32 	    : std_logic_vector( 31 downto 0 );
	signal Jump_addr_sl2     : std_logic_vector( 27 downto 0 );
	signal Branch_target	    : std_logic_vector( 31 downto 0 );-- branch target address
	signal PC4               : std_logic_vector( 31 downto 0 );--The address of PC incremented by 4
	
--Main control unit(the setting of the control linies)
	signal RegDst   : std_logic_vector( 1 downto 0 );
	signal Branch   : std_logic;
	signal Branch_n : std_logic;
	signal MemRead  : std_logic;
	signal MemtoReg : std_logic_vector( 1 downto 0 );
	signal ALUOp    : std_logic_vector( 1 downto 0 );
	signal MemWrite : std_logic;
	signal ALUSrc   : std_logic;
	signal RegWrite : std_logic;
	signal Jump     : std_logic;
	
	
--ALU control unit
	signal ALU_control_input	: std_logic_vector( 3 downto 0 );
	
--------------------------------------------------------------------------------
--Components

	component clk_rst_gen
	GENERIC (
		CCLK_DIV : INTEGER;
		CCLK_MUL : INTEGER;
		MCLK_DIV : INTEGER;
		MCLK_MUL : INTEGER
	);
	port (
		CLK : in STD_LOGIC;
		RST : in STD_LOGIC;
		cclk : out STD_LOGIC;
		mclk : out STD_LOGIC;
		crst : out STD_LOGIC
	);
	end component;
	
	component PC
	port (
		   CLK 	 : in  STD_LOGIC;
           RST  : in  STD_LOGIC;
           EN 	 : in  STD_LOGIC;
           PCin  : in  STD_LOGIC_VECTOR (31 downto 0);
           PCout : out  STD_LOGIC_VECTOR (31 downto 0)
	);
	end component;
	
	component Inst_MEM
	port (
		   CLKn : in  STD_LOGIC;
           ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0)
	);
	end component;
	
	component REG_FILE
	port (
		   Read_addr_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_addr_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_addr  : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_data  : in  STD_LOGIC_VECTOR (31 downto 0);
		   RegWrite    : in STD_LOGIC;
           Read_data_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Read_data_2 : out  STD_LOGIC_VECTOR (31 downto 0);
           CLK 		   : in  STD_LOGIC;
           RST 	   : in  STD_LOGIC
	);
	end component;
	
	component ALU
	port (
		   ALU_A 			 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_B 			 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_control_input : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_result 		 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Jr_en 		 : out  STD_LOGIC;
           Zero_out 		 : out  STD_LOGIC
	);
	end component;
	
	component Data_MEM
	port (
		   CLKn 	: in  STD_LOGIC;
           MemRead  : in  STD_LOGIC;
           ADDR 	: in  STD_LOGIC_VECTOR (31 downto 0);
           MemWrite : in  STD_LOGIC;
           Din 		: in  STD_LOGIC_VECTOR (31 downto 0);
           Dout 	: out  STD_LOGIC_VECTOR (31 downto 0)
	);
	end component;
	
	component ALU_control
	port ( 
		   ALUOp 			 : in  STD_LOGIC_VECTOR (1 downto 0);
           Funct 			 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALU_control_input : out  STD_LOGIC_VECTOR (3 downto 0)
	);
	end component;
	
	component Main_control
	port ( 
		   Op 		  : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst   : out  STD_LOGIC_VECTOR (1 downto 0);
           MemtoReg : out  STD_LOGIC_VECTOR (1 downto 0);
           RegWrite : out  STD_LOGIC;
           MemRead  : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch   : out  STD_LOGIC;
			  Branch_n : out  STD_LOGIC;
		   ALUSrc   : out  STD_LOGIC;
			Jump : out STD_LOGIC;
           ALUOp    : out  STD_LOGIC_VECTOR (1 downto 0)
	);
	end component;
	
begin

	clk_rst_gen_map : clk_rst_gen
	generic map (
		CCLK_DIV => 20, --cclk = 100MHz/CCLK_DIV * CCLK_MUL
		CCLK_MUL => 2,
		MCLK_DIV => 20,
		MCLK_MUL => 4
	)
	port map (
		CLK => CLK,
		RST => RST,
		cclk => cclk,
		mclk => mclk,
		crst => crst
	);

	PC_map : PC port map (
			  CLK   => cclk,
  		     --RST  => crst, --note
			  RST  =>  RST,
			  EN => PC_en,
			  PCin  => PCin,
			  PCout => PCout
	);
	
	Inst_MEM_map : Inst_MEM port map (
			  CLKn => mclk,
			  ADDR => PCout,
			  Dout => Inst
	);

	REG_FILE_map : REG_FILE port map (
			  Read_addr_1 => Read_addr_1,
			  Read_addr_2 => Read_addr_2,
			  Write_addr => Write_register,
			  Write_data => Write_data,
			  RegWrite => RegWrite,
			  Read_data_1 => Read_data_1,
			  Read_data_2 => Read_data_2,
			  CLK => cclk,
			  RST => crst	--note  
	);
	
	ALU_map : ALU port map (
			  ALU_A => ALU_A,
			  ALU_B => ALU_B,
			  ALU_control_input => ALU_control_input,
			  ALU_result => ALU_result,
			  Jr_en => Jr_en,
			  Zero_out => Zero_out
	);
	
	Data_MEM_map : Data_MEM port map (
			  CLKn => mclk,
			  ADDR => ALU_result,
			  MemRead => MemRead,
			  MemWrite => MemWrite,
			  Din => Read_data_2,--Write_data,
			  Dout => Mem_out
	);
	
	ALU_control_map : ALU_control port map (
		   ALUOp => ALUOp,
           Funct => Inst( 5 downto 0 ),
           ALU_control_input => ALU_control_input
	);
	
	Main_control_map : Main_control port map (
			Op => Inst( 31 downto 26 ),
			RegDst => RegDst,
			MemtoReg => MemtoReg,
			RegWrite => RegWrite,
			MemRead => MemRead,
			MemWrite => MemWrite,
			Branch => Branch,
			Branch_n => Branch_n,
			ALUOp => ALUOp,
			Jump => Jump,
			ALUSrc => ALUSrc
	);
	
	process( cclk, crst ) begin
		--if( crst = '1' ) then
		if( RST = '1' ) then
			LED <= "00000000";
		elsif( cclk'event and cclk = '1' ) then
			if( MemWrite = '1' and ALU_result = x"00000000" ) then
				LED( 7 downto 0 ) <= Read_data_2( 7 downto 0 );
				
			end if;
		end if;
	end process;

--Imm32( 31 downto 0 ) <= ( 31 downto 16 => Inst(15) ) & Inst( 15 downto 0 );
	
--Enable PC work
	PC_en <= '1';

--sign extend
	Jump_addr_sl2( 27 downto 0 ) <= Jump_addr( 25 downto 0 ) & "00"; -- Extend the jump_address[25:0] to 28-bit by concatenating 2-bit of '0' from LSB
	
	Imm32( 31 downto 0 ) <= Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst(15) & Inst( 15 downto 0 );

--shift left 2-bit
--The jump instruction operated by relacing the lower 28-bit of the PC4 with the lower 26-bit of the instruction shifted by 2-bit.
-- assign Imm32_2[31:0] = { Imm32[29:0], 2'b00 };
-- assign Branch_target = { PC[31:28], Imm32_2[27:0] };
-- The '&' is not logic AND but the meaning of "concatenating" '
	Imm32_2( 31 downto 0 ) <= Imm32( 29 downto 0 ) & "00";
	Jump_addr_32( 31 downto 0 ) <= PC4( 31 downto 28 ) & Jump_addr_sl2( 27 downto 0 );
	Branch_target( 31 downto 0 ) <= PC4 + Imm32_2;
	
--The address of PC incremented by 4 bytes
	PC4 <= PCout + "100";
	
--Multiplexor for deciding either Branch target address or PC inremented by 4 will be next PCin
	PCin_temp_1( 31 downto 0 ) <= Branch_target( 31 downto 0 ) when ( 
															   ( Branch   and     Zero_out ) = '1' or 
															   ( not Zero_out and Branch_n ) = '1' 
																		     
															  ) else PC4( 31 downto 0 );
															  
	PCin_temp_2( 31 downto 0 ) <= PCin_temp_1( 31 downto 0 ) when ( Jump = '0' ) else
								  Jump_addr_32( 31 downto 0 ) when ( Jump = '1' ) else
								  PCin_temp_1( 31 downto 0 );
								  
	PCin( 31 downto 0 ) <= Read_data_1( 31 downto 0 ) when ( Jr_en = '1' ) else PCin_temp_2( 31 downto 0 );
	
--Multiplexor for deciding the source of Wite_Back_data is from either Data memory or ALU_result
	Write_data( 31 downto 0 ) <= ALU_result( 31 downto 0 ) when ( MemtoReg = "00" ) else 
										  Mem_out( 31 downto 0 )    when ( MemtoReg = "01" ) else
										  PC4( 31 downto 0 ) when ( MemtoReg = "10" ) else
										  ALU_result( 31 downto 0 );
	
--Multiplexor for the source of ALU_B


--	process( ALUSrc ) begin
--		if( ALUSrc = '0' ) then
--			ALU_B( 31 downto 0 ) <= Read_data_2( 31 downto 0 );
--		else
--			ALU_B( 31 downto 0 ) <= Imm32( 31 downto 0 );
--		end if;
--	end process;
	ALU_B( 31 downto 0 ) <= Read_data_2( 31 downto 0 ) when ( ALUSrc = '0' ) else Imm32( 31 downto 0 );
	ALU_A( 31 downto 0 ) <= Read_data_1( 31 downto 0 );
	
--The input sources of Register file
	Read_addr_1( 4 downto 0 )    <= Inst( 25 downto 21 );
	Read_addr_2( 4 downto 0 )    <= Inst( 20 downto 16 );
	Write_register( 4 downto 0 ) <= Inst( 20 downto 16 ) when ( RegDst = "00" ) else
											  Inst( 15 downto 11 ) when ( RegDst = "01" ) else
											  "11111" when ( RegDst = "10" ) else
											  Inst( 20 downto 16 );
											  
	Opcode <= Inst( 31 downto 26 );
	RS <= Inst( 25 downto 21 );
	RT <= Inst( 20 downto 16 );
	RD <= Inst( 15 downto 11 );
	Shamt <= Inst( 10 downto 6 );
	Func <= Inst( 5 downto 0 );
	Immediate <= Inst( 15 downto 0 );
	Jump_addr <= Inst( 25 downto 0 );


end Behavioral;

