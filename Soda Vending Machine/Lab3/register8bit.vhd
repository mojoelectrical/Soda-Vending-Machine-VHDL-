--synchronous 8-bit register
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity register8bit is
  port(
    clk:    in std_logic;
    reset:  in std_logic;
    regin:  in std_logic_vector(7 downto 0);
    regout: out std_logic_vector(7 downto 0)
  );
end register8bit;

architecture register8bit of register8bit is
begin
  process
  constant zero: std_logic_vector(7 downto 0):="00000000";
  begin
  --synchronous reset
    wait until (rising_edge(clk));
	 
	 if reset = '0' then
	   regout <= zero;
    elsif reset = '1' then
	   regout <= regin;
	 elsif reset = 'X' or clk = 'X' then
	   regout <= (others => 'X');
	 end if;
  end process;
end register8bit;