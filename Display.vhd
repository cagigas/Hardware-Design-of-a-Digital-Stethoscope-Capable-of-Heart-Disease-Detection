LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.std_logic_unsigned.ALL;
  USE ieee.std_logic_arith.ALL;
  
ENTITY Display IS
	PORT(	SW 												: IN STD_LOGIC_VECTOR (7 downto 0);	
			CLOCK_50,CLOCK2_50	 							: IN STD_LOGIC;
				LEDR 											: OUT STD_LOGIC_VECTOR(16 downto 0); 
				LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);     
			KEY												: IN STD_LOGIC_VECTOR(3 downto 0);
			DATA											: IN STD_LOGIC_VECTOR(23 downto 0);	
			--Image
			VGA_SYNC, VGA_BLANK, VGA_CLK 					: OUT STD_LOGIC;
			VGA_HS, VGA_VS 									: OUT STD_LOGIC;
			VGA_R, VGA_G, VGA_B 							: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END Display;

ARCHITECTURE Behavior OF Display IS
  
	SIGNAL hsync, vsync, CLOCK_108M					: STD_LOGIC;
	SIGNAL red_signal,	green_signal, blue_signal	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL h_cnt, v_cnt 							: INTEGER;
  
	COMPONENT PLLpantalla IS
		PORT(	inclk0	: IN STD_LOGIC;
				C0 		: OUT STD_LOGIC
		);
    END COMPONENT;
	
	
	COMPONENT Main IS
		PORT(	SW 								: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
						LEDR 											: OUT STD_LOGIC_VECTOR(16 downto 0); 
				LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);     

				CLOCK_50,CLOCK2_50,CLOCK_108M 	: IN STD_LOGIC;
				DATA							: IN STD_LOGIC_VECTOR(23 downto 0);
				KEY								:IN STD_LOGIC_VECTOR(3 downto 0);
				CONT_H, CONT_V					: IN INTEGER;
				ROJO,VERDE,AZUL					: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
    END COMPONENT;

	BEGIN
    
	PLLS	: PLLpantalla PORT MAP (CLOCK_50,CLOCK_108M);
	PICT	: Main PORT MAP (SW,LEDR,LEDG,CLOCK_50,CLOCK2_50,CLOCK_108M,DATA,KEY,h_cnt,v_cnt,red_signal,green_signal,blue_signal);

    VGA_SYNC  <= '1';
    VGA_BLANK <= '1';
	
	
    PROCESS(CLOCK_108M,KEY(0))
		BEGIN
        
		IF (KEY(0) = '0') THEN
			hsync <='0';
			vsync <='0';
			h_cnt<=0;
			v_cnt<=0;
			
		ELSIF (CLOCK_108M'EVENT and CLOCK_108M = '1') THEN
			
			-- Vertical Syncronism
			IF (v_cnt < 1063  ) THEN
				vsync <= '1';
			ELSE
				vsync <= '0';
			END IF;
				
			-- Vertical Counter
			IF (v_cnt = 1066) THEN
				v_cnt <= 0;
			ELSIF (h_cnt = 1688) THEN
				v_cnt <= v_cnt + 1;
			END IF;
				
			-- Horizontal Counter
			IF (h_cnt = 1688) THEN
				h_cnt <= 0;
			ELSE
				h_cnt <= h_cnt + 1;
			END IF;
				
			-- Horizontal Syncronism
			IF (h_cnt < 1576) THEN
				hsync <= '1';
			ELSE
				hsync <= '0';
			END IF; 
			
		END IF;  
		
    END PROCESS;
	
    VGA_CLK <= CLOCK_108M;
    VGA_HS <= hsync;
    VGA_VS <= vsync;
    VGA_R  <= red_signal;
    VGA_G  <= green_signal;
    VGA_B  <= blue_signal;
  
END Behavior;