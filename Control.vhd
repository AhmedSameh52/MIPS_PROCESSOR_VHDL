
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control is
    Port ( OPField : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
			  BNE : out STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end Control;

architecture Behavioral of Control is

begin

process(OPField)
		begin
		
		if(OPField = "000000") then  --R format
			RegDst <= '1';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= '0';
			ALUOp <= "10";
			MemWrite <= '0';
			ALUSrc <= '0';
			RegWrite <= '1';
			BNE <= '0';
		
		elsif(OPField = "100011") then --load word
			RegDst <= '0';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '1';
			MemtoReg <= '1';
			ALUOp <= "00";
			MemWrite <= '0';
			ALUSrc <= '1';
			RegWrite <= '1';
			BNE <= '0';
		
		elsif(OPField = "101011") then --store word	
			RegDst <= 'X';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= 'X';
			ALUOp <= "00";
			MemWrite <= '1';
			ALUSrc <= '1';
			RegWrite <= '0';
			BNE <= '0';
		
		elsif(OPField = "000100") then --beq
			RegDst <= 'X';
			Jump <= '0';
			Branch <= '1';
			MemRead <= '0';
			MemtoReg <= 'X';
			ALUOp <= "01";
			MemWrite <= '0';
			ALUSrc <= '0';
			RegWrite <= '0';
			BNE <= '0';
		
		elsif(OPField = "000101") then --BNE
			RegDst <= 'X';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= 'X';
			ALUOp <= "01";
			MemWrite <= '0';
			ALUSrc <= '0';
			RegWrite <= '0';
			BNE <= '1';
		
		elsif(OPField = "000010") then --JUMP
			RegDst <= 'X';
			Jump <= '1';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= 'X';
			ALUOp <= "XX";
			MemWrite <= '0';
			ALUSrc <= 'X';
			RegWrite <= '0';
			BNE <= '0';
		
		else 
			RegDst <= 'X';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= 'X';
			ALUOp <= "XX";
			MemWrite <= '0';
			ALUSrc <= 'X';
			RegWrite <= '0';
			BNE <= '0';
		end if;
		end process;

end Behavioral;

