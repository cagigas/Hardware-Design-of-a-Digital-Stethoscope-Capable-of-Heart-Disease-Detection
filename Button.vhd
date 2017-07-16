 LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY Button IS
	GENERIC( 	VERTICAL				: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				CONT_H, CONT_V		: IN INTEGER;
				ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END Button;

ARCHITECTURE behavior OF Button IS
	signal X	: INTEGER RANGE 0 to 39;
	signal Y	: INTEGER RANGE 0 to 39;


--	COMPONENT PrintFrec IS
--		GENERIC( VERTICAL				: NATURAL;
--					HORIZONTAL			: NATURAL
--		);
--		PORT(		CLOCK_108M 			: IN STD_LOGIC;
--					CONT_H, CONT_V		: IN INTEGER;
--					NUMBER				: IN INTEGER;
--					ROJO,VERDE,AZUL	: OUT STD_LOGIC_VECTOR(7 downto 0);
--					V2,H2					: IN NATURAL
--		);
--	END COMPONENT;

	begin

--	PFR: PrintFrec GENERIC MAP (VERTICAL ,HORIZONTAL)PORT MAP (CLOCK_108M,CONT_H, CONT_V, N, RedFr, GreenFr, BlueFr,V2,H2);
	X <= CONT_H - HORIZONTAL;
	Y <= CONT_V - VERTICAL;
	
--	N1 <= NUMBER/100;
--	N2 <= NUMBER/10-N1*10;
--	N3 <= NUMBER - N2*10 - N1*100;
	
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

				elsif X = 0 or X = 1 or X = 39 or X = 38 then 
					ROJO  <= (others => '1');
					VERDE <= (others => '1');
					AZUL  <= (others => '1');
					
				elsif X > 1 and X < 48 then 
					
					if Y = 0 or Y = 1 or Y = 39 or Y = 38 then
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
					elsif (X-20)*(X-20) + (Y-20)*(Y-20) < 196 then
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

			end if;
							
	end process;
	
end behavior;--