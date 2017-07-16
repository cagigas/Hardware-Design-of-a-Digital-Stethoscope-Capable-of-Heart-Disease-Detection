 LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY Frequency IS
	GENERIC( 	VERTICAL				: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				CONT_H, CONT_V		: IN INTEGER;
				NUMBER				: IN INTEGER;
				ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END Frequency;

ARCHITECTURE behavior OF Frequency IS
	signal X	: INTEGER RANGE 0 to 199;
	signal Y	: INTEGER RANGE 0 to 99;
	signal RedFr, GreenFr, BlueFr	: STD_LOGIC_VECTOR(7 downto 0);
	signal N, N1, N2, N3	:INTEGER;
	signal V2,H2				: NATURAL;


	COMPONENT PrintFrec IS
		GENERIC( VERTICAL				: NATURAL;
					HORIZONTAL			: NATURAL
		);
		PORT(		CLOCK_108M 			: IN STD_LOGIC;
					CONT_H, CONT_V		: IN INTEGER;
					NUMBER				: IN INTEGER;
					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0);
					V2,H2					: IN NATURAL
		);
	END COMPONENT;

	begin

	PFR: PrintFrec GENERIC MAP (VERTICAL ,HORIZONTAL)PORT MAP (CLOCK_108M,CONT_H, CONT_V, N, RedFr, GreenFr, BlueFr,V2,H2);
	X <= CONT_H - HORIZONTAL;
	Y <= CONT_V - VERTICAL;
	
	N1 <= NUMBER/100;
	N2 <= NUMBER/10-N1*10;
	N3 <= NUMBER - N2*10 - N1*100;
	
	process(CLOCK_108M)

		begin
			if ((CLOCK_108M'event and CLOCK_108M = '1')) then
				if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
						
--				elsif (((X-103)*(X-103)+(Y-103)*(Y-103) >= 10000 ) and ((X-103)*(X-103)+(Y-103)*(Y-103) <= 11000 )) then 
--						ROJO  <= (others => '1');
--						VERDE <= (others => '1');
--						AZUL  <= (others => '1');

				elsif((X > 49) and (X < 80))then 
					N <= N1;
					V2<=40;
					H2<=60;

					if((Y > 39) and (Y < 100))then
						ROJO <= RedFr;
						VERDE <= GreenFr;
						AZUL <= BlueFr;
					else
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
					
				elsif((X > 89) and (X < 110))then 
					N <= N2;
					V2<=40;
					H2<=90;
					if((Y > 39) and (Y < 100))then
						ROJO <= RedFr;
						VERDE <= GreenFr;
						AZUL <= BlueFr;
					else
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
					
				elsif((X > 119) and (X < 140))then 
					N <= N3;
					V2<=40;
					H2<=120;
					if((Y > 39) and (Y < 100))then
						ROJO <= RedFr;
						VERDE <= GreenFr;
						AZUL <= BlueFr;
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

			end if;
							
	end process;
	
end behavior;--