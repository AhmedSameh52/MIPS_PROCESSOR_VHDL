library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProgramCounter is
		Port ( 
	        PCIN : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           PCOUT : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is
SIGNAL PCTemp : STD_LOGIC_VECTOR (31 downto 0 ):= X"00000000" ; --Store initial value 0 to PC (Start the PC with 0)
begin

    process (CLK)
        begin
            if (clk'event and clk='0') then
                PCTemp<=PCIN;
            end if;
        end process;
		  
PCOUT<= PCTemp;

end Behavioral;

