----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:52 01/20/2017 
-- Design Name: 
-- Module Name:    Instuction_Decoder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instuction_Decoder is
    Port ( CLK : in  STD_LOGIC;
           RSTn : in  STD_LOGIC;
           Inst_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Opcode : out  STD_LOGIC_VECTOR (5 downto 0);
           RS : out  STD_LOGIC_VECTOR (4 downto 0);
           RT : out  STD_LOGIC_VECTOR (4 downto 0);
           RD : out  STD_LOGIC_VECTOR (4 downto 0);
           Immediate : out  STD_LOGIC_VECTOR (15 downto 0);
           Shamt : out  STD_LOGIC_VECTOR (4 downto 0);
           Func : out  STD_LOGIC_VECTOR (5 downto 0);
           Branch_addr : out  STD_LOGIC_VECTOR (25 downto 0));
end Instuction_Decoder;

architecture Behavioral of Instuction_Decoder is

begin


end Behavioral;

