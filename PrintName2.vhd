LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY PrintName2 IS
	GENERIC( 	VERTICAL				: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				CONT_H, CONT_V		: IN INTEGER;
				NUMBER				: IN INTEGER;
				ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END PrintName2;

ARCHITECTURE behavior OF PrintName2 IS
	signal X	: INTEGER RANGE 0 to 490;
	signal Y	: INTEGER RANGE 0 to 14;
	begin
	
	X <= CONT_H - HORIZONTAL;
	Y <= CONT_V - VERTICAL;
	
	process(CLOCK_108M)
		begin
			if ((CLOCK_108M'event and CLOCK_108M = '1')) then
				if (NUMBER = 0 or NUMBER = 5) then -- NORMAL
					if X > 191 and X < 200 then -- N
						if X = 192 or X = 199 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 193 and Y = 1) or (X = 194 and Y = 2) or (X = 195 and Y = 3) or (X = 196 and Y = 4) or  (X = 197 and Y = 5) or (X = 198 and Y = 6) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;

					elsif X > 200 and X < 209 then -- O
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- R
						if X = 210 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 217 then
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
					elsif X > 218 and X < 227 then -- M
						if X = 219 or X = 226 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 220 and Y = 1) or (X = 221 and Y = 2) or (X = 222 and Y = 3) or (X = 223 and Y = 3) or  (X = 224 and Y = 2) or (X = 225 and Y = 1) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;


					elsif X > 227 and X < 236 then -- A
						if X = 228 or X = 235 then
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

					elsif X > 236 and X < 245 then -- L
						if X = 237 then
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
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
				
				elsif (NUMBER = 1) then --  SOPLO DIASTOLICO
					if X > 191 and X < 200 then -- S
						if X = 192 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 199 then
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

					elsif X > 200 and X < 209 then -- O
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- P
						if X = 210 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 217 then
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

					elsif X > 218 and X < 227 then -- L
						if X = 219 then
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

					elsif X > 227 and X < 236 then -- O
						if X = 228 or X = 235 then
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

					elsif X > 245 and X < 254 then -- D
						if X = 246  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 253  then
							if Y > 0 and Y < 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;

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

					elsif X > 254 and X < 263 then -- I
						if X = 258 then
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

					elsif X > 263 and X < 272 then -- A
						if X = 264 or X = 271 then
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

					elsif X > 272 and X < 281 then -- S
						if X = 273 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 280 then
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

					elsif X > 281 and X < 290 then -- T
						if X = 285 then
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

					elsif X > 290 and X < 299 then -- O
						if X = 291 or X = 298 then
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

					elsif X > 299 and X < 308 then -- L
						if X = 300 then
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

					elsif X > 308 and X < 317 then -- I
						if X = 312 then
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


					elsif X > 317 and X < 326 then -- C
						if X = 318 then
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

					elsif X > 326 and X < 335 then -- O
						if X = 327 or X = 334 then
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

					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;

				elsif (NUMBER = 2) then --  SOPLO SISTOLITICO
					if X > 191 and X < 200 then -- S
						if X = 192 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 199 then
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

					elsif X > 200 and X < 209 then -- O
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- P
						if X = 210 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 217 then
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

					elsif X > 218 and X < 227 then -- L
						if X = 219 then
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

					elsif X > 227 and X < 236 then -- O
						if X = 228 or X = 235 then
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

					elsif X > 245 and X < 254 then -- S
						if X = 246 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 253 then
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

					elsif X > 254 and X < 263 then -- I
						if X = 258 then
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
					elsif X > 263 and X < 272 then -- S
						if X = 264 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 271 then
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

					elsif X > 272 and X < 281 then -- T
						if X = 276 then
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
					elsif X > 281 and X < 290 then -- O
						if X = 282 or X = 289 then
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

					elsif X > 290 and X < 299 then -- L
						if X = 291 then
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

					elsif X > 299 and X < 308 then -- I

						if X = 303 then
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
					elsif X > 308 and X < 317 then -- C
						if X = 309 then
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

					elsif X > 317 and X < 326 then -- O
						if X = 318 or X = 325 then
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

					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;

				elsif (NUMBER = 3) then -- SOPLO SISTOLITICO Y DIASTOLITICO
					if X > 191 and X < 200 then -- S
						if X = 192 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 199 then
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

					elsif X > 200 and X < 209 then -- O
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- P
						if X = 210 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 217 then
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

					elsif X > 218 and X < 227 then -- L
						if X = 219 then
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

					elsif X > 227 and X < 236 then -- O
						if X = 228 or X = 235 then
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

					elsif X > 245 and X < 254 then -- D
						if X = 246  then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 253  then
							if Y > 0 and Y < 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;

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

					elsif X > 254 and X < 263 then -- I
						if X = 258 then
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

					elsif X > 263 and X < 272 then -- A
						if X = 264 or X = 271 then
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

					elsif X > 272 and X < 281 then -- S
						if X = 273 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 280 then
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

					elsif X > 281 and X < 290 then -- T
						if X = 285 then
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

					elsif X > 290 and X < 299 then -- O
						if X = 291 or X = 298 then
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

					elsif X > 299 and X < 308 then -- L
						if X = 300  then
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

					elsif X > 308 and X < 317 then -- I
						if X = 312 then
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

					elsif X > 317 and X < 326 then -- C
						if X = 318 then
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

					elsif X > 326 and X < 335 then -- O
						if X = 327 or X = 334 then
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
						
					elsif X > 344 and X < 353 then -- Y
						if X = 348  then
							if Y > 2 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif (X = 345 and Y = 0) or (X = 346 and Y = 1) or (X = 347 and Y = 2) or(X = 349 and Y = 2) or (X = 350 and Y = 1) or (X = 351 and Y = 0) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;

					
					elsif X > 362 and X < 371 then -- S
						if X = 363 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 370 then
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

					elsif X > 371 and X < 380 then -- I
						if X = 375 then
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
					elsif X > 380 and X < 389 then -- S
						if X = 381 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 388 then
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

					elsif X > 389 and X < 398 then -- T
						if X = 393 then
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
					elsif X > 398 and X < 407 then -- O
						if X = 399 or X = 406 then
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

					elsif X > 407 and X < 416 then -- L
						if X = 408 then
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

					elsif X > 416 and X < 425 then -- I

						if X = 420 then
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
					elsif X > 425 and X < 436 then -- C
						if X = 426 then
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

					elsif X > 436 and X < 445 then -- O
						if X = 437 or X = 444 then
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
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
				elsif (NUMBER = 4) then --  SOPLO SISTOLITICO
					if X > 191 and X < 200 then -- S
						if X = 192 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 199 then
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

					elsif X > 200 and X < 209 then -- O
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- P
						if X = 210 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 217 then
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

					elsif X > 218 and X < 227 then -- L
						if X = 219 then
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

					elsif X > 227 and X < 236 then -- O
						if X = 228 or X = 235 then
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
					elsif X > 245 and X < 254 then -- H
						if X = 246 or X = 253 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');	
						else
							if Y = 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 254 and X < 263 then -- O
						if X = 255 or X = 262 then
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
					elsif X > 263 and X < 272 then -- L
						if X = 264 then
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
					elsif X > 272 and X < 281 then -- O
						if X = 273 or X = 280 then
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

					elsif X > 281 and X < 290 then -- S
						if X = 282 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 289 then
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

					elsif X > 290 and X < 299 then -- I
						if X = 294 then
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
					elsif X > 299 and X < 308 then -- S
						if X = 300 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 307 then
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

					elsif X > 308 and X < 317 then -- T
						if X = 312 then
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
					elsif X > 317 and X < 326 then -- O
						if X = 318 or X = 325 then
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

					elsif X > 326 and X < 335 then -- L
						if X = 327 then
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

					elsif X > 335 and X < 344 then -- I

						if X = 339 then
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
					elsif X > 344 and X < 353 then -- C
						if X = 345 then
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

					elsif X > 353 and X < 362 then -- O
						if X = 354 or X = 361 then
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

					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
				elsif (NUMBER = 6) then --  SOPLO SISTOLICO MEDIO
					if X > 191 and X < 200 then -- S
						if X = 192 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 199 then
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

					elsif X > 200 and X < 209 then -- O
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- P
						if X = 210 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 217 then
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

					elsif X > 218 and X < 227 then -- L
						if X = 219 then
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

					elsif X > 227 and X < 236 then -- O
						if X = 228 or X = 235 then
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

					elsif X > 245 and X < 254 then -- S
						if X = 246 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 253 then
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

					elsif X > 254 and X < 263 then -- I
						if X = 258 then
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
					elsif X > 263 and X < 272 then -- S
						if X = 264 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 271 then
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

					elsif X > 272 and X < 281 then -- T
						if X = 276 then
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
					elsif X > 281 and X < 290 then -- O
						if X = 282 or X = 289 then
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

					elsif X > 290 and X < 299 then -- L
						if X = 291 then
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

					elsif X > 299 and X < 308 then -- I

						if X = 303 then
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
					elsif X > 308 and X < 317 then -- C
						if X = 309 then
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

					elsif X > 317 and X < 326 then -- O
						if X = 318 or X = 325 then
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
					elsif X > 335 and X < 344 then -- M
						if X = 336 or X = 343 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 337 and Y = 1) or (X = 337 and Y = 2) or (X = 339 and Y = 3) or (X = 340 and Y = 3) or  (X = 341 and Y = 2) or (X = 342 and Y = 1) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 344 and X < 353 then -- E
						if X = 345 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 14 or Y = 7 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 353 and X < 362 then -- D
						if X = 354 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 361 then
							if Y < 14 and Y > 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
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
					elsif X > 362 and X < 371 then -- I

						if X = 366 then
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
					elsif X > 371 and X < 380 then -- O
						if X = 372 or X = 379 then
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



					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;

				elsif (NUMBER = 7) then --  SOPLO SISTOLICO TARDIO
					if X > 191 and X < 200 then -- S
						if X = 192 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 199 then
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

					elsif X > 200 and X < 209 then -- O
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- P
						if X = 210 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 217 then
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

					elsif X > 218 and X < 227 then -- L
						if X = 219 then
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

					elsif X > 227 and X < 236 then -- O
						if X = 228 or X = 235 then
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

					elsif X > 245 and X < 254 then -- S
						if X = 246 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 253 then
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

					elsif X > 254 and X < 263 then -- I
						if X = 258 then
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
					elsif X > 263 and X < 272 then -- S
						if X = 264 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 271 then
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

					elsif X > 272 and X < 281 then -- T
						if X = 276 then
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
					elsif X > 281 and X < 290 then -- O
						if X = 282 or X = 289 then
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

					elsif X > 290 and X < 299 then -- L
						if X = 291 then
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

					elsif X > 299 and X < 308 then -- I

						if X = 303 then
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
					elsif X > 308 and X < 317 then -- C
						if X = 309 then
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

					elsif X > 317 and X < 326 then -- O
						if X = 318 or X = 325 then
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
					elsif X > 335 and X < 344 then -- T
						if X = 339 then
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
					elsif X > 344 and X < 353 then -- A
						if X = 345 or X = 352 then
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
					elsif X > 353 and X < 362 then -- R
						if X = 354 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 361 then
							if Y < 7 or Y > 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
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
					elsif X > 362 and X < 371 then -- D
						if X = 363 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 370 then
							if Y < 14 and Y > 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
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

					elsif X > 371 and X < 380 then -- I

						if X = 375 then
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
					elsif X > 380 and X < 389 then -- O
						if X = 381 or X = 388 then
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

					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;

				elsif (NUMBER = 8) then --  SOPLO SISTOLICO TEMPRANO
					if X > 191 and X < 200 then -- S
						if X = 192 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 199 then
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

					elsif X > 200 and X < 209 then -- O
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- P
						if X = 210 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 217 then
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

					elsif X > 218 and X < 227 then -- L
						if X = 219 then
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

					elsif X > 227 and X < 236 then -- O
						if X = 228 or X = 235 then
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

					elsif X > 245 and X < 254 then -- S
						if X = 246 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 253 then
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

					elsif X > 254 and X < 263 then -- I
						if X = 258 then
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
					elsif X > 263 and X < 272 then -- S
						if X = 264 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 271 then
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

					elsif X > 272 and X < 281 then -- T
						if X = 276 then
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
					elsif X > 281 and X < 290 then -- O
						if X = 282 or X = 289 then
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

					elsif X > 290 and X < 299 then -- L
						if X = 291 then
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

					elsif X > 299 and X < 308 then -- I

						if X = 303 then
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
					elsif X > 308 and X < 317 then -- C
						if X = 309 then
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

					elsif X > 317 and X < 326 then -- O
						if X = 318 or X = 325 then
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
					elsif X > 335 and X < 344 then -- T
						if X = 339 then
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
					elsif X > 344 and X < 353 then -- E
						if X = 345 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if Y = 7 or Y = 14 or Y = 0 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 353 and X < 362 then -- M
						if X = 354 or X = 361 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 355 and Y = 1) or (X = 356 and Y = 2) or (X = 357 and Y = 3) or (X = 358 and Y = 3) or  (X = 359 and Y = 2) or (X = 360 and Y = 1) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 362 and X < 371 then -- P
						if X = 363 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						elsif X = 370 then
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

					elsif X > 371 and X < 380 then -- R
						if X = 372 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');	
						elsif X = 379 then
							if Y < 7 or Y > 7 then
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
						
					elsif X > 380 and X < 389 then -- A
						if X = 381 or X = 388 then
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
						
					elsif X > 389 and X < 398 then -- N
						if X = 390 or X = 397 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
						else
							if (X = 391 and Y = 1) or (X = 392 and Y = 2) or (X = 393 and Y = 3) or (X = 394 and Y = 4) or  (X = 395 and Y = 5) or (X = 396 and Y = 6) then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						end if;
					elsif X > 398 and X < 407 then -- O
						if X = 399 or X = 406 then
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
					else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
					
					
				elsif (NUMBER = 9) then --  DUCTO
					if X > 191 and X < 200 then -- D
						if X = 192 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');	
						elsif X = 199 then
							if Y > 0 and Y < 14 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
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

					elsif X > 200 and X < 209 then -- U
						if X = 201 or X = 208 then
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

					elsif X > 209 and X < 218 then -- C
						if X = 210 then
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

					elsif X > 218 and X < 227 then -- T
						if X = 222 then
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

					elsif X > 227 and X < 236 then -- O
						if X = 228 or X = 235 then
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

					elsif X > 245 and X < 254 then -- A
						if X = 246 or X = 253 then
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

					elsif X > 254 and X < 263 then -- R
						if X = 255 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');	
						elsif X = 262 then
							if Y < 7 or Y > 7 then
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

					elsif X > 263 and X < 272 then -- T
						if X = 267 then
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

					elsif X > 272 and X < 281 then -- E
						if X = 273 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');
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

					elsif X > 281 and X < 290 then -- R
						if X = 282 then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');	
						elsif X = 289 then
							if Y < 7 or Y > 7 then
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

					elsif X > 290 and X < 299 then -- I
						if X = 294 then
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

					elsif X > 299 and X < 308 then -- O
						if X = 300 or X = 307 then
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

					elsif X > 308 and X < 317 then -- S
						if X = 309 then
							if Y < 7 then
								ROJO  <= (others => '1');
								VERDE <= (others => '1');
								AZUL  <= (others => '1');
							else
								ROJO  <= (others => '0');
								VERDE <= (others => '0');
								AZUL  <= (others => '0');
							end if;
						elsif X = 316 then
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


					elsif X > 317 and X < 326 then -- O
						if X = 318 or X = 325 then
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