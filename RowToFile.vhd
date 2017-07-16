LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY RowToFile IS
	PORT(
		DATAIN		: IN ausculation1024;
		CLOCK_50	: IN STD_LOGIC;
		addRAM		: OUT integer range 0 to 255;
		DATAOUT		: OUT STD_LOGIC_VECTOR (1023 DOWNTO 0)
	);
END RowToFile;

ARCHITECTURE behavior OF RowToFile IS
	signal data:	std_logic_vector(7 downto 0);
	signal Dataoutg:std_logic_vector(1023 downto 0);

	begin
	
	process(CLOCK_50)
		begin
			if ((CLOCK_50'event and CLOCK_50 = '1')) then
				
				Vertical: for i in 0 to 255 LOOP
					
					Horizontal: for j in 0 to 1023 LOOP
						
						if DATAIN(j) = i then
							
							Dataoutg(j) <= '1';
								
						end if;				

					end loop Horizontal;
					addRAM <= i;
					DATAOUT <= Dataoutg;
					
				end loop Vertical;
			end if;
	 
	end process;
	
	
end behavior;--