
library ieee;
	use ieee.std_logic_1164.all;
--  use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_signed.all;
	use ieee.numeric_std.all;
	use work.david.all;
  
entity Picture is
	port(	CLOCK_50,CLOCK_48K,RESET,CLKaux		: IN STD_LOGIC;
			DATA								: IN STD_LOGIC_VECTOR(23 downto 0);
			CONT_H, CONT_V						: IN INTEGER;
			ROJO,VERDE,AZUL						: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end Picture;


architecture generador of Picture is
	signal datoS: ausculation1024;
	signal datoini: integer range -127 to 128;
	signal data2: std_logic_vector(255 downto 0);
	signal radd: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal wadd: STD_LOGIC_VECTOR (9 DOWNTO 0);
	signal q: STD_LOGIC_VECTOR (1023 DOWNTO 0);
	signal a: signed(7 downto 0);


	COMPONENT RAM IS
		PORT(
			data		: IN STD_LOGIC_VECTOR (255 DOWNTO 0);
			rdaddress		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			rdclock		: IN STD_LOGIC ;
			wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			wrclock		: IN STD_LOGIC  := '1';
			wren		: IN STD_LOGIC  := '0';
			q		: OUT STD_LOGIC_VECTOR (1023 DOWNTO 0)
		);
	END COMPONENT;
	
--COMPONENT MEM IS
--	PORT
--	(
--		clock		: IN STD_LOGIC ;
--		shiftin		: IN STD_LOGIC ;
--		q		: OUT STD_LOGIC_VECTOR (1023 DOWNTO 0)
--	);
--END COMPONENT;

	
	COMPONENT sthetoscope2 IS
		PORT(	CLOCK_50			: IN STD_LOGIC;
				datoS				: IN ausculation1024;
				wadd				: OUT STD_LOGIC_VECTOR (9 DOWNTO 0);
				data2				: OUT std_logic_vector(255 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sthetoscope1 IS
		PORT(	CLKaux 				: IN STD_LOGIC;
				datin				: IN integer range -127 to 128;		
				datoS				: OUT ausculation1024
		);
	END COMPONENT;
	

--	COMPONENT screenRealTime IS
--		PORT(	CLOCK_50,RESET0				: IN STD_LOGIC;
--				datoS				: IN ausculation1000;
--				screen				: OUT fullScreen
--		);
--	END COMPONENT;

	begin
	
	datoini <= to_integer(((signed(DATA))/(2**16)));

	stetos:	sthetoscope1 PORT MAP (CLKaux,datoini,datoS);
	--a <= to_signed((CONT_H-168),8);
	radd <=  std_logic_vector(to_signed((CONT_V-168),8));
	--radd <=  (CONT_H-168);

	
	sthet: sthetoscope2 PORT MAP (CLOCK_50,datoS,wadd,data2);
--	scree: screenRealTime PORT MAP	(CLOCK_50, RESET0, datoS, screen);	
	RAMsc: RAM PORT MAP(data2, radd,CLK0,wadd,CLOCK_50,'1',q);
--	MEMoria: MEM PORT MAP(CLKaux,DATA,q);
	process(CLK0)
		begin  

        if(RESET0='0')then
			ROJO   <= (others => '0');
			VERDE  <= (others => '0');
			AZUL   <= (others => '0');
		--	screen <= (others => (others => '0'));
	    elsif (CLK0'event and CLK0 ='1')then
			
			if ((CONT_V = 40) or (CONT_V = 41) or (CONT_V = 1058) or (CONT_V = 1059) or (CONT_V = 551) or (CONT_V = 552) or (CONT_V = 553)) then
				if((CONT_H > 252) and (CONT_H < 1529)) then
					ROJO  <= (others => '1');
					VERDE <= (others => '1');
					AZUL  <= (others => '1');
				else 
					ROJO  <= (others => '0');
					VERDE <= (others => '0');
					AZUL  <= (others => '0');
				end if;
			elsif ((CONT_V > 168) and (CONT_V < 424))then --First window
				
				if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
				elsif ((CONT_H > 255) and (CONT_H < 1278)) then --< 1527)) then
						ROJO <= q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255);
						VERDE <= q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255);
						AZUL <= q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255)&q(CONT_H-255);
				else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
				end if;
				
			elsif ((CONT_V > 553) and (CONT_V < 1058))then --Second window
				  
				if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528))then
					ROJO  <= (others => '1');
					VERDE <= (others => '1');
					AZUL  <= (others => '1');
				elsif ((CONT_H > 255) and (CONT_H < 1527)) then
					ROJO  <= (others => '0');--
					VERDE <= (others => '0');--
					AZUL  <= (others => '0');--
				else 
					ROJO  <= (others => '0');
					VERDE <= (others => '0');
					AZUL  <= (others => '0');
				end if;
			else 
				if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
					ROJO  <= (others => '1');
					VERDE <= (others => '1');
					AZUL  <= (others => '1');
				else 
					ROJO  <= (others => '0');
					VERDE <= (others => '0');
					AZUL  <= (others => '0');
				end if;
			end if;
 		end if; --CLK,RESET  
	end process;
end generador;