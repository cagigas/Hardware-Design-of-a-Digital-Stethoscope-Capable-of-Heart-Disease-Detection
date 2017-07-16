LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
	use ieee.numeric_std.all;
  USE work.david.all;
  
ENTITY DataRAM IS
	PORT(
		DATAIN		: IN ausculation1024;
		CLOCK_50	: IN STD_LOGIC;
		addRAM		: OUT integer range 0 to 1023;
		DATAOUT		: OUT STD_LOGIC_VECTOR (255 DOWNTO 0)
	);
END DataRAM;

ARCHITECTURE behavior OF DataRAM IS
	signal data:	std_logic_vector(7 downto 0);
	signal Dataoutg:std_logic_vector(255 downto 0);
	
	begin
	
	process(CLOCK_50)
		begin
			if ((CLOCK_50'event and CLOCK_50 = '1')) then
			
				Horizontal: for j in 0 to 1023 LOOP
					Dataoug <= (others => '0');
					Dataoug(DATAIN(j)) <= '1';
					addRAM <= j;
					DATAOUT <= Dataoutg;
				end loop Horizontal;
					
					
					
			end if;
	 
	end process;
	
	
end behavior;--