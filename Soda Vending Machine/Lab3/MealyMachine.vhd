library ieee;
use ieee.std_logic_1164.all ;
entity state_machine is
port(reset,clk,input:in bit;
					output: out bit);
end state_machine;

architecture state_machine of state_machine is 
type Statetype is (S0,S1,S2,S3);
signal state, next_state: Statetype;
begin 
state_comb: process (state,input) begin
case state is
	when S0 => 
		if input = '0' then 
		next_state <= S1;
		output <= '0';
		else
		next_state <= S0;
		output <= '0';
		end if;
	
	when S1 => 
		if input <= '1' then 
		next_state <= S2 ;
		output <='0';
		else 
		next_state <=S1 ;
		output <= '0';
		end if;
		
	When S2 => 
		if input <='0' then
		next_state <= S3 ;
		output <='0';
		else
		next_state <= S0;
		output <= '0';
		end if;
		
	When S3 =>	
		if input <='1' then
		next_state <= S2;
		output <='1';
		else
		next_state <=S1;
		output <= '0';
		end if;
end case;
end process state_comb;

state_clocked: process
begin
wait until (clk'event and clk='1');
		if reset='1' then
		state <= s0;
		else
		state <= next_state;
end if;
end process state_clocked;
end state_machine; 	
		
		