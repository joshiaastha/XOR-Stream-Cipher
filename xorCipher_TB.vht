library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use STD.textio.all;

ENTITY xorCipher_TB is
END xorCipher_TB;

architecture Behavioral of xorCipher_TB is

COMPONENT xorCipher
    port (
		clk: in  std_logic;
        din: in bit_vector(7 downto 0);
        key: out bit_vector(7 downto 0);
        eout: out bit_vector(7 downto 0);
        dout: out bit_vector(7 downto 0)
    );
END COMPONENT;

SIGNAL clk: std_logic := '1';
SIGNAL din: bit_vector(7 downto 0);
SIGNAL key: bit_vector(7 downto 0);
SIGNAL eout: bit_vector(7 downto 0);
SIGNAL dout: bit_vector(7 downto 0);
SIGNAL tempOut: character;
SIGNAL decOut: character;
constant clk_period : time := 20 ns;

begin
u1: xorCipher port map(
	clk => clk, 
	din => din, 
	key => key,
	eout => eout,
	dout => dout
	);

clk_process: process 
begin 
	clk <= '1'; wait for clk_period/2; 
	clk <= '0'; wait for clk_period/2; 	
end process;

EncDec: process

      variable element: string(1 to 256);
      -- line number declaration
      variable rline : line;
      variable wline : line;
      variable dline : line;
      variable kline : line;
      -- file pointer
      file read_file : text;
      file write_file : text;
      file decrypt_file : text;
      file key_file : text;
    begin

      file_open(read_file, "E:\CryptoCoprocessor\message.txt", read_mode);
      file_open(write_file, "E:\CryptoCoprocessor\CipherText.txt", write_mode);
      file_open(decrypt_file, "E:\CryptoCoprocessor\DecryptedText.txt", write_mode);
      file_open(key_file, "E:\CryptoCoprocessor\RandomKey.txt", write_mode);
      
      while not endfile(read_file) loop
      
        readline(read_file, rline);   -- Reading a line of input file
        -- Writing to RandomKey.txt file
        write(kline, STRING'("Random Key:- "));
		writeline(key_file, kline);		
        -- Writing to CipherText.txt file
        write(wline, STRING'("Cipher Text:- "));
		writeline(write_file, wline);
		-- Writing to DecryptedText.txt file
		write(dline, STRING'("Decrypted Text:- "));
		writeline(decrypt_file, dline);
		-- Looping through each character of the file
        for i in 1 to rline'LENGTH+1 loop
			-- Read the contents of the line from  the file into variable rline.
			read(rline, element(i));
			
			case element(i) is
				when ' ' => din <= "00100010";
				when '!' => din <= "00100011";
				--when '\"' => din <= "00100100";
				when '#' => din <= "00100101";
				when '$' => din <= "00100110";
				--when '%' => din <= "00100111";
				when '&' => din <= "00101000";
				when ',' => din <= "00101100";
				when '.' => din <= "00101110";
				when '0' => din <= "00110000";
				when '1' => din <= "00110001";
				when '2' => din <= "00110010";
				when '3' => din <= "00110011";
				when '4' => din <= "00110100";
				when '5' => din <= "00110101";
				when '6' => din <= "00110110";
				when '7' => din <= "00110111";
				when '8' => din <= "00111000";
				when '9' => din <= "00111001";
				when '?' => din <= "00111111";
				when '@' => din <= "01000000";
				when 'A' => din <= "01000001"; 
				when 'B' => din <= "01000010";
				when 'C' => din <= "01000011";
				when 'D' => din <= "01000100";
				when 'E' => din <= "01000101";
				when 'F' => din <= "01000110";
				when 'G' => din <= "01000111";
				when 'H' => din <= "01001000";
				when 'I' => din <= "01001001";
				when 'J' => din <= "01001010";
				when 'K' => din <= "01001011";
				when 'L' => din <= "01001100";
				when 'M' => din <= "01001101";
				when 'N' => din <= "01001110";
				when 'O' => din <= "01001111";
				when 'P' => din <= "01010000";
				when 'Q' => din <= "01010001";
				when 'R' => din <= "01010010";
				when 'S' => din <= "01010011"; 
				when 'T' => din <= "01010100"; 
				when 'U' => din <= "01010101";
				when 'V' => din <= "01010110";
				when 'W' => din <= "01010111";
				when 'X' => din <= "01011000";
				when 'Y' => din <= "01011001";
				when 'Z' => din <= "01011010";
				when '[' => din <= "01011011";
				when '\' => din <= "01011100";
				when ']' => din <= "01011101";
				when '^' => din <= "01011110";
				when '_' => din <= "01011111";
				when '`' => din <= "01100000";
				when 'a' => din <= "01100001";
				when 'b' => din <= "01100010";
				when 'c' => din <= "01100011";
				when 'd' => din <= "01100100";
				when 'e' => din <= "01100101";
				when 'f' => din <= "01100110";
				when 'g' => din <= "01100111";
				when 'h' => din <= "01101000";
				when 'i' => din <= "01101001";
				when 'j' => din <= "01101010";
				when 'k' => din <= "01101011";
				when 'l' => din <= "01101100";
				when 'm' => din <= "01101101";
				when 'n' => din <= "01101110";
				when 'o' => din <= "01101111";
				when 'p' => din <= "01110000";
				when 'q' => din <= "01110001";
				when 'r' => din <= "01110010";
				when 's' => din <= "01110011";
				when 't' => din <= "01110100";
				when 'u' => din <= "01110101";
				when 'v' => din <= "01110110";
				when 'w' => din <= "01110111";
				when 'x' => din <= "01111000";
				when 'y' => din <= "01111001";
				when 'z' => din <= "01111010";
				when others => din <= "00000000";
			
			END case;
		
			wait for 20 ns;
			-- Cases for Encryption
			case eout is
				when "00000000" => tempOut <= '~';
				when "00100010" => tempOut <= ' ';
				when "00100011" => tempOut <= '!';
				when "00100101" => tempOut <= '#';
				when "00100110" => tempOut <= '$';
				when "00101000" => tempOut <= '&';
				when "00101100" => tempOut <= ',';
				when "00101110" => tempOut <= '.';
				when "00110000" => tempOut <= '0';
				when "00110001" => tempOut <= '1';
				when "00110010" => tempOut <= '2';
				when "00110011" => tempOut <= '3';
				when "00110100" => tempOut <= '4';
				when "00110101" => tempOut <= '5';
				when "00110110" => tempOut <= '6';
				when "00110111" => tempOut <= '7';
				when "00111000" => tempOut <= '8';
				when "00111001" => tempOut <= '9';
				when "00111111" => tempOut <= '?';
				when "01000000" => tempOut <= '@';
				when "01000001" => tempOut <= 'A';
				when "01000010" => tempOut <= 'B';
				when "01000011" => tempOut <= 'C';
				when "01000100" => tempOut <= 'D';
				when "01000101" => tempOut <= 'E';
				when "01000110" => tempOut <= 'F';
				when "01000111" => tempOut <= 'G';
				when "01001000" => tempOut <= 'H';
				when "01001001" => tempOut <= 'I';
				when "01001010" => tempOut <= 'J';
				when "01001011" => tempOut <= 'K';
				when "01001100" => tempOut <= 'L';
				when "01001101" => tempOut <= 'M';
				when "01001110" => tempOut <= 'N';
				when "01001111" => tempOut <= 'O';
				when "01010000" => tempOut <= 'P';
				when "01010001" => tempOut <= 'Q';
				when "01010010" => tempOut <= 'R';
				when "01010011" => tempOut <= 'S';
				when "01010100" => tempOut <= 'T';
				when "01010101" => tempOut <= 'U';
				when "01010110" => tempOut <= 'V';
				when "01010111" => tempOut <= 'W';
				when "01011000" => tempOut <= 'X';
				when "01011001" => tempOut <= 'Y';
				when "01011010" => tempOut <= 'Z';
				when "01011011" => tempOut <= '[';
				when "01011100" => tempOut <= '\';
				when "01011101" => tempOut <= ']';
				when "01011110" => tempOut <= '^';
				when "01011111" => tempOut <= '_';
				when "01100000" => tempOut <= '`';
				when "01100001" => tempOut <= 'a';
				when "01100010" => tempOut <= 'b';
				when "01100011" => tempOut <= 'c';
				when "01100100" => tempOut <= 'd';
				when "01100101" => tempOut <= 'e';
				when "01100110" => tempOut <= 'f';
				when "01100111" => tempOut <= 'g';
				when "01101000" => tempOut <= 'h';
				when "01101001" => tempOut <= 'i';
				when "01101010" => tempOut <= 'j';
				when "01101011" => tempOut <= 'k';
				when "01101100" => tempOut <= 'l';
				when "01101101" => tempOut <= 'm';
				when "01101110" => tempOut <= 'n';
				when "01101111" => tempOut <= 'o';
				when "01110000" => tempOut <= 'p';
				when "01110001" => tempOut <= 'q';
				when "01110010" => tempOut <= 'r';
				when "01110011" => tempOut <= 's';
				when "01110100" => tempOut <= 't';
				when "01110101" => tempOut <= 'u';
				when "01110110" => tempOut <= 'v';
				when "01110111" => tempOut <= 'w';
				when "01111000" => tempOut <= 'x';
				when "01111001" => tempOut <= 'y';
				when "01111010" => tempOut <= 'z';
				when others => tempOut <= '*';
			END case;
			
			-- Writing Cipher Text & Random key to the file
			if (tempOut /= '~') then
				write(wline, tempOut, right, 10);
				writeline(write_file, wline);
				write(kline, key);
				writeline(key_file, kline);
			end if;
			-- Cases for Decryption
			case dout is
				when "00000000" => decOut <= '~';
				when "00100010" => decOut <= ' ';
				when "00100011" => decOut <= '!';
				when "00100101" => decOut <= '#';
				when "00100110" => decOut <= '$';
				when "00101000" => decOut <= '&';
				when "00101100" => decOut <= ',';
				when "00101110" => decOut <= '.';
				when "00110000" => decOut <= '0';
				when "00110001" => decOut <= '1';
				when "00110010" => decOut <= '2';
				when "00110011" => decOut <= '3';
				when "00110100" => decOut <= '4';
				when "00110101" => decOut <= '5';
				when "00110110" => decOut <= '6';
				when "00110111" => decOut <= '7';
				when "00111000" => decOut <= '8';
				when "00111001" => decOut <= '9';
				when "00111111" => decOut <= '?';
				when "01000000" => decOut <= '@';
				when "01000001" => decOut <= 'A';
				when "01000010" => decOut <= 'B';
				when "01000011" => decOut <= 'C';
				when "01000100" => decOut <= 'D';
				when "01000101" => decOut <= 'E';
				when "01000110" => decOut <= 'F';
				when "01000111" => decOut <= 'G';
				when "01001000" => decOut <= 'H';
				when "01001001" => decOut <= 'I';
				when "01001010" => decOut <= 'J';
				when "01001011" => decOut <= 'K';
				when "01001100" => decOut <= 'L';
				when "01001101" => decOut <= 'M';
				when "01001110" => decOut <= 'N';
				when "01001111" => decOut <= 'O';
				when "01010000" => decOut <= 'P';
				when "01010001" => decOut <= 'Q';
				when "01010010" => decOut <= 'R';
				when "01010011" => decOut <= 'S';
				when "01010100" => decOut <= 'T';
				when "01010101" => decOut <= 'U';
				when "01010110" => decOut <= 'V';
				when "01010111" => decOut <= 'W';
				when "01011000" => decOut <= 'X';
				when "01011001" => decOut <= 'Y';
				when "01011010" => decOut <= 'Z';
				when "01011011" => decOut <= '[';
				when "01011100" => decOut <= '\';
				when "01011101" => decOut <= ']';
				when "01011110" => decOut <= '^';
				when "01011111" => decOut <= '_';
				when "01100000" => decOut <= '`';
				when "01100001" => decOut <= 'a';
				when "01100010" => decOut <= 'b';
				when "01100011" => decOut <= 'c';
				when "01100100" => decOut <= 'd';
				when "01100101" => decOut <= 'e';
				when "01100110" => decOut <= 'f';
				when "01100111" => decOut <= 'g';
				when "01101000" => decOut <= 'h';
				when "01101001" => decOut <= 'i';
				when "01101010" => decOut <= 'j';
				when "01101011" => decOut <= 'k';
				when "01101100" => decOut <= 'l';
				when "01101101" => decOut <= 'm';
				when "01101110" => decOut <= 'n';
				when "01101111" => decOut <= 'o';
				when "01110000" => decOut <= 'p';
				when "01110001" => decOut <= 'q';
				when "01110010" => decOut <= 'r';
				when "01110011" => decOut <= 's';
				when "01110100" => decOut <= 't';
				when "01110101" => decOut <= 'u';
				when "01110110" => decOut <= 'v';
				when "01110111" => decOut <= 'w';
				when "01111000" => decOut <= 'x';
				when "01111001" => decOut <= 'y';
				when "01111010" => decOut <= 'z';
				when others => decOut <= '*';
			END case;
			
			-- Writing Decrypted Text to the file
			if (decOut /= '~') then
				write(dline, decOut, right, 10);
				writeline(decrypt_file, dline);
			end if;
        END loop;
      END loop;
      
      -- Closing all the opened files
      file_close(read_file);
      file_close(write_file);
      file_close(decrypt_file);
      file_close(key_file);     
      wait;
    END process;
    
ASSERT false report "Read and write operation Successful.";
	
END Behavioral;