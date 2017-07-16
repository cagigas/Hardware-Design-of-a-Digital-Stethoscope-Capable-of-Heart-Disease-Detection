LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
  USE ieee.std_logic_arith.all;
  USE work.david.all;
  
ENTITY Fir16 IS
	PORT(	CLOCK 				: IN STD_LOGIC;
			DATAIN				: IN INTEGER RANGE -127 to 128;
			DATAOUT				: OUT INTEGER RANGE -127 to 128
	);
END Fir16;

ARCHITECTURE behavior OF Fir16 IS
	type filtro IS ARRAY (15 DOWNTO 0) OF integer RANGE -127 TO 128;
	signal tap: filtro;
	begin

	process(CLOCK)
		begin
		if ((CLOCK'event and CLOCK = '1')) then
			tap(0) <= DATAIN;
			for i in 15 downto 1 loop
				tap(i) <= tap(i-1);
			end loop;
			DATAOUT <= tap(0)/16+tap(1)/16+tap(2)/16+tap(3)/16+tap(4)/16+tap(5)/16+tap(6)/16+tap(7)/16+tap(8)/16+tap(9)/16+tap(10)/16+tap(11)/16+tap(12)/16+tap(13)/16+tap(14)/16+tap(15)/16;
		end if;
	end process;
	
end behavior;