----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:11:01 01/13/2017 
-- Design Name: 
-- Module Name:    Data_MEM - Behavioral 
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

entity Data_MEM is
    Port ( CLKn : in  STD_LOGIC;
           ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           MemRead : in  STD_LOGIC;
           MemWrite : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end Data_MEM;

architecture Behavioral of Data_MEM is

	type ram_type is array( 0 to 31 ) of std_logic_vector( 31 downto 0 );
	signal RAM : ram_type:= (
	
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
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000"

	 );
begin

--Write
	process( CLKn )
	begin
		if( CLKn'event and CLKn = '0' and MemRead = '0' and MemWrite = '1' ) then
			RAM( conv_integer( ADDR( 6 downto 2 ) ) ) <= Din( 31 downto 0 );
		else
			RAM( conv_integer( ADDR( 6 downto 2 ) ) ) <= RAM( conv_integer( ADDR( 6 downto 2 ) ) );
		end if;
	end process;

--Read
	process( CLKn )
	begin
		if( CLKn'event and CLKn = '0' and MemRead = '1' and MemWrite = '0' ) then
			Dout( 31 downto 0 ) <= RAM( conv_integer( ADDR( 6 downto 2 ) ) );
		else
			Dout( 31 downto 0 ) <= x"00000000";
		end if;
	end process;


end Behavioral;

