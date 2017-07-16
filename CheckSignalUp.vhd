LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY CheckSignalUp IS
	GENERIC( VERTICAL			: NATURAL;
				HORIZONTAL			: NATURAL
	);
	PORT(		CLOCK_108M 			: IN STD_LOGIC;
				CONT_H, CONT_V		: IN INTEGER;
				DATAIN				: IN ausculation1000;
				ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END CheckSignalUp;

ARCHITECTURE behavior OF CheckSignalUp IS
	signal Position	: INTEGER RANGE 0 to 999;
	signal Value256	: INTEGER RANGE -127 to 128;

	begin
	
	process(CLOCK_108M)
		begin
			if ((CLOCK_108M'event and CLOCK_108M = '1')) then
				Position <= CONT_H - HORIZONTAL;
				Value256 <= CONT_V - VERTICAL - 127;
				if ((CONT_V > VERTICAL-1) and (CONT_V < VERTICAL + 256))then 
					if ((CONT_H > HORIZONTAL-1) and (CONT_H < HORIZONTAL + 1000)) then
						if DATAIN(Position) = Value256 or (Value256 < DATAIN(Position+1) and Value256 > DATAIN(Position)) or (Value256 > DATAIN(Position+1) and Value256 < DATAIN(Position)) then
							ROJO  <= (others => '1');
							VERDE <= (others => '1');
							AZUL  <= (others => '1');								
						else
							ROJO  <= (others => '0');
							VERDE <= (others => '0');
							AZUL  <= (others => '0');
						end if;
					end if;
				end if;
			end if;
	 
	end process;
	
end behavior;--