LIBRARY ieee;
	USE ieee.std_logic_1164.all;
	USE ieee.std_logic_unsigned.all;
	USE ieee.numeric_std.all;
	USE work.david.all;
  
Entity	ModeCapture IS
	GENERIC(	VERTICAL			: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				KEY					: IN STD_LOGIC_VECTOR(3 downto 0);

				CONT_H, CONT_V		: IN INTEGER;
				DATAIN				: IN ausculation1000;
				ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END ModeCapture;

ARCHITECTURE behavior OF ModeCapture IS
	signal Position	: INTEGER RANGE 0 to 999;
	signal Value256,ValueReal,ValueRealNext: INTEGER RANGE -127 to 128;
	signal DATAIN2: ausculation1000;
	signal RedBt1, GreenBt1, BlueBt1	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedBt2, GreenBt2, BlueBt2	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedBt3, GreenBt3, BlueBt3	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedBt4, GreenBt4, BlueBt4	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedFrDown, GreenFrDown, BlueFrDown	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedLt1, GreenLt1, BlueLt1	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedLt2, GreenLt2, BlueLt2	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedLt3, GreenLt3, BlueLt3	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedLt4, GreenLt4, BlueLt4	: STD_LOGIC_VECTOR(7 downto 0);
	signal word,mode: integer;
	signal RedMo, GreenMo, BlueMo	: STD_LOGIC_VECTOR(7 downto 0);
	signal addr_a,addr_b		: STD_LOGIC_VECTOR (9 DOWNTO 0);
	signal q_a, q_b				: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal data_a, data_b				: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal wren					: STD_LOGIC;
	signal cont,cont1:integer:=0;-- range 0 to 999;
	COMPONENT RAMCapture IS
		PORT
		(
			address_a		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			address_b		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock			: IN STD_LOGIC  := '1';
			data_a			: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			data_b			: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren_a			: IN STD_LOGIC  := '0';
			wren_b			: IN STD_LOGIC  := '0';
			q_a				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT Button IS
		GENERIC( 	VERTICAL			: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PrintLetter IS
		GENERIC( 	VERTICAL				: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					NUMBER				: IN INTEGER;
					ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	COMPONENT PrintMode IS
		GENERIC( 	VERTICAL				: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					NUMBER				: IN INTEGER;
					ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT CaptureSignal IS
		GENERIC(	VERTICAL			: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					KEY					: IN STD_LOGIC_VECTOR(3 downto 0);
					CONT_H, CONT_V		: IN INTEGER;
					q_a,q_b				: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;

	begin
	DBS	: CaptureSignal GENERIC MAP (670,391)PORT MAP (CLOCK_108M, KEY, CONT_H, CONT_V, q_a, q_b, ROJO, VERDE, AZUL);

	BT1: Button GENERIC MAP (970,1290)PORT MAP (CLOCK_108M,CONT_H, CONT_V, RedBt1, GreenBt1, BlueBt1);
	BT2: Button GENERIC MAP (970,1335)PORT MAP (CLOCK_108M,CONT_H, CONT_V, RedBt2, GreenBt2, BlueBt2);
	BT3: Button GENERIC MAP (970,1380)PORT MAP (CLOCK_108M,CONT_H, CONT_V, RedBt3, GreenBt3, BlueBt3);
	BT4: Button GENERIC MAP (970,1425)PORT MAP (CLOCK_108M,CONT_H, CONT_V, RedBt4, GreenBt4, BlueBt4);
--	PFD: Frequency GENERIC MAP (549,786)PORT MAP (CLOCK_108M,CONT_H, CONT_V, 76, RedFrDown, GreenFrDown, BlueFrDown);
	LT1: PrintLetter GENERIC MAP (962,1290)PORT MAP (CLOCK_108M,CONT_H, CONT_V, word, RedLt1, GreenLt1, BlueLt1);
	LT2: PrintLetter GENERIC MAP (962,1335)PORT MAP (CLOCK_108M,CONT_H, CONT_V, word, RedLt2, GreenLt2, BlueLt2);
	LT3: PrintLetter GENERIC MAP (962,1380)PORT MAP (CLOCK_108M,CONT_H, CONT_V, word, RedLt3, GreenLt3, BlueLt3);
	LT4: PrintLetter GENERIC MAP (962,1425)PORT MAP (CLOCK_108M,CONT_H, CONT_V, word, RedLt4, GreenLt4, BlueLt4);
	
	PMO: PrintMode GENERIC MAP (985,317)PORT MAP (CLOCK_108M,CONT_H, CONT_V, mode, RedMo, GreenMo, BlueMo);
	
	
	RAM: RAMCapture PORT MAP (addr_a,addr_b,CLOCK_108M,data_a, data_b, wren,'0', q_a,q_b);

	Position <= CONT_H - HORIZONTAL;

	process(CLOCK_108M)
		begin
		if ((CLOCK_108M'event and CLOCK_108M = '1')) then
			
			if KEY(3)='0' or (cont < 1000 and cont /= 0) then
				wren <= '0';
				data_a <= std_logic_vector(to_unsigned(DATAIN(cont)+127,8));
				addr_a <= std_logic_vector(to_unsigned(cont,10));
				wren <= '1';
				cont <= cont + 1;

			elsif KEY(2)='0' or (cont1 < 1000 and cont1 /= 0) then
				wren <= '0';
				data_a <= std_logic_vector(to_unsigned(127,8));
				addr_a <= std_logic_vector(to_unsigned(cont1,10));
				wren <= '1';
				cont1 <= cont1 + 1;
			else	
				wren <= '0';
				addr_b <= std_logic_vector(to_unsigned(Position + 1,10));
				addr_a <= std_logic_vector(to_unsigned(Position,10));
				cont <= 0;
				cont1<= 0;

			end if;
			
		end if;
	end process;
	
end behavior;--