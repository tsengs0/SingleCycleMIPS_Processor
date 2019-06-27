----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:05:16 01/17/2017 
-- Design Name: 
-- Module Name:    REG_FILE - Behavioral 
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

entity REG_FILE is
    Port ( Read_addr_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_addr_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_addr  : in  STD_LOGIC_VECTOR (4 downto 0);
           Write_data  : in  STD_LOGIC_VECTOR (31 downto 0);
			  RegWrite    : in STD_LOGIC;
           Read_data_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Read_data_2 : out  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end REG_FILE;

architecture Behavioral of REG_FILE is

	type rom_type is array( 0 to 31 ) of std_logic_vector( 31 downto 0 );
	signal RAM : rom_type:= (
	
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		x"0000000a",--"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000"

	 );



begin

--Write process, Rising edge trigger
	process( CLK )
	begin
		if( CLK'event and CLK = '1' ) then
			if( RegWrite = '1' and Write_addr /= "00000" ) then --Accessing register of address 0 is forbidden
				RAM( conv_integer( Write_addr ) ) <= Write_data( 31 downto 0 );
			end if;
		end if;
	end process;
	
--Read process, Falling edge trigger
	process( CLK )
	begin
		if( CLK'event and CLK = '0' ) then
			Read_data_1( 31 downto 0 ) <= RAM( conv_integer( Read_addr_1 ) );
			Read_data_2( 31 downto 0 ) <= RAM( conv_integer( Read_addr_2 ) );
		else
			Read_data_1( 31 downto 0 ) <= x"00000000";
			Read_data_2( 31 downto 0 ) <= x"00000000";
		end if;
	end process;


end Behavioral;

