library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bit8_comp is 

Port(
Acu: in std_logic_vector (7 downto 0);		-- The cost of drinks
S: in std_logic_vector (7 downto 0);      -- Output total amount of coins from Accumulator
Cip1,Dip1: in std_logic;
Sgt,Slt,Seq: out std_logic);     -- S greater than, S less than, S equal to
end bit8_comp;

architecture structure_view of bit8_comp is
  component bit_comp
    port(Ai,Bi,Cip1,Dip1: in std_logic;
    	   Ci,Di: out std_logic);
  end component;

  component nor_gate
    port(I1,I2: in std_logic; 
	      O: out std_logic);
  end component;

  signal x0,y0,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7: std_logic;

begin
  BC0:  bit_comp   port map (S(7),Acu(7),Cip1,Dip1,x0,y0);
  BC1:  bit_comp   port map (S(6),Acu(6),x0,y0,x1,y1);
  BC2:  bit_comp   port map (S(5),Acu(5),x1,y1,x2,y2);
  BC3:  bit_comp   port map (S(4),Acu(4),x2,y2,x3,y3);
  BC4:  bit_comp   port map (S(3),Acu(3),x3,y3,x4,y4);
  BC5:  bit_comp   port map (S(2),Acu(2),x4,y4,x5,y5);
  BC6:  bit_comp   port map (S(1),Acu(1),x5,y5,x6,y6);
  BC7:  bit_comp   port map (S(0),Acu(0),x6,y6,x7,y7);
  Sgt <= x7;
  Slt <= y7;
  NR:   nor_gate   port map (x7,y7,Seq);
  
end structure_view;