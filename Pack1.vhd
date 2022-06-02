library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Pack1 is
component Decoder1 is
    Port ( Input : in  STD_LOGIC_VECTOR (4 downto 0);
           E : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux32 is
    Port ( I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           I3 : in  STD_LOGIC_VECTOR (31 downto 0);
           I4 : in  STD_LOGIC_VECTOR (31 downto 0);
           I5 : in  STD_LOGIC_VECTOR (31 downto 0);
           I6 : in  STD_LOGIC_VECTOR (31 downto 0);
           I7 : in  STD_LOGIC_VECTOR (31 downto 0);
           I8 : in  STD_LOGIC_VECTOR (31 downto 0);
           I9 : in  STD_LOGIC_VECTOR (31 downto 0);
           I10 : in  STD_LOGIC_VECTOR (31 downto 0);
           I11 : in  STD_LOGIC_VECTOR (31 downto 0);
           I12 : in  STD_LOGIC_VECTOR (31 downto 0);
           I13 : in  STD_LOGIC_VECTOR (31 downto 0);
           I14 : in  STD_LOGIC_VECTOR (31 downto 0);
           I15 : in  STD_LOGIC_VECTOR (31 downto 0);
           I16 : in  STD_LOGIC_VECTOR (31 downto 0);
           I17 : in  STD_LOGIC_VECTOR (31 downto 0);
           I18 : in  STD_LOGIC_VECTOR (31 downto 0);
           I19 : in  STD_LOGIC_VECTOR (31 downto 0);
           I20 : in  STD_LOGIC_VECTOR (31 downto 0);
           I21 : in  STD_LOGIC_VECTOR (31 downto 0);
           I22 : in  STD_LOGIC_VECTOR (31 downto 0);
           I23 : in  STD_LOGIC_VECTOR (31 downto 0);
			  I24 : in  STD_LOGIC_VECTOR (31 downto 0);
           I25 : in  STD_LOGIC_VECTOR (31 downto 0);
           I26 : in  STD_LOGIC_VECTOR (31 downto 0);
           I27 : in  STD_LOGIC_VECTOR (31 downto 0);
           I28 : in  STD_LOGIC_VECTOR (31 downto 0);
           I29 : in  STD_LOGIC_VECTOR (31 downto 0);
           I30 : in  STD_LOGIC_VECTOR (31 downto 0);
           I31 : in  STD_LOGIC_VECTOR (31 downto 0);
           I32 : in  STD_LOGIC_VECTOR (31 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0);
              S : in STD_LOGIC_VECTOR(4 downto 0));
end component;

component reg is
    Port ( I : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           load : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

end Pack1;

package body Pack1 is


 
end Pack1;
