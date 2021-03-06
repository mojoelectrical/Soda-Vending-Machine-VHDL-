library  IEEE;
use  IEEE.std_logic_1164.all;
entity sequence_decoder is
port(
  clk:   in std_Logic;
--  rst: in std_Logic;
  d_in:  in std_Logic;
  d_out: out std_Logic);
end sequence_decoder;

--A 0101 sequence detector
--Mealy machine implementation
--INPUT x;
--OUTPUT z;
--s0:if x then s0 else s1;
--s1:if not x then s1 else s2;
--s2:if x then s0 else s1;
--s3:if x then s2 (z) else s1;

architecture behavior of state_machine is
type StateType is (s0, s1, s2, s3);
signal present_state, next_state: StateType;
begin
  if (clk’event and clk='1') then
	  case present_state is
		 when s0 =>
			d_out <= '0';
			if (d_in = '1') then
			  next_state <= s0;
			else
			  next_state <= s1;
			end if;
			
		 when s1 => 
			d_out <= '0';
			if (d_in = '1') then
			  next_state <= s2;
			else
			  next_state <= s1;
			end if;
			
		 when s2 => 
			d_out <= '0';
			if (d_in = '1') then
			  next_state <= s0;
			else
			  next_state <= s3;
			end if;
			
		 when s3 =>
			if (d_in = '1') then
			  d_out <= '1';
			  next_state <= s2;
			else
			  d_out <= '0';
			  next_state <= s0;
			end if;
	  end case;
    present_state <= next_state;
  end if;
--  end process;
end behavior;