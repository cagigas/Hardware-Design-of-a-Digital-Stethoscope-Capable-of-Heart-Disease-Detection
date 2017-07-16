LIBRARY ieee;
	USE ieee.std_logic_1164.all;
	USE ieee.std_logic_unsigned.all;
	USE ieee.numeric_std.all;
	USE work.david.all;
  
ENTITY CheckSignalDown IS
	GENERIC(	VERTICAL			: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		SW 									: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				LEDR 											: OUT STD_LOGIC_VECTOR(16 downto 0); 
				LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);     
				CLOCK_108M,CLOCK_1K 			: IN STD_LOGIC;
				KEY					: IN STD_LOGIC_VECTOR(3 downto 0);
				CONT_H, CONT_V		: IN INTEGER;
				DATAIN1				: IN INTEGER RANGE -127 to 128;
				DATAIN				: IN ausculation1000;
				ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END CheckSignalDown;

ARCHITECTURE behavior OF CheckSignalDown IS
	TYPE FSMStates IS (ModeCA, ModeDB, ModeAU);
	SIGNAL state : FSMStates := ModeCA;
	SIGNAL KEY1: STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL RedMCA, GreenMCA, BlueMCA	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL RedMDB, GreenMDB, BlueMDB	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL RedMAU, GreenMAU, BlueMAU	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL DATA : ausculation1000;
	
	COMPONENT Sync is
		port(  	A:	in std_logic;--_vector(3 downto 0);
				CLK:	in std_logic;
				Q:	out std_logic);--_vector(3 downto 0));
	END COMPONENT;

	COMPONENT ModeDataBase IS
		GENERIC(	VERTICAL			: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					KEY					: IN STD_LOGIC_VECTOR(3 downto 0);
					CONT_H, CONT_V		: IN INTEGER;
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ModeCapture IS
		GENERIC(	VERTICAL			: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					KEY					: IN STD_LOGIC_VECTOR(3 downto 0);
					CONT_H, CONT_V		: IN INTEGER;
					DATAIN				: IN ausculation1000;
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ModeAutomaticSelect IS
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
					ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;

	BEGIN
   DATA <= DATAIN;
	MDB	: ModeDataBase GENERIC MAP (670,391)PORT MAP (CLOCK_108M,KEY1, CONT_H, CONT_V, RedMDB, GreenMDB, BlueMDB);
	MCA	: ModeCapture GENERIC MAP (670,391)PORT MAP (CLOCK_108M,KEY1,CONT_H, CONT_V, DATA, RedMCA, GreenMCA, BlueMCA);
	MAU	: ModeAutomaticSelect GENERIC MAP (670,391)PORT MAP (SW,LEDR,LEDG,CLOCK_108M,CLOCK_1K,KEY1,CONT_H, CONT_V, DATAIN1, RedMAU, GreenMAU, BlueMAU);

	SY1 : Sync PORT MAP(KEY(0),CLOCK_108M,KEY1(0));
	SY2 : Sync PORT MAP(KEY(1),CLOCK_108M,KEY1(1));
	SY3 : Sync PORT MAP(KEY(2),CLOCK_108M,KEY1(2));
	SY4 : Sync PORT MAP(KEY(3),CLOCK_108M,KEY1(3));

	PROCESS (CLOCK_108M, KEY1(0)) 
		BEGIN
        if(KEY1(0)='0')then
			ROJO   <= (others => '0');
			VERDE  <= (others => '0');
			AZUL   <= (others => '0');
			state <= ModeCA; 
		elsif CLOCK_108M'event and CLOCK_108M='1' then

			case state is
				when ModeCA =>
					ROJO <= RedMCA;
					VERDE <= GreenMCA;
					AZUL <= BlueMCA;
					if (KEY1(1) = '0') then
						state <= ModeDB;
					else 
						state <= ModeCA;
					end if;
					
				when ModeDB =>
					ROJO <= RedMDB;
					VERDE <= GreenMDB;
					AZUL <= BlueMDB;
					if (KEY1(1)='0') then
						state <= ModeAU;
					else
						state <= ModeDB;
					end if;
					
				when ModeAU=>
					ROJO <= RedMAU;
					VERDE <= GreenMAU;
					AZUL <= BlueMAU;
					if (KEY1(1)='0') then
						state <= ModeCA;
					else
						state <= ModeAU;
					end if;

			end case;
		end if;
	END PROCESS;
	
end behavior;