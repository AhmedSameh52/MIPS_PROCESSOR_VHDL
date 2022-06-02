library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyPackage.ALL;

entity MainModule is
Port(
	START: IN STD_LOGIC;
	CLK: IN STD_LOGIC;
	RegFileOut1: OUT STD_LOGIC_VECTOR(31 downto 0);
	RegFileOut2: OUT STD_LOGIC_VECTOR(31 downto 0);
	ALUOut: OUT STD_LOGIC_VECTOR(31 downto 0);
	PCOut: OUT STD_LOGIC_VECTOR(31 downto 0);
	DataMemOut: OUT STD_LOGIC_VECTOR(31 downto 0));
	

end MainModule;

architecture Behavioral of MainModule is
	
	SIGNAl RegDST,Jump,Branch,MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,Zero,BNE,oFlag,cFlag,BNETemp: STD_LOGIC;
	
	SIGNAL MUXtoWriteReg: STD_LOGIC_VECTOR(4 downto 0);
	
	SIGNAL OPCODE: STD_LOGIC_VECTOR(3 downto 0);
	
	SIGNAL ALUOP: STD_LOGIC_VECTOR(1 downto 0); 
	
	SIGNAL ALUOutTemp,SLLtoAdd,AddOut,AddAddressOut,MUX2MUX,Instruction,ReadData1,
	ReadData2,PCOutSignal,SignExtendTemp,InputALU2,PCIn,ReadDataMem,WriteDataReg,ConcatinateTemp: STD_LOGIC_VECTOR(31 downto 0);
	
	SIGNAL SLLtoMUX: STD_LOGIC_VECTOR(27 downto 0);
	

begin

	ConcatinateTemp <= (AddAddressOut(31 downto 28) & SLLtoMUX);
	
	BNETemp <= ((Branch AND Zero) OR (BNE AND (NOT(ZERO))));
	
	PC: ProgramCounter port map(PCIn,CLK,PCOutSignal);
	
	InstructionMemomry:INSTRMEMORY port map(Instruction,PCOutSignal);
	
	Regs: RegisterFile port map(Instruction(25 downto 21),Instruction(20 downto 16),MUXtoWriteReg,RegWrite,CLK,WriteDataReg,ReadData1,ReadData2);
	
	CTRL: Control port map(Instruction(31 downto 26), RegDST, Jump, Branch, MemRead, MemToReg, ALUOP, MemWrite, ALUSrc, BNE, RegWrite);
	
	signExtend1: SignExtend port map(Instruction(15 downto 0), SignExtendTemp);
	
	ALUControl1: ALUCONTROL port map(ALUOP, Instruction(5 downto 0), OPCODE);
	
	ALU1: ALU port map(ReadData1, InputALU2, OPCODE, '0', ALUOutTemp, cFlag, Zero, oFlag);
	
	dataMemory1: DataMemory port map(START, ReadData2, ReadDataMem, MemRead, MemWrite, ALUOutTemp, CLK);
	
	ADD4: Adder_32_BIT port map(PCOutSignal, X"00000004", AddAddressOut);
	
	sll1: SLL2_26BIT port map(Instruction(25 downto 0), SLLtoMUX);
	
	sll2: SLL_32BIT port map(SignExtendTemp, SLLtoAdd);
	
	add1: Adder_32_BIT port map(AddAddressOut, SLLtoAdd, AddOut);
	
	Mux1: MUX5BITS_2_to_1 port map(Instruction(20 downto 16),Instruction(15 downto 11),MUXtoWriteReg,RegDST);
	
	Mux2: MUX32BITS_2_to_1 port map(ReadData2, SignExtendTemp, InputALU2, ALUSrc);
	
	Mux3: MUX32BITS_2_to_1 port map(ALUOutTemp, ReadDataMem, WriteDataReg, MemToReg);
	
	Mux4: MUX32BITS_2_to_1 port map(AddAddressOut, AddOut, MUX2MUX, BNETemp);
	
	Mux5: MUX32BITS_2_to_1 port map(MUX2MUX, ConcatinateTemp, PCIn, Jump);


	RegFileOut1 <= ReadData1;

	DataMemOut <= ReadDataMem;

	PCOut <= PCOutSignal;

	RegFileOut2 <= ReadData2;

	ALUOut <= ALUOutTemp;








end Behavioral;