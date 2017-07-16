LIBRARY ieee;
	USE ieee.std_logic_1164.all;
	USE ieee.std_logic_unsigned.all;
	USE ieee.numeric_std.all;
	USE work.david.all;
  
ENTITY DataBaseSignal IS
	GENERIC(	VERTICAL			: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				KEY					: IN STD_LOGIC_VECTOR(3 downto 0);
				CONT_H, CONT_V,sickness		: IN INTEGER;
				q_a,q_b				: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END DataBaseSignal;

ARCHITECTURE behavior OF DataBaseSignal IS
	signal Value256,ValueReal,ValueRealNext: INTEGER RANGE -127 to 128;
	SIGNAL aux,aux2: integer range 0 to 255 := 0 ;
	signal RedBt1, GreenBt1, BlueBt1	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedBt2, GreenBt2, BlueBt2	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedBt3, GreenBt3, BlueBt3	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedBt4, GreenBt4, BlueBt4	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedLt1, GreenLt1, BlueLt1	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedLt2, GreenLt2, BlueLt2	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedLt3, GreenLt3, BlueLt3	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedLt4, GreenLt4, BlueLt4	: STD_LOGIC_VECTOR(7 downto 0);
	signal word,mode: integer;
	signal RedNmDown, GreenNmDown, BlueNmDown, RedNm2Down, GreenNm2Down, BlueNm2Down	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedMo, GreenMo, BlueMo	: STD_LOGIC_VECTOR(7 downto 0);
	
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

	
--	COMPONENT Frequency IS
--		GENERIC( VERTICAL				: NATURAL;
--					HORIZONTAL			: NATURAL
--		);
--		PORT(		CLOCK_108M 			: IN STD_LOGIC;
--					CONT_H, CONT_V		: IN INTEGER;
--					NUMBER				: IN INTEGER;
--					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
--		);
--	END COMPONENT;
	COMPONENT Button IS
		GENERIC( 	VERTICAL			: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PrintName2 IS
		GENERIC( 	VERTICAL				: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					NUMBER				: IN INTEGER;
					ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;

	COMPONENT PrintName IS
		GENERIC( 	VERTICAL			: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					NUMBER				: IN INTEGER;
					ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;

	
	
	begin
	BT1: Button GENERIC MAP (970,1290)PORT MAP (CLOCK_108M,CONT_H, CONT_V, RedBt1, GreenBt1, BlueBt1);
	BT2: Button GENERIC MAP (970,1335)PORT MAP (CLOCK_108M,CONT_H, CONT_V, RedBt2, GreenBt2, BlueBt2);
	BT3: Button GENERIC MAP (970,1380)PORT MAP (CLOCK_108M,CONT_H, CONT_V, RedBt3, GreenBt3, BlueBt3);
	BT4: Button GENERIC MAP (970,1425)PORT MAP (CLOCK_108M,CONT_H, CONT_V, RedBt4, GreenBt4, BlueBt4);
	LT1: PrintLetter GENERIC MAP (962,1290)PORT MAP (CLOCK_108M,CONT_H, CONT_V, word, RedLt1, GreenLt1, BlueLt1);
	LT2: PrintLetter GENERIC MAP (962,1335)PORT MAP (CLOCK_108M,CONT_H, CONT_V, word, RedLt2, GreenLt2, BlueLt2);
	LT3: PrintLetter GENERIC MAP (962,1380)PORT MAP (CLOCK_108M,CONT_H, CONT_V, word, RedLt3, GreenLt3, BlueLt3);
	LT4: PrintLetter GENERIC MAP (962,1425)PORT MAP (CLOCK_108M,CONT_H, CONT_V, word, RedLt4, GreenLt4, BlueLt4);
	PMO: PrintMode GENERIC MAP (985,317)PORT MAP (CLOCK_108M,CONT_H, CONT_V, mode, RedMo, GreenMo, BlueMo);
	PNM: PrintName GENERIC MAP (621,701)PORT MAP (CLOCK_108M,CONT_H, CONT_V, sickness, RedNmDown, GreenNmDown, BlueNmDown);
	PNM2: PrintName2 GENERIC MAP (641,611)PORT MAP (CLOCK_108M,CONT_H, CONT_V, sickness, RedNm2Down, GreenNm2Down, BlueNm2Down);

	Value256 <= CONT_V - VERTICAL - 127;
	ValueReal <= to_integer(signed(q_a-128));
	ValueRealNext <= to_integer(signed(q_b-128));
			
		process(CLOCK_108M)
			begin
			if ((CLOCK_108M'event and CLOCK_108M = '1')) then
				if ((CONT_V > VERTICAL-1) and (CONT_V < VERTICAL + 256))then --669,926
					if ((CONT_H > HORIZONTAL-1) and (CONT_H < HORIZONTAL + 1000)) then
						if ValueReal = Value256 then --and aux = 0 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif abs(ValueRealNext-ValueReal) > 1 and ((Value256 < ValueRealNext and Value256 > ValueReal) or (Value256 > ValueRealNext and Value256 < ValueReal)) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					else
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');

					end if;
--				elsif((CONT_V > 548) and (CONT_V < 649))then	--Frecuency Down
--					if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
--						ROJO  <= (others => '1');
--						VERDE <= (others => '1');
--						AZUL  <= (others => '1');
--					elsif ((CONT_H > 785) and (CONT_H < 996)) then 
--						ROJO <= RedFrDown;
--						VERDE <= GreenFrDown;
--						AZUL <= BlueFrDown;	
--					else 
--						ROJO  <= (others => '0');
--						VERDE <= (others => '0');
--						AZUL  <= (others => '0');
--					end if;
				elsif((CONT_V > 620) and (CONT_V < 636))then	--Nombre
					if ((CONT_H > 700) and (CONT_H < 900)) then 
						ROJO <= RedNmDown;
						VERDE <= GreenNmDown;
						AZUL <= BlueNmDown;	
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
				elsif((CONT_V > 640) and (CONT_V < 656))then	--Nombre
					if ((CONT_H > 610) and (CONT_H < 1100)) then 
						ROJO <= RedNm2Down;
						VERDE <= GreenNm2Down;
						AZUL <= BlueNm2Down;	
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;

				elsif (CONT_V > 961) and (CONT_V < 968) then	-- Letters
--					if ((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
--						ROJO  <= (others => '1');
--						VERDE <= (others => '1');
--						AZUL  <= (others => '1');
					if ((CONT_H > 1289) and (CONT_H < 1331)) then	-- Button 1
						word <= 6;-- <---
						ROJO <= RedLt1;
						VERDE <= GreenLt1;
						AZUL <= BlueLt1;
					elsif ((CONT_H > 1334) and (CONT_H < 1376)) then	-- Button 2
						word <= 7;-- --->
						ROJO <= RedLt2;
						VERDE <= GreenLt2;
						AZUL <= BlueLt2;
					elsif ((CONT_H > 1379) and (CONT_H < 1421)) then	-- Button 3
						word <= 3;--MODO
						ROJO <= RedLt3;
						VERDE <= GreenLt3;
						AZUL <= BlueLt3;
					elsif ((CONT_H > 1424) and (CONT_H < 1466)) then	-- Button 4
						word <= 4;--RESET
						ROJO <= RedLt4;
						VERDE <= GreenLt4;
						AZUL <= BlueLt4;
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;



				elsif (CONT_V > 969) and (CONT_V < 1010) then	-- Buttons
--					if ((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
--						ROJO  <= (others => '1');
--						VERDE <= (others => '1');
--						AZUL  <= (others => '1');
					if ((CONT_H > 316) and (CONT_H < 500)) then	-- Modo Base Datos
						mode <= 2;
						if (CONT_V > 984) and (CONT_V < 1000) then	-- Buttons
							ROJO <= RedMo;
							VERDE <= GreenMo;
							AZUL <= BlueMo;	
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;

					elsif ((CONT_H > 1289) and (CONT_H < 1331)) then	-- Button 1
						ROJO <= RedBt1;
						VERDE <= GreenBt1;
						AZUL <= BlueBt1;
					elsif ((CONT_H > 1334) and (CONT_H < 1376)) then	-- Button 2
						ROJO <= RedBt2;
						VERDE <= GreenBt2;
						AZUL <= BlueBt2;
					elsif ((CONT_H > 1379) and (CONT_H < 1421)) then	-- Button 3
						ROJO <= RedBt3;
						VERDE <= GreenBt3;
						AZUL <= BlueBt3;
					elsif ((CONT_H > 1424) and (CONT_H < 1466)) then	-- Button 4
						ROJO <= RedBt4;
						VERDE <= GreenBt4;
						AZUL <= BlueBt4;
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;

				end if;
			end if;
	 
	end process;
	
end behavior;--