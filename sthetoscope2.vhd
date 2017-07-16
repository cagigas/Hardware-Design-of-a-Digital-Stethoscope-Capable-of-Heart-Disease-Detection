LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
  USE ieee.std_logic_arith.all;
  USE work.david.all;
  
ENTITY sthetoscope2 IS
		PORT(	CLOCK_50			: IN STD_LOGIC;
				datoS				: IN ausculation1024;
				wadd				: OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
				data2				: OUT std_logic_vector(255 downto 0)
		);
END sthetoscope2;


ARCHITECTURE behavior OF sthetoscope2 IS
--	signal datoSS: ausculation1000;
	signal data:	std_logic_vector(255 downto 0);
--	signal dato : datas;
	signal a: integer RANGE 0 TO 255;
	signal cont: integer range 0 to 1023:=0; 
	begin
	
--	datoS<=datoSS;
	
	process(CLOCK_50)
		
		begin

			if ((CLOCK_50'event and CLOCK_50 = '1')) then
				
				if cont < 1024 then
					data <= (others=>'0');
					a <= datoS(cont)+127;
					data(a)<='1';
					data2<=data;
					wadd<= conv_std_logic_vector(cont,10);
					cont <= cont + 1;
				else
					cont <= 0;
					
				end if;


			end if;
		
	end process;
	
	
end behavior;--