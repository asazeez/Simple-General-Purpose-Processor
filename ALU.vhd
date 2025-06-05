LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU IS
PORT (Clock :in std_logic; --input clock signal
		A,B :in unsigned (7 downto 0); -- 8 bit inputs from latches A and B
		student_id : in unsigned (3 downto 0); --4 bit student id from fsm
		OP: in unsigned (15 downto 0); --16 bit selector for Operation from Decorder
		Neg: out std_logic; --is the result negative? se -ve bit output
		R1 : out unsigned(3 downto 0); --lower 4 bits of 8 bit result output
		R2 : out unsigned(3 downto 0)); --higher 4 bits of 8 bi result output
end ALU;
architecture calculation of ALU is --temporary signal declrations
signal Reg1, Reg2, Result : unsigned(7 downto 0):=(others=> '0');
signal Reg4 : unsigned (0 to 7);
begin 
Reg1<=A; --temporarily store A in Reg1 local vairable
Reg2<=B; --temporarily store B in Reg2 local variable 
process (Clock,OP)
begin	
	if (rising_edge(Clock)) THEN --Do the calculation @positive edge of clock
	case OP is
		WHEN "0000000000000001" =>
			--Do addition for Reg1 and Reg2
			Result<=(Reg1)+(Reg2);
		WHEN "0000000000000010" => --Do subtraction,Neg bit set if required
			Result<=Reg1 + (NOT Reg2)+1;
			if (Reg1>Reg2) then
				neg<= '0';
			end if;
			if (Reg1<Reg2) then
				neg<= '1';
			end if;	
		WHEN "0000000000000100"=> -- Inverse of A
			Result <= NOT Reg1;
			neg<='0';
		WHEN "0000000000001000"=>--Do Boolean NAND
			Result<= Reg1 NAND Reg2;
		WHEN "0000000000010000"=>--Do Boolean NOR
			Result<= Reg1 NOR Reg2;
		WHEN "0000000000100000" => --Do Boolean AND
			Result<= Reg1 AND Reg2;
		WHEN "0000000001000000"=>--DO Boolean XOR
			Result<= Reg1 XOR Reg2;
		WHEN "0000000010000000"=>--Do boolean OR
			Result<= Reg1 OR Reg2;
		WHEN "0000000100000000" =>--Do boolean XNOR
			Result<= Reg1 XNOR Reg2;
		WHEN OTHERS =>
			--Dont care, do nothing
end case;
end if;
end process;
R1 <= Result (3 downto 0);
R2 <= Result (7 downto 4);
end calculation;