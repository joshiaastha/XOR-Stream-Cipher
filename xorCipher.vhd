library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity xorCipher is
    port (
		clk: in std_logic;
        din: in bit_vector(7 downto 0);
        key: out bit_vector(7 downto 0);
        eout: out bit_vector(7 downto 0);
        dout: out bit_vector(7 downto 0)
    );
end xorCipher;

architecture RTL of xorCipher is

SIGNAL temp: bit_vector(7 downto 0);
SIGNAL rand_key: bit_vector(7 downto 0):= "00100110";
SIGNAL feedback : bit;

begin
feedback <= not(rand_key(7) xor rand_key(6));

keyGen: process(clk)
begin
	if (rising_edge(clk)) then
		rand_key <= rand_key(6 downto 0) & feedback;
	end if;	
end process;

key <= rand_key;

encDec: process(din, temp, rand_key)
begin
	eout <= din xor rand_key;
	temp <= din xor rand_key;
	dout <= temp xor rand_key;

end process;

end RTL;