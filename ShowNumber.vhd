LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY ShowNumber IS
	PORT(	CLOCK_50 			: IN STD_LOGIC;
			CONT_H, CONT_V		: IN INTEGER;
			DATAIN				: IN INTEGER RANGE 0 TO 9;
			ROJO,VERDE,AZUL		: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END ShowNumber;

ARCHITECTURE behavior OF ShowNumber IS
	signal Position	: INTEGER RANGE 0 to 1023;
	signal Value256	: INTEGER RANGE -127 to 128;

	begin
	Position <= CONT_H - 255;
	Value256 <= CONT_V - 169 - 127;
	
	process(CLOCK_50)
		begin
			if ((CLOCK_50'event and CLOCK_50 = '1')) then
			end if;
	 
	end process;
	
	
end behavior;--