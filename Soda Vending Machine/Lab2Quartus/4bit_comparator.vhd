--4-Bit Comparator

entity bit4_comp is
  port (A0,A1,A2,A3,B0,B1,B2,B3,Cip1,Dip1: in bit;
    	  AgtB,AltB,AeqB: out bit);
end bit4_comp;

architecture structure_view of bit4_comp is
  component bit_comp
    port(Ai,Bi,Cip1,Dip1: in bit;
    	   Ci,Di: out bit);
  end component;

  component nor_gate
    port(I1,I2: in bit; 
	      O: out bit);
  end component;

  signal x0,y0,x1,y1,x2,y2,x3,y3: bit;

begin
  BC0:  bit_comp   port map (A0,B0,Cip1,Dip1,x0,y0);
  BC1:  bit_comp   port map (A1,B1,x0,y0,x1,y1);
  BC2:  bit_comp   port map (A2,B2,x1,y1,x2,y2);
  BC3:  bit_comp   port map (A3,B3,x2,y2,x3,y3);
  AgtB <= x3;
  AltB <= y3;
  NR:   nor_gate   port map (x3,y3,AeqB);
  
end structure_view;