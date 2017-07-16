library ieee;
	use ieee.std_logic_1164.all;
--  use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_signed.all;
	use ieee.numeric_std.all;
	use work.david.all;
  
ENTITY Main IS
	PORT(	SW 								: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
							LEDR 											: OUT STD_LOGIC_VECTOR(16 downto 0); 
				LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);     

			CLOCK_50,CLOCK2_50,CLOCK_108M 	: IN STD_LOGIC;
			DATA							: IN STD_LOGIC_VECTOR(23 downto 0);
			KEY								: IN STD_LOGIC_VECTOR(3 downto 0);
			CONT_H, CONT_V					: IN INTEGER;
			ROJO,VERDE,AZUL					: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end Main;

architecture generador of Main is
	TYPE FSMStates IS (state0, state1);
	SIGNAL state : FSMStates := state0;
	SIGNAL RedImg, GreenImg, BlueImg	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL RedPic, GreenPic, BluePic	: STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT Picture IS
		PORT(	SW 									: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
								LEDR 											: OUT STD_LOGIC_VECTOR(16 downto 0); 
				LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);     

				CLOCK_50,CLOCK2_50,CLOCK_108M 		: IN STD_LOGIC;
				DATA								: IN STD_LOGIC_VECTOR(23 downto 0);
				KEY									: IN STD_LOGIC_VECTOR(3 downto 0);
				CONT_H, CONT_V						: IN INTEGER;
				ROJO,VERDE,AZUL						: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
    END COMPONENT;

	COMPONENT MainImage IS
		PORT(	SW 								: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				CLOCK_50,CLOCK2_50,CLOCK_108M 	: IN STD_LOGIC;
				KEY								:IN STD_LOGIC_VECTOR(3 downto 0);
				CONT_H, CONT_V						: IN INTEGER;
				ROJO,VERDE,AZUL						: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
    END COMPONENT;

	BEGIN
    
	PICT	: Picture PORT MAP (SW,LEDR,LEDG,CLOCK_50,CLOCK2_50,CLOCK_108M,DATA,KEY,CONT_H, CONT_V,RedPic, GreenPic, BluePic);
	MAIN	: MainImage PORT MAP (SW,CLOCK_50,CLOCK2_50,CLOCK_108M,KEY,CONT_H, CONT_V,RedImg, GreenImg, BlueImg);

	PROCESS (CLOCK_108M, KEY(0)) 
		BEGIN
        if(KEY(0)='0')then
			ROJO   <= (others => '0');
			VERDE  <= (others => '0');
			AZUL   <= (others => '0');
			state <= state0; 
		elsif CLOCK_108M'event and CLOCK_108M='1' then

			case state is
				when state0 =>
					ROJO <= RedImg;
					VERDE <= GreenImg;
					AZUL <= BlueImg;
					if (KEY(1) = '0' or KEY(2) = '0' or KEY(3) = '0') then
						state <= state1;
					else 
						state <= state0;
					end if;
					
				when state1 =>
					ROJO <= RedPic;
					VERDE <= GreenPic;
					AZUL <= BluePic;
					if (KEY(0)='0') then
						state <= state0;
					else
						state <= state1;
					end if;
			end case;
		end if;
	END PROCESS;
	
	
	
	
	
end generador;