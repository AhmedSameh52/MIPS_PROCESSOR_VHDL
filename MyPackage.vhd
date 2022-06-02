library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MyPackage is

Component MUX32BITS_2_TO_1 is
          port( I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0);
           S : in STD_LOGIC);
end Component;

Component MUX5BITS_2_to_1 is
          port( I1 : in  STD_LOGIC_VECTOR (4 downto 0);
           I2 : in  STD_LOGIC_VECTOR (4 downto 0);
           O : out  STD_LOGIC_VECTOR (4 downto 0);
           S : in STD_LOGIC);
end Component;

Component ALUControl is
    port(
         ALUOperation : in std_logic_vector(1 downto 0);
         Func : in std_logic_vector(5 downto 0);
         OPCode : out std_logic_vector(3 downto 0)
    );
end Component;


Component Control is
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
end Component;

Component SLL2_26BIT is
    Port ( Input : in  STD_LOGIC_VECTOR (25 downto 0);
           Output : out  STD_LOGIC_VECTOR (27 downto 0));
end Component;

Component SLL_32BIT is
        Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
                 Output : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

Component SignExtend is

		port( 
        Input : in std_logic_vector(15 downto 0);
		  Output : out std_logic_vector(31 downto 0)
		  );
		  
end Component;

Component DataMemory is
  Generic(words : natural :=64;wordsize: natural :=32; addresssize: natural := 32);
  port ( LoadIt: in STD_LOGIC;
         INPUT: in STD_LOGIC_VECTOR (wordsize-1 downto 0);
         OUTPUT: out STD_LOGIC_VECTOR (wordsize-1 downto 0);
         MEM_READ: in STD_LOGIC;
         MEM_WRITE: in STD_LOGIC;
         ADDRESS: in STD_LOGIC_VECTOR (addresssize-1 downto 0);
         CLK: in STD_LOGIC
         );

end Component;


Component INSTRMEMORY is
  port(
     Instruction: out STD_LOGIC_VECTOR(31 downto 0);
     InstrAddress: in STD_LOGIC_VECTOR(31 downto 0)
    );
end Component;

Component ALU is
    Port(   data1 : in std_logic_vector(31 downto 0);
            data2 : in std_logic_vector(31 downto 0);
            aluop : in std_logic_vector(3 downto 0);
            cin : in std_logic;
            dataout: out std_logic_vector(31 downto 0);
            cflag: out std_logic;
            zflag: out std_logic;
            oflag: out std_logic);
end Component;

Component Adder_32_BIT is
    port(
        X, Y : in std_logic_vector(31 downto 0);
        SUM : out std_logic_vector(31 downto 0)
      );
end Component;

Component RegisterFile is
port(
 read_sel1 : in std_logic_vector(4 downto 0);
 read_sel2 : in std_logic_vector(4 downto 0);
 write_sel : in std_logic_vector(4 downto 0);
 write_ena : in std_logic;
 clk: in std_logic;
 write_data: in std_logic_vector(31 downto 0);
 data1: out std_logic_vector(31 downto 0);
 data2: out std_logic_vector(31 downto 0));
end Component;

Component ProgramCounter is
		Port ( 
	        PCIN : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           PCOUT : out  STD_LOGIC_VECTOR (31 downto 0));
end Component;

end MyPackage;

package body MyPackage is


end MyPackage;