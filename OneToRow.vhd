LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
  USE ieee.std_logic_arith.all;
  USE work.david.all;
  
ENTITY OneToRow IS
	PORT(	CLOCK 				: IN STD_LOGIC;
			DATAIN				: IN INTEGER RANGE -127 to 128;
			DATAOUT				: OUT ausculation1000
	);
END OneToRow;

ARCHITECTURE behavior OF OneToRow IS
	signal Data: ausculation1000;
	begin

	DATAOUT <= Data;
	process(CLOCK)
		begin
		
		if ((CLOCK'event and CLOCK = '1')) then
			Data <= Data(998 downto 0)&DATAIN;		
		end if;
		
	end process;
	
end behavior;