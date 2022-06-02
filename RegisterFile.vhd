library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Pack1.ALL;

entity RegisterFile is
port(
 read_sel1 : in std_logic_vector(4 downto 0);
 read_sel2 : in std_logic_vector(4 downto 0);
 write_sel : in std_logic_vector(4 downto 0);
 write_ena : in std_logic;
 clk: in std_logic;
 write_data: in std_logic_vector(31 downto 0);
 data1: out std_logic_vector(31 downto 0);
 data2: out std_logic_vector(31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
SIGNAL out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,out17,out18,
 out19,out20,out21,out22,out23,out24,out25,out26,out27,out28,out29,out30,out31,out32: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL L : STD_LOGIC_VECTOR (31 downto 0);
begin
d1 : Decoder1 PORT MAP (write_sel, write_ena , L);


r1 : reg PORT MAP (write_data, clk ,L(0), out1);
r2 : reg PORT MAP (write_data, clk ,L(1), out2);
r3 : reg PORT MAP (write_data, clk ,L(2), out3);
r4 : reg PORT MAP (write_data, clk ,L(3), out4);
r5 : reg PORT MAP (write_data, clk ,L(4), out5);
r6 : reg PORT MAP (write_data, clk ,L(5), out6);
r7 : reg PORT MAP (write_data, clk ,L(6), out7);
r8 : reg PORT MAP (write_data, clk ,L(7), out8);
r9 : reg PORT MAP (write_data, clk ,L(8), out9);
r10 : reg PORT MAP (write_data, clk ,L(9), out10);
r11 : reg PORT MAP (write_data, clk ,L(10), out11);
r12 : reg PORT MAP (write_data, clk ,L(11), out12);
r13 : reg PORT MAP (write_data, clk ,L(12), out13);
r14 : reg PORT MAP (write_data, clk ,L(13), out14);
r15 : reg PORT MAP (write_data, clk ,L(14), out15);
r16 : reg PORT MAP (write_data, clk ,L(15), out16);
r17 : reg PORT MAP (write_data, clk ,L(16), out17);
r18 : reg PORT MAP (write_data, clk ,L(17), out18);
r19 : reg PORT MAP (write_data, clk ,L(18), out19);
r20 : reg PORT MAP (write_data, clk ,L(19), out20);
r21 : reg PORT MAP (write_data, clk ,L(20), out21);
r22 : reg PORT MAP (write_data, clk ,L(21), out22);
r23 : reg PORT MAP (write_data, clk ,L(22), out23);
r24 : reg PORT MAP (write_data, clk ,L(23), out24);
r25 : reg PORT MAP (write_data, clk ,L(24), out25);
r26 : reg PORT MAP (write_data, clk ,L(25), out26);
r27 : reg PORT MAP (write_data, clk ,L(26), out27);
r28 : reg PORT MAP (write_data, clk ,L(27), out28);
r29 : reg PORT MAP (write_data, clk ,L(28), out29);
r30 : reg PORT MAP (write_data, clk ,L(29), out30);
r31 : reg PORT MAP (write_data, clk ,L(30), out31);
r32 : reg PORT MAP (write_data, clk ,L(31), out32);

m1 : Mux32 PORT MAP ("00000000000000000000000000000000",out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,out17,out18,
 out19,out20,out21,out22,out23,out24,out25,out26,out27,out28,out29,out30,out31,out32,data1,read_sel1);

m2 : Mux32 PORT MAP ("00000000000000000000000000000000",out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,out17,out18,
 out19,out20,out21,out22,out23,out24,out25,out26,out27,out28,out29,out30,out31,out32,data2,read_sel2);

end Behavioral;


