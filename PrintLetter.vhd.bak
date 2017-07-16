LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY PrintFrec IS
	GENERIC( 	VERTICAL				: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				CONT_H, CONT_V		: IN INTEGER;
				NUMBER				: IN INTEGER;
				ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0);
				V2,H2				: IN NATURAL
	);
END PrintFrec;

ARCHITECTURE behavior OF PrintFrec IS
	signal X	: INTEGER RANGE 0 to 19;
	signal Y	: INTEGER RANGE 0 to 49;
	begin
	
	X <= CONT_H - HORIZONTAL - H2;
	Y <= CONT_V - VERTICAL - V2;
	
	process(CLOCK_108M)
		begin
			if ((CLOCK_108M'event and CLOCK_108M = '1')) then
				if (NUMBER = 0) then
					if (Y = 0 or Y = 1 or Y = 2 or Y = 47 or Y = 48 or Y = 49)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 2 and Y < 47) then
						if (X = 3 or X = 1 or X = 2 or X = 17 or X = 18 or X = 16) then
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
					
				elsif (NUMBER = 1) then
					if ((X = 17) or (X = 18) or (X = 16)) then
						if (Y >= 0 and Y < 50) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif ((X + Y = 16) or (X + Y = 18) or (X + Y = 17)) then
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
					
				elsif (NUMBER = 2) then
					if (Y = 0 or Y = 1 or Y = 2 or Y = 47 or Y = 48 or Y = 49 or Y = 24 or Y = 25 or Y = 26)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 2 and Y < 24) then
						if (X = 17 or X = 18 or X = 16) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 26 and Y < 47) then
						if (X = 3 or X = 1 or X = 2) then
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
					
				elsif (NUMBER = 3) then
					if (Y = 0 or Y = 1 or Y = 2 or Y = 47 or Y = 48 or Y = 49 or Y = 24 or Y = 25 or Y = 26)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 2 and Y < 24) then
						if (X = 17 or X = 18 or X = 16) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 26 and Y < 47) then
						if (X = 17 or X = 18 or X = 16) then
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
					
				elsif (NUMBER = 4) then
					if (Y = 24 or Y = 25 or Y = 26)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y >= 0 and Y < 24) then
						if (X = 17 or X = 18 or X = 16 or X = 3 or X = 1 or X = 2) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 26 and Y < 50) then
						if (X = 17 or X = 18 or X = 16) then
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
					
				elsif (NUMBER = 5) then
					if (Y = 0 or Y = 1 or Y = 2 or Y = 47 or Y = 48 or Y = 49 or Y = 24 or Y = 25 or Y = 26)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 2 and Y < 24) then
						if (X = 3 or X = 1 or X = 2) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 26 and Y < 47) then
						if (X = 17 or X = 18 or X = 16) then
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
					
				elsif (NUMBER = 6) then
					if (Y = 0 or Y = 1 or Y = 2 or Y = 47 or Y = 48 or Y = 49 or Y = 24 or Y = 25 or Y = 26)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 2 and Y < 24) then
						if (X = 3 or X = 1 or X = 2) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 26 and Y < 47) then
						if (X = 3 or X = 1 or X = 2 or X = 17 or X = 18 or X = 16) then
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
					
				elsif (NUMBER = 7) then
					if (Y = 0 or Y = 1 or Y = 2)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y >= 0 and Y < 50) then
						if (X = 17 or X = 18 or X = 16) then
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
					
				elsif (NUMBER = 8) then
					if (Y = 0 or Y = 1 or Y = 2 or Y = 47 or Y = 48 or Y = 49 or Y = 24 or Y = 25 or Y = 26)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 2 and Y < 47) then
						if (X = 3 or X = 1 or X = 2 or X = 17 or X = 18 or X = 16) then
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
				elsif (NUMBER = 9) then
					if (Y = 0 or Y = 1 or Y = 2 or Y = 47 or Y = 48 or Y = 49 or Y = 24 or Y = 25 or Y = 26)then
						if (X > 0 and X < 19)then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 2 and Y < 24) then
						if (X = 3 or X = 1 or X = 2 or X = 17 or X = 18 or X = 16) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					elsif (Y > 26 and Y < 50) then
						if (X = 17 or X = 18 or X = 16) then
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
				
			end if;
			
	end process;
	
end behavior;--