library ieee;
use ieee.std_logic_1164.all;


entity ALUControl is
    port(
         ALUOperation : in std_logic_vector(1 downto 0);
         Func : in std_logic_vector(5 downto 0);
         OPCode : out std_logic_vector(3 downto 0)
    );
end entity ALUControl;


architecture behavior of ALUControl is 
    begin

        process(ALUOperation, Func)
            begin
					
					if(ALUOperation = "00") then	-- Addition Operation
						OPCode <= "0010";
					
					elsif(ALUOperation = "01") then	-- Subtraction Operation
						OPCode <= "0110";
					
					elsif(ALUOperation = "10") then	-- R Format
						
						if(Func = "100000") then -- Add Operation
							OPCode <= "0010";
						
						elsif(Func = "100010") then -- Sub Operation
							OPCode <= "0110";
							
						elsif(Func = "100100") then -- And Operation
							OPCode <= "0000";
							
						elsif(Func = "100101") then -- Or Operation
							OPCode <= "0001";
							
						elsif(Func = "100111") then -- Nor Operation
							OPCode <= "1100";
							
						elsif(Func = "101010") then -- SLT Operation
							OPCode <= "0111";
						
						else
							OPCode <= "ZZZZ";
						
						end if;
					else 
							OPCode <= "ZZZZ";
					end if;
        end process;
end architecture behavior;