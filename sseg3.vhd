LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg3 IS
	PORT (bcd	:IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			leds	:OUT 	STD_LOGIC_VECTOR(0 TO 6));
END sseg3;

ARCHITECTURE Behavior OF sseg3 IS
BEGIN 
	PROCESS (bcd)
	BEGIN 
			CASE bcd IS			 --   abcdefg
				WHEN "0000"	=>leds<="0010101"; --n
				WHEN "0001" =>leds<="0111011"; --y
				WHEN others  =>leds<="-------";
			END CASE;
	END PROCESS;			
END Behavior;