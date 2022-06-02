library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;

entity ALU is
	Port(	data1 : in std_logic_vector(31 downto 0);
			data2 : in std_logic_vector(31 downto 0);
			aluop : in std_logic_vector(3 downto 0);
			cin : in std_logic;
			dataout: out std_logic_vector(31 downto 0);
			cflag: out std_logic;
			zflag: out std_logic;
			oflag: out std_logic);
end ALU;

architecture Behavioral of ALU is
											-- temps to act as buffers as we cannot make out signal on the right handside
	SIGNAL tempAdd : STD_LOGIC_VECTOR (32 downto 0);
	SIGNAL tempSub : STD_LOGIC_VECTOR (32 downto 0);
	SIGNAL tempDataOut : STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL tempSLT : STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL tempSLTAnswer : STD_LOGIC_VECTOR (31 downto 0);
begin
											-- Adding and Subtracting operations
	tempAdd <= (data1(31) & data1) + (data2(31) & data2);
	tempSub <= (data1(31) & data1) - (data2(31) & data2);
										
											-- Store the value of minus operation in tempSLT
	tempSLT<= std_logic_vector(signed(data1)- signed(data2));									
										
											--Store 1 if the value of the minus operation is negative 
	tempSLTAnswer <= "00000000000000000000000000000001" when (std_logic(tempSLT(31)) = '1') ELSE
						  "00000000000000000000000000000000";									
																				
										   -- ALU operations 
	tempDataOut <= (data1 AND data2) when aluop = "0000" ELSE
						(data1 OR data2) when aluop = "0001" ELSE
						tempAdd(31 downto 0) when aluop = "0010" ELSE
						tempSub(31 downto 0) when aluop = "0110" ELSE
						(data1 NOR data2) when aluop = "1100" ELSE
						tempSLTAnswer when aluop = "0111" ELSE
						(Others => 'Z');
						
							-- Zero flag checks if result is all zero
	zflag <= '1' when tempDataOut = x"00000000" ELSE '0';
		
							-- carry flag checks if there is any carry
	cflag <= tempAdd(32) when aluop = "0010" ELSE
				tempSub(32) when aluop = "0110" ELSE
				'Z';
						  
						  -- overflow flag checks if the number exceeds 32 bits
	oflag <= (tempAdd(32) XOR tempAdd(31)) when aluop = "0010" ELSE
				(tempSub(32) XOR tempSub(31)) when aluop = "0110" ELSE
				'Z';
				
	dataout <= tempDataOut;

end Behavioral;

