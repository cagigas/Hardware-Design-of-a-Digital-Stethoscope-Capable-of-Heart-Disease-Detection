LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
  USE ieee.std_logic_arith.all;
  USE work.david.all;
  
ENTITY Fir4 IS
	PORT(	CLOCK 				: IN STD_LOGIC;
			DATAIN				: IN INTEGER RANGE -127 to 128;
			DATAOUT				: OUT INTEGER RANGE -127 to 128
	);
END Fir4;

ARCHITECTURE behavior OF Fir4 IS
	type filtro IS ARRAY (3 DOWNTO 0) OF integer RANGE -127 TO 128;
	signal tap: filtro;
	begin

	process(CLOCK)
		begin
		if ((CLOCK'event and CLOCK = '1')) then
			tap(0) <= DATAIN;
			for i in 3 downto 1 loop
				tap(i) <= tap(i-1);
			end loop;
			DATAOUT <= tap(0)/4+tap(1)/4+tap(2)/4+tap(3)/4;
		end if;
	end process;
	
end behavior;