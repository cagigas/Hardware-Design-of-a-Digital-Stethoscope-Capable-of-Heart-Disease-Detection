LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY PrintName IS
	GENERIC( 	VERTICAL				: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				CONT_H, CONT_V		: IN INTEGER;
				NUMBER				: IN INTEGER;
				ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END PrintName;

ARCHITECTURE behavior OF PrintName IS
	signal X	: INTEGER RANGE 0 to 200;
	signal Y	: INTEGER RANGE 0 to 14;
	begin
	
	X <= CONT_H - HORIZONTAL;
	Y <= CONT_V - VERTICAL;
	
	process(CLOCK_108M)
		begin
			if ((CLOCK_108M'event and CLOCK_108M = '1')) then
				if (NUMBER >= 0 and NUMBER < 4) then -- AUSCULTACION AORTICA
					if X > 1 and X < 11 then -- A
						if X = 3 or X = 10 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 or Y = 7 then
								if X > 3 then 
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
					elsif X > 11 and X < 20 then -- U
						if X = 12 or X = 19 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 20 and X < 29 then -- S
						if X = 21 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 28 then
							if Y > 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if Y = 0 or Y = 14 or Y = 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 29 and X < 38 then -- C
						if X = 30 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 38 and X < 47 then -- U
						if X = 39 or X = 46 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 47 and X < 56 then -- L
						if X = 48 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 56 and X < 65 then -- T
						if X = 60 then
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

					elsif X > 65 and X < 74 then -- A
						if X = 66 or X = 73 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 7 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 74 and X < 83 then -- C
						if X = 75 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 83 and X < 92 then -- I
						if X = 87 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 or Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 92 and X < 101 then -- O
						if X = 93 or X = 100 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 101 and X < 110 then -- N
						if X = 102 or X = 109 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 103 and Y = 1) or (X = 104 and Y = 2) or (X = 105 and Y = 3) or (X = 106 and Y = 4) or  (X = 107 and Y = 5) or (X = 108 and Y = 6) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;


					elsif X > 119 and X < 128 then -- A
						if X = 120 or X = 127 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 7 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;


					elsif X > 128 and X < 137 then -- P
						if X = 129 or X = 136 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 137 and X < 146 then -- R
						if X = 138 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 145 then
							if Y > 7 or Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if Y = 0 or Y = 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 146 and X < 155 then -- T
						if X = 150 then
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

					elsif X > 155 and X < 164 then -- I
						if X = 159 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 or Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 164 and X < 173 then -- C
						if X = 165 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 173 and X < 182 then -- A
						if X = 174 or X = 181 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 7 or Y = 0 then
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
				elsif (NUMBER > 3) then -- AUSCULTACION APEX
					if X > 1 and X < 11 then -- A
						if X = 3 or X = 10 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 or Y = 7 then
								if X > 3 then 
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
					elsif X > 11 and X < 20 then -- U
						if X = 12 or X = 19 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 20 and X < 29 then -- S
						if X = 21 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 28 then
							if Y > 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						else
							if Y = 0 or Y = 14 or Y = 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 29 and X < 38 then -- C
						if X = 30 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 38 and X < 47 then -- U
						if X = 39 or X = 46 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 47 and X < 56 then -- L
						if X = 48 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 56 and X < 65 then -- T
						if X = 60 then
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

					elsif X > 65 and X < 74 then -- A
						if X = 66 or X = 73 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 7 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 74 and X < 83 then -- C
						if X = 75 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 83 and X < 92 then -- I
						if X = 87 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 or Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 92 and X < 101 then -- O
						if X = 93 or X = 100 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 101 and X < 110 then -- N
						if X = 102 or X = 109 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 103 and Y = 1) or (X = 104 and Y = 2) or (X = 105 and Y = 3) or (X = 106 and Y = 4) or  (X = 107 and Y = 5) or (X = 108 and Y = 6) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;


					elsif X > 119 and X < 128 then -- A
						if X = 120 or X = 127 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 7 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;


					elsif X > 128 and X < 137 then -- P
						if X = 129  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 136 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;

						else
							if Y = 0 or Y = 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 137 and X < 146 then -- E
						if X = 138 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 0 or Y = 7 or Y = 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 146 and X < 155 then -- X
						if ((X = 147 or X = 154) and (Y = 0 or Y = 1 or Y = 14 or Y = 13)) or ((X = 148 or X = 153) and (Y = 2 or Y = 3 or Y = 12 or Y = 11)) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif ((X = 149 or X = 152) and (Y = 4 or Y = 5 or Y = 10 or Y = 9)) or ((X = 150 or X = 151) and (Y = 6 or Y = 7 or Y = 8 )) then
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