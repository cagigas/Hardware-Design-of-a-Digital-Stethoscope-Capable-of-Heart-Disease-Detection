LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
  USE ieee.std_logic_arith.all;
  USE work.david.all;
  
ENTITY RowToFile IS
		PORT(	datain		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				dataout		: IN STD_LOGIC_VECTOR (1023 DOWNTO 0);
				CLOCK_50	: IN STD_LOGIC
		);
END RowToFile;

ARCHITECTURE behavior OF RowToFile IS
	signal data:	std_logic_vector(255 downto 0);
--	signal dato : datas;
	signal a: integer RANGE 0 TO 255;
	signal cont: integer range 0 to 1023:=0; 
	begin
	
--	datoS<=datoSS;
	
	process(CLOCK_50)
		begin
			if ((CLOCK_50'event and CLOCK_50 = '1')) then
				
				for 


			end if;
		
	end process;
	
	
end behavior;--