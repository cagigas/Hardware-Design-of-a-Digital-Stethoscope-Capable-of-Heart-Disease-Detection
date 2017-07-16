LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.ALL;
  USE work.david.all;
  
ENTITY FirBi IS
	PORT(	CLOCK 				: IN STD_LOGIC;
			DATAIN				: IN STD_LOGIC_VECTOR(23 DOWNTO 0);
			DATAOUT				: OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
			NUMBER				: IN INTEGER
	);
END FirBi;

ARCHITECTURE behavior OF FirBi IS
	type filtro IS ARRAY (7 DOWNTO 0) OF STD_LOGIC_VECTOR(23 DOWNTO 0);
	signal tap: filtro;
--	signal data: INTEGER RANGE -127 to 128;
	begin
--
--	process(CLOCK)
--		begin
--		if ((CLOCK'event and CLOCK = '1')) then
--			tap(0) <= DATAIN; -- Input inserted to register, overwrites old value
--		--	data <= 0;
--			for i in NUMBER downto 1 loop
--		--		data <= tap(i-1)+data;
--				tap(i) <= tap(i-1);
--			end loop;
--	--		DATAOUT <= data+tap(NUMBER);
--			DATAOUT <= std_logic_vector(signed(tap(0))/8+signed(tap(1))/8+signed(tap(2))/8+signed(tap(3))/8+signed(tap(4))/8+signed(tap(5))/8+signed(tap(6))/8+signed(tap(7))/8);
--		end if;
--		
--	end process;
	
	process(CLOCK)
		begin
		if ((CLOCK'event and CLOCK = '1')) then
			tap(0) <= DATAIN; -- Input inserted to register, overwrites old value
		--	data <= 0;
			for i in 7 downto 1 loop
		--		data <= tap(i-1)+data;
				tap(i) <= tap(i-1);
			end loop;
	--		DATAOUT <= data+tap(NUMBER);
			DATAOUT <= std_logic_vector(signed(tap(0))/8+signed(tap(1))/8+signed(tap(2))/8+signed(tap(3))/8+signed(tap(4))/8+signed(tap(5))/8+signed(tap(6))/8+signed(tap(7))/8);
		end if;
		
	end process;
end behavior;