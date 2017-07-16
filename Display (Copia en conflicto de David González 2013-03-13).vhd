LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.std_logic_unsigned.ALL;
  USE ieee.std_logic_arith.ALL;
  
ENTITY Display IS
	PORT(	SW 								: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			CLOCK_50, KEY		 			: IN STD_LOGIC;
			LEDR 							: OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
			DATA							: IN STD_LOGIC_VECTOR(23 DOWNTO 0);
			CLKaux							: IN STD_LOGIC;
			--Video
			VGA_SYNC, VGA_BLANK, VGA_CLK	: OUT STD_LOGIC;
			VGA_HS, VGA_VS 					: OUT STD_LOGIC;
			VGA_R, VGA_G, VGA_B 			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Display;

ARCHITECTURE Behavior OF Display IS
  
	SIGNAL hsync, vsync, CLOCK_48K					: STD_LOGIC;
	SIGNAL red_signal,	green_signal, blue_signal	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL h_cnt, v_cnt 							: INTEGER;
	SIGNAL RESET									: STD_LOGIC;
  
	COMPONENT PLLMonitor IS
		PORT(	inclk0	: IN STD_LOGIC;
				C0 		: OUT STD_LOGIC
		);
    END COMPONENT;
	
	COMPONENT Picture IS
		PORT(	CLOCK_50,CLOCK_108K,RESET,CLKaux 	: IN STD_LOGIC;
				DATA								: IN STD_LOGIC_VECTOR(23 downto 0);
				CONT_H, CONT_V						: IN INTEGER;
				ROJO,VERDE,AZUL						: OUT STD_LOGIC_VECTOR(7 downto 0)
		);
    END COMPONENT;

	BEGIN
    
	PLLS	: PLLMonitor PORT MAP (CLOCK_50,CLOCK_48K);
    PICT	: Picture PORT MAP (CLOCK_50,CLOCK_48K,RESET,CLKaux,DATA,h_cnt,v_cnt,red_signal,green_signal,blue_signal);

    VGA_SYNC  <= '1';
    VGA_BLANK <= '1';
	RESET <= KEY;
	
	LEDR(0)<=CLKaux;
	
    PROCESS(CLOCK_48K,RESET)
		BEGIN
        
		IF (RESET = '0') THEN
			hsync <='0';
			vsync <='0';
			h_cnt<=0;
			v_cnt<=0;
			
		ELSIF (CLOCK_48K'EVENT and CLOCK_48K = '1') THEN
			
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
	
    VGA_CLK <= CLOCK_48K;
    VGA_HS <= hsync;
    VGA_VS <= vsync;
    VGA_R  <= red_signal;
    VGA_G  <= green_signal;
    VGA_B  <= blue_signal;
  
END Behavior;