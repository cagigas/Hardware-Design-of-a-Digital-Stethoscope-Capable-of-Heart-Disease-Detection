library ieee;
	use ieee.std_logic_1164.all;
--  use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_signed.all;
	use ieee.numeric_std.all;
	use work.david.all;
  
ENTITY PLLCLK1 IS
		PORT(
			CLKIN		: IN STD_LOGIC  := '0';
			CLKOUT		: OUT STD_LOGIC 
		);
end PLLCLK1;

architecture generador of PLLCLK1 is
	signal count:  integer range 0 to 9 := 0;
		
	begin
	
	
	process(CLKIN)
		begin  
	    if (CLKIN'event and CLKIN ='1')then
			if count < 5 then
				CLKOUT <= '0'; 
			else
				CLKOUT <= '1';
			end if;
			count <= count + 1;
 		end if; --CLK  
	end process;
end generador;