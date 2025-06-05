LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU3 IS
PORT (Clock :in std_logic; --input clock signal
		A,B :in unsigned (7 downto 0); -- 8 bit inputs from latches A and B
		student_id : in unsigned (3 downto 0); --4 bit student id from fsm
		OP: in unsigned (15 downto 0); --16 bit selector for Operation from Decorder
		R: out unsigned (3 downto 0)); 
end ALU3;
architecture calculation of ALU3 is --temporary signal declrations
signal Reg1, Reg2: unsigned(7 downto 0):=(others=> '0'); 
signal Result : unsigned(3 downto 0):=(others=> '0');
signal Reg4 : unsigned (0 to 7);
begin 
Reg1<=A; --temporarily store A in Reg1 local vairable
Reg2<=B; --temporarily store B in Reg2 local variable 
process (Clock,OP)
begin	
	if (rising_edge(Clock)) THEN --Do the calculation @positive edge of clock
	case OP is
		WHEN "0000000000000001" =>
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
		WHEN "0000000000000010" =>  
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
		WHEN "0000000000000100"=>
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
		WHEN "0000000000001000"=> 
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
		WHEN "0000000000010000"=>
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
		WHEN "0000000000100000" => 
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
		WHEN "0000000001000000"=>
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
		WHEN "0000000010000000"=>
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
		WHEN "0000000100000000" =>
			if (student_id>Reg1(7 downto 4) or student_id>Reg1(3 downto 0)) then
				Result<="0001";
			else 
				Result<="0000";
			end if;
			
		WHEN OTHERS =>
			--Dont care, do nothing
end case;
end if;
end process;
R<=Result;
end calculation;