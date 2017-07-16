library ieee;
	use ieee.std_logic_1164.all;
--  use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_signed.all;
	use ieee.numeric_std.all;
	use work.david.all;
  
ENTITY Picture IS
	PORT(	SW 									: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
							LEDR 											: OUT STD_LOGIC_VECTOR(16 downto 0); 
				LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);     

			CLOCK_50,CLOCK2_50,CLOCK_108M 		: IN STD_LOGIC;
			DATA								: IN STD_LOGIC_VECTOR(23 downto 0);
			KEY									: IN STD_LOGIC_VECTOR(3 downto 0);
			CONT_H, CONT_V						: IN INTEGER;
			ROJO,VERDE,AZUL						: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end Picture;

architecture generador of Picture is
	signal Data8, Data8F, Data8F4, Data8F8, Data8F16, Data8F32		: INTEGER RANGE -127 to 128;
--	signal DInRAM				: STD_LOGIC_VECTOR (1023 DOWNTO 0);
	signal Sick					: ausculation1000;
	
	signal CLOCK_1K,CLOCK_10K			: STD_LOGIC;
	signal RedUp, GreenUp, BlueUp	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedDown, GreenDown, BlueDown	: STD_LOGIC_VECTOR(7 downto 0);
	signal RedFrUp, GreenFrUp, BlueFrUp	: STD_LOGIC_VECTOR(7 downto 0);

--	signal prueba: integer range 0 to 9;
--	signal datoS			: ausculation1000;
--	signal datoini: integer range -127 to 128;
--	signal data2: std_logic_vector(255 downto 0);
--	signal radd: integer range 0 to 255;
--	signal wadd: integer range 0 to 255;
--	signal q: STD_LOGIC_VECTOR (1023 DOWNTO 0);
--	signal a: signed(7 downto 0);
	signal freq,Realfr: integer;


	COMPONENT PLLCLK1 IS
		PORT(
			CLKIN		: IN STD_LOGIC  := '0';
			CLKOUT		: OUT STD_LOGIC 
		);
	end COMPONENT;
	
	
	COMPONENT PLLSound IS
		PORT
		(
			inclk0		: IN STD_LOGIC  := '0';
			c0		: OUT STD_LOGIC 
		);
	END COMPONENT;
	COMPONENT Frequency IS
		GENERIC( VERTICAL				: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					NUMBER				: IN INTEGER;
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;

	COMPONENT CheckSignalDown IS
		GENERIC(	VERTICAL				: NATURAL;
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
	END COMPONENT;
	
	COMPONENT OneToRow IS
		PORT(	CLOCK 				: IN STD_LOGIC;
				DATAIN				: IN INTEGER RANGE -127 to 128;
				DATAOUT				: OUT ausculation1000
		);
	END COMPONENT;
	
	COMPONENT CheckSignalUp IS
		GENERIC( VERTICAL				: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					DATAIN				: IN ausculation1000;
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT FreqCalc IS
	PORT(	CLOCK_1K 	: IN STD_LOGIC;
			DATAIN		: IN INTEGER RANGE -127 to 128;
			Freq		: OUT INTEGER
	);
	end COMPONENT;

	COMPONENT Fir8 IS
		PORT(	CLOCK 				: IN STD_LOGIC;
				DATAIN				: IN INTEGER RANGE -127 to 128;
				DATAOUT				: OUT INTEGER RANGE -127 to 128
			);
	END COMPONENT;
	

	begin
	
	FI8: Fir8 PORT MAP(CLOCK_50,Data8,Data8F8);
	Data8 <= to_integer(((signed(DATA))/(2**16)));
	OTR: OneToRow PORT MAP (CLOCK_1K,Data8F8,Sick);
	FRC: FreqCalc PORT MAP (CLOCK_1K, Data8F8, freq);
	PLL: PLLSound PORT MAP (CLOCK_50,CLOCK_10K);
	PLL1: PLLCLK1 PORT MAP (CLOCK_10K,CLOCK_1K);
	PFU: Frequency GENERIC MAP (46,786)PORT MAP (CLOCK_108M,CONT_H, CONT_V, Realfr, RedFrUp, GreenFrUp, BlueFrUp);
	CSD: CheckSignalDown GENERIC MAP (549,255)PORT MAP (SW,LEDR,LEDG,CLOCK_108M,CLOCK_1K,KEY,CONT_H, CONT_V,Data8F8, Sick, RedDown, GreenDown, BlueDown);
	CSU: CheckSignalUp GENERIC MAP (169,391)PORT MAP (CLOCK_108M,CONT_H, CONT_V, Sick, RedUp, GreenUp, BlueUp);
--	Data8F8 <= Data8;
	Realfr <= 40000/freq;--60000
	
	process(CLOCK_108M,KEY(0))
		begin  
        if(KEY(0)='0')then
			ROJO   <= (others => '0');
			VERDE  <= (others => '0');
			AZUL   <= (others => '0');
			
		elsif (CLOCK_108M'event and CLOCK_108M ='1')then
			
			if ((CONT_V = 35) or (CONT_V = 36) or (CONT_V = 1053) or (CONT_V = 1054) or (CONT_V = 546) or (CONT_V = 547) or (CONT_V = 548)) then
				if((CONT_H > 252) and (CONT_H < 1529)) then
					ROJO  <= (others => '1');
					VERDE <= (others => '1');
					AZUL  <= (others => '1');
				else 
					ROJO  <= (others => '0');
					VERDE <= (others => '0');
					AZUL  <= (others => '0');
				end if;
				
			elsif((CONT_V > 45) and (CONT_V < 146))then	--Frecuency Up
				if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
				elsif ((CONT_H > 785) and (CONT_H < 996)) then 
						ROJO <= RedFrUp;
						VERDE <= GreenFrUp;
						AZUL <= BlueFrUp;
				else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
				end if;
				
			elsif ((CONT_V > 168) and (CONT_V < 425))then --Up Windows
				
				if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
				elsif ((CONT_H > 390) and (CONT_H < 1391)) then 
						ROJO <= RedUp;
						VERDE <= GreenUp;
						AZUL <= BlueUp;
				else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
				end if;
			elsif ((CONT_V > 548) and (CONT_V < 1053))then --Down Windows
				  
				if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528))then
					ROJO  <= (others => '1');
					VERDE <= (others => '1');
					AZUL  <= (others => '1');
				elsif ((CONT_H > 254) and (CONT_H < 1527)) then
					ROJO  <= RedDown;
					VERDE <= GreenDown;
					AZUL  <= BlueDown;
				else 
					ROJO  <= (others => '0');
					VERDE <= (others => '0');
					AZUL  <= (others => '0');
				end if;
				
			elsif ((CONT_V > 36) and (CONT_V < 1053))then
				if ((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
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
 		end if; --CLK,RESET  
	end process;
end generador;