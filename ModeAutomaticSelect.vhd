LIBRARY ieee;
	USE ieee.std_logic_1164.all;
	USE ieee.std_logic_unsigned.all;
	USE ieee.numeric_std.all;
	USE work.david.all;
  
ENTITY	ModeAutomaticSelect IS
	GENERIC(	VERTICAL			: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		SW 									: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				LEDR 											: OUT STD_LOGIC_VECTOR(16 downto 0); 
				LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);     
				CLOCK_108M,CLOCK_1K 			: IN STD_LOGIC;
				KEY					: IN STD_LOGIC_VECTOR(3 downto 0);
				CONT_H, CONT_V		: IN INTEGER;
				DATAIN				: IN integer RANGE -127 TO 128;
				ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END ModeAutomaticSelect;

ARCHITECTURE generador OF ModeAutomaticSelect IS
	TYPE FSMStates IS (state0, state1, state2);--state0: normal, state1:ductoarterioso,state2: sistolico
	SIGNAL state,nxtstate : FSMStates := state0;
	signal MODE: integer range 0 to 9;
	signal ValueReal,ValueRealNext: INTEGER RANGE -127 to 128;
	signal addr_a,addr_b: std_logic_vector(9 downto 0);
	signal q_a, q_b, q_a1,q_b1,q_a2,q_b2,q_a3,q_b3 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal cont, cont1		: INTEGER :=1;
	signal espera, espera1			: std_logic := '0';
	signal MaxIN			: INTEGER RANGE -127 to 128;
	signal Position	: INTEGER RANGE 0 to 999;

	COMPONENT RomSignal2PA1 IS--Signal Simple
		PORT
		(
			address_a		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			address_b		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
	
	COMPONENT ModeAutomatic IS
		GENERIC(	VERTICAL			: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					KEY					: IN STD_LOGIC_VECTOR(3 downto 0);
					MODE2				: IN INTEGER range 0 to 9;
					CONT_H, CONT_V		: IN INTEGER;
					ValueReal,ValueRealNext :INTEGER RANGE -127 to 128;
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RomSignal2PSys IS
		PORT
		(
			address_a		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			address_b		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT RomSignal2PDuctoArterioso IS
		PORT
		(
			address_a		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			address_b		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;

	BEGIN
	
	ROM1: RomSignal2PA1 PORT MAP (addr_a,addr_b,CLOCK_108M,q_a1,q_b1);
	ROM2: RomSignal2PDuctoArterioso PORT MAP (addr_a,addr_b,CLOCK_108M,q_a3,q_b3);
	ROM3: RomSignal2PSys PORT MAP (addr_a,addr_b,CLOCK_108M,q_a2,q_b2);

	MAU	: ModeAutomatic GENERIC MAP (670,391)PORT MAP (CLOCK_108M,KEY,MODE,CONT_H, CONT_V, ValueReal,ValueRealNext, ROJO,VERDE,AZUL);
	
	Position <= CONT_H - HORIZONTAL;
	addr_b <= std_logic_vector(to_unsigned(Position + 1,10));
	addr_a <= std_logic_vector(to_unsigned(Position,10));

	LEDR<=std_logic_vector(to_unsigned(cont1,17));
	ValueReal <= to_integer(signed(q_a-128));
	ValueRealNext <= to_integer(signed(q_b-128));

	PROCESS (CLOCK_108M, KEY(0)) 
		BEGIN
		if CLOCK_108M'event and CLOCK_108M='1' then
			case state is
				when state0 =>
					MODE <= 0;
					q_a <= q_a1;
					q_b <= q_b1;

				when state1 =>
					MODE <= 2;
					q_a <= q_a2;
					q_b <= q_b2;

				when state2 =>
					MODE <= 9;
					q_a <= q_a3;
					q_b <= q_b3;
			end case;
		end if;
	END PROCESS;
	
	PROCESS(CLOCK_108M)
		begin 
		if(KEY(0)='0')then
			state <= state0; 

		elsif KEY(3)= '0' then
			state<=nxtstate;
		end if;
	END PROCESS;

	PROCESS(CLOCK_1K, KEY(2))
		BEGIN  
		if KEY(2)= '0' then
				cont1 <= 1;
				cont <= 1;
				
		elsif (CLOCK_1K'event and CLOCK_1K ='1')then
				
			if cont = 150 then
				if cont1 < 16 then
					nxtstate <= state0;
					cont <= 1;
					cont1 <= 0;
				end if;
				cont <= cont + 1;
				
			elsif cont = 500 then
				if cont1 > 50 then
					nxtstate <= state2;
				else
					nxtstate <= state1;
				end if;
				cont <= cont + 1;
				
			elsif cont > 500 then
				cont1 <= 0;
				cont <= 1;
				
			elsif cont1 = 0 then
				cont <= 1;
				cont1 <= 0;
				
			elsif DATAIN > 20 then
				cont <= cont + 1;	
				cont1 <= cont1 + 1;
				
			elsif cont = 1 then
				cont <= cont + 1;
				
			else
				cont <= cont + 1;
				
			end if;
			
		end if;  
	END PROCESS;

	
end generador;