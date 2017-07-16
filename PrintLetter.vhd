LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY PrintLetter IS
	GENERIC( 	VERTICAL				: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				CONT_H, CONT_V		: IN INTEGER;
				NUMBER				: IN INTEGER;
				ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END PrintLetter;

ARCHITECTURE behavior OF PrintLetter IS
	signal X	: INTEGER RANGE 0 to 40;
	signal Y	: INTEGER RANGE 0 to 5;
	begin
	
	X <= CONT_H - HORIZONTAL;
	Y <= CONT_V - VERTICAL;
	
	process(CLOCK_108M)
		begin
			if ((CLOCK_108M'event and CLOCK_108M = '1')) then
				if (NUMBER = 1) then -- CAPTURA
					if X > 0 and X < 5 then --C
						if X = 1 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 5 and X < 11 then --A
						if X = 6 or X = 10  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 11 and X < 17 then --P
						if X = 12 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 16 then
							if Y < 4 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if (Y = 0 or Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 17 and X < 23 then --T
						if X = 20 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 23 and X < 29 then --U
						if X = 24 or X = 28  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 5 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 29 and X < 35 then --R
						if X = 30 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 34 then
							if Y < 3 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif Y > 3 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if (Y = 0 or Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 35 and X < 41 then --A
						if X = 36 or X = 39  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
					
				elsif (NUMBER = 2) then -- INICIO
					if X > 2 and X < 8 then --I
						if X = 5 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 or Y = 5  then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 8 and X < 14 then --N
						if X = 9 or X = 13  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 10 and Y = 2) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif(X = 11 and Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif(X = 12 and Y = 4) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 14 and X < 20 then --I
						if X = 17 then
							ROJO  <= (others => '1');
							AZUL  <= (others => '1');
							VERDE <= (others => '1');
						else
							if Y = 0 or Y =5  then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 20 and X < 26 then --C
						if X = 21 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 26 and X < 32 then --I
							if X = 29 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 or Y =5  then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 32 and X < 38 then --O
						if X = 33 or X = 37 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					else 
						AZUL  <= (others => '0');
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
					end if;
				elsif (NUMBER = 3) then -- MODO
					if X > 9 and X < 15 then --M
						if X = 10 or X = 14  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 11 and Y = 2) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif(X = 12 and Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif(X = 13 and Y = 2) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 15 and X < 21 then --O
						if X = 16 or X = 20 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 21 and X < 27 then --D
						if X = 22 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 26 then
							if (Y > 0 and Y < 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if (Y = 0 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 27 and X < 33 then --O
						if X = 28 or X = 32 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					else 
						AZUL  <= (others => '0');
						ROJO  <= (others => '0');
						VERDE <= (others => '0');

					end if;

				elsif (NUMBER = 4) then -- RESET
					if X > 2 and X < 8 then --R
						if X = 3 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 7 then
							if Y < 3 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif Y > 3 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if (Y = 0 or Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 8 and X < 14 then --E
						if X = 9  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 3 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 14 and X < 20 then --S
						if X = 15 then
							if Y < 3 or Y = 5 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;		
						elsif X = 19 then
							if Y > 3 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;

						else
							if Y = 0 or Y = 3 or Y = 5  then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 20 and X < 26 then --E
						if X = 21  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 3 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 26 and X < 32 then --T
						if X = 29 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					else 
						AZUL  <= (others => '0');
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
					end if;
				elsif (NUMBER = 6) then -- -->
					if X > 12 and X < 27 then
						if Y = 2 or Y = 3 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif X = 27 then
						if Y >=0 and Y < 6 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif X = 28 then
						if Y >0 and Y < 5 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif X = 29 then
						if Y > 1 and Y < 4 then
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

				elsif (NUMBER = 7) then -- <--
					if X > 13 and X < 28 then --I
						if Y = 2 or Y = 3 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif X = 13 then
						if Y >=0 and Y < 6 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif X = 12 then
						if Y >0 and Y < 5 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif X = 11 then
						if Y > 1 and Y < 4 then
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
				elsif (NUMBER = 8) then -- MOSTRAR
					if X > 0 and X < 6 then --M
						if X = 1 or X = 5  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 2 and Y = 2) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif(X = 3 and Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif(X = 4 and Y = 2) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 6 and X < 10 then --O
						if X = 7 or X = 9 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 5) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 10 and X < 14 then --S
						if X = 11 then
							if Y < 3 or Y = 5 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;		
						elsif X = 13 then
							if Y > 3 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;

						else
							if Y = 0 or Y = 3 or Y = 5  then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 14 and X < 18 then --T
						if X = 16 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 18 and X < 24 then --R
						if X = 19 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 23 then
							if Y < 3 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif Y > 3 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if (Y = 0 or Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 24 and X < 30 then --A
						if X = 25 or X = 29  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (Y = 0 or Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 30 and X < 36 then --R
						if X = 31 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 35 then
							if Y < 3 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							elsif Y > 3 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if (Y = 0 or Y = 3) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					else 
					AZUL  <= (others => '0');
					ROJO  <= (others => '0');
					VERDE <= (others => '0');

					end if;

				end if;
			end if;
			
	end process;
	
end behavior;--