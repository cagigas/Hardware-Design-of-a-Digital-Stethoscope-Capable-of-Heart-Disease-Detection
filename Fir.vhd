LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
  USE ieee.std_logic_arith.all;
  USE work.david.all;
  
ENTITY Fir8 IS
	PORT(	CLOCK 				: IN STD_LOGIC;
			DATAIN				: IN INTEGER RANGE -127 to 128;
			DATAOUT				: OUT INTEGER RANGE -127 to 128
	);
END Fir8;

ARCHITECTURE behavior OF Fir8 IS
	type filtro IS ARRAY (7 DOWNTO 0) OF integer RANGE -127 TO 128;
	signal tap: filtro;
	begin

	process(CLOCK)
		begin
		if ((CLOCK'event and CLOCK = '1')) then
			tap(0) <= DATAIN;
			for i in 7 downto 1 loop
				data <= tap(i-1)+data;
			end loop;
			DATAOUT <= tap(0)/8+tap(1)/8+tap(2)/8+tap(3)/8+tap(4)/8+tap(5)/8+tap(6)/8+tap(7)/8;
		end if;
	end process;
	
end behavior;