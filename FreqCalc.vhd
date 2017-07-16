library ieee;
	use ieee.std_logic_1164.all;
--  use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_signed.all;
	use ieee.numeric_std.all;
	use work.david.all;
  
ENTITY FreqCalc IS
	PORT(	
		CLOCK_1K 	: IN STD_LOGIC;
		DATAIN		: IN INTEGER RANGE -127 to 128;
		Freq		: OUT INTEGER
	);
end FreqCalc;

architecture generador of FreqCalc is
	signal cont, cont1		: INTEGER :=0;
	signal MaxIN			: INTEGER RANGE -127 to 128;
	signal espera			: std_logic := '0';
	
	begin
	Freq <= cont1;
	process(CLOCK_1K)
		begin  
	    if (CLOCK_1K'event and CLOCK_1K ='1')then
				
			if DATAIN > 40 then
				
				if DATAIN > MaxIN and espera = '0' then
					
					cont1 <= cont;
					cont <= 0;
					espera <= '1';
					
				elsif espera = '1' then
					
					if cont > 500 then
						espera <= '0';
					end if;
					cont <= cont + 1;
					
				else
					cont <= cont + 1;
				end if;
				
			else
				if cont > 1400 then
						cont1 <= 0;
				else
					cont <= cont + 1;
				end if;
			end if;
		
 		end if; --CLK,RESET  
	end process;
end generador;