LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
  USE ieee.std_logic_arith.all;
  USE work.david.all;
  
ENTITY Fir32 IS
	PORT(	CLOCK 				: IN STD_LOGIC;
			DATAIN				: IN INTEGER RANGE -127 to 128;
			DATAOUT				: OUT INTEGER RANGE -127 to 128
	);
END Fir32;

ARCHITECTURE behavior OF Fir32 IS
	type filtro IS ARRAY (31 DOWNTO 0) OF integer RANGE -127 TO 128;
	signal tap: filtro;
	begin

	process(CLOCK)
		begin
		if ((CLOCK'event and CLOCK = '1')) then
			tap(0) <= DATAIN;
			for i in 31 downto 1 loop
				tap(i) <= tap(i-1);
			end loop;
			DATAOUT <= tap(0)/32+tap(1)/32+tap(2)/32+tap(3)/32+tap(4)/32+tap(5)/32+tap(6)/32+tap(7)/32+tap(8)/32+tap(9)/32+tap(10)/32+tap(11)/32+tap(12)/32+tap(13)/32+tap(14)/32+tap(15)/32+tap(16)/32+tap(17)/32+tap(18)/32+tap(19)/32+tap(20)/32+tap(21)/32+tap(22)/32+tap(23)/32+tap(24)/32+tap(25)/32+tap(26)/32+tap(27)/32+tap(28)/32+tap(29)/32+tap(30)/32+tap(31)/32;
		end if;
	end process;
	
end behavior;