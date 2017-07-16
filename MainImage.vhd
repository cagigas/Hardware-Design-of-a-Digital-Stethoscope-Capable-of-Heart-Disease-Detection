library ieee;
	use ieee.std_logic_1164.all;
--  use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_signed.all;
	use ieee.numeric_std.all;
	use work.david.all;
  
ENTITY MainImage IS
	PORT(	SW 								: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			CLOCK_50,CLOCK2_50,CLOCK_108M 	: IN STD_LOGIC;
			KEY								: IN STD_LOGIC_VECTOR(3 downto 0);
			CONT_H, CONT_V					: IN INTEGER;
			ROJO,VERDE,AZUL					: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end MainImage;

architecture generador of MainImage is
	signal addr_a	: STD_LOGIC_VECTOR (19 DOWNTO 0);
	signal q		: STD_LOGIC_VECTOR(0 downto 0);
	signal addr: NATURAL range 0 to 998999;
	
	COMPONENT ROM1PMainImageBN IS
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (19 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q			: OUT STD_LOGIC_VECTOR (0 DOWNTO 0)
		);
	END COMPONENT;

	
	begin
	ROMI: ROM1PMainImageBN PORT MAP (addr_a,CLOCK_108M,q);

	addr <= (CONT_H-336)+(CONT_V-95)*1110;
	addr_a <= std_logic_vector(to_unsigned(addr,20));
	
	process(CLOCK_108M,KEY(0))
		begin  
        if(KEY(0)='0')then
			ROJO   <= (others => '0');
			VERDE  <= (others => '0');
			AZUL   <= (others => '0');
			
		elsif (CLOCK_108M'event and CLOCK_108M ='1')then
			
			if (CONT_V > 34) and (CONT_V < 95) then
				if((CONT_H > 252) and (CONT_H < 1529)) then
					ROJO  <= (others => '1');
					VERDE <= (others => '1');
					AZUL  <= (others => '1');
				else 
					ROJO  <= (others => '0');
					VERDE <= (others => '0');
					AZUL  <= (others => '0');
				end if;
			elsif (CONT_V > 994) and (CONT_V < 1055) then
				if((CONT_H > 252) and (CONT_H < 1529)) then
					ROJO  <= (others => '1');
					VERDE <= (others => '1');
					AZUL  <= (others => '1');
				else 
					ROJO  <= (others => '0');
					VERDE <= (others => '0');
					AZUL  <= (others => '0');
				end if;
			elsif((CONT_V > 94) and (CONT_V < 995))then	--Imagen
				if(CONT_H > 252) and (CONT_H < 336) then 
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
				elsif (CONT_H > 1445) and (CONT_H < 1529)then
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
				elsif ((CONT_H > 335) and (CONT_H < 1446)) then 
						ROJO  <= q&q&q&q&q&q&q&q;
						VERDE <= q&q&q&q&q&q&q&q;
						AZUL  <= q&q&q&q&q&q&q&q;
				else 
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
				end if;
				
			else 				
				if((CONT_H = 253) or (CONT_H = 254) or (CONT_H = 1527) or (CONT_H = 1528)) then 
					if ((CONT_V > 36) and (CONT_V < 1053)) then
						ROJO  <= (others => '1');
						VERDE <= (others => '1');
						AZUL  <= (others => '1');
					else					
						ROJO  <= (others => '0');
						VERDE <= (others => '0');
						AZUL  <= (others => '0');
					end if;
				else					
					ROJO  <= (others => '0');
					VERDE <= (others => '0');
					AZUL  <= (others => '0');
				end if;
			end if;
 		end if;  
	end process;
end generador;