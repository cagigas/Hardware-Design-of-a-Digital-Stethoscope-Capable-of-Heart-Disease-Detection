LIBRARY ieee;
  USE ieee.std_logic_1164.all;
  USE ieee.std_logic_unsigned.all;
  USE ieee.std_logic_arith.all;

ENTITY Project IS
	PORT(	SW 												: IN STD_LOGIC_VECTOR (7 downto 0);
			CLOCK_50,CLOCK2_50 								: IN STD_LOGIC;
			KEY												: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			LEDR 											: OUT STD_LOGIC_VECTOR(17 downto 0); 
			LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);   	
			--Video
			VGA_SYNC, VGA_BLANK, VGA_CLK 					: OUT STD_LOGIC;
			VGA_HS, VGA_VS 									: OUT STD_LOGIC;
			VGA_R, VGA_G, VGA_B 							: OUT STD_LOGIC_VECTOR(7 downto 0);
			--Sound
			AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK,AUD_ADCDAT 	: IN STD_LOGIC;
			I2C_SDAT										: INOUT STD_LOGIC;
			I2C_SCLK,AUD_DACDAT,AUD_XCK						: OUT STD_LOGIC
		);
END Project;

ARCHITECTURE behavior OF Project IS
	SIGNAL DATA 	:STD_LOGIC_VECTOR(23 downto 0);
	
	COMPONENT Sound IS
		PORT(	SW												: IN STD_LOGIC_VECTOR (7 downto 0);
				KEY												: IN STD_LOGIC_VECTOR(3 downto 0);
				CLOCK_50										: IN STD_LOGIC;
		--		LEDR 											: OUT STD_LOGIC_VECTOR(16 downto 0); 
		--		LEDG 											: OUT STD_LOGIC_VECTOR(8 downto 0);     
				DATA											: OUT STD_LOGIC_VECTOR(23 downto 0);
				--Sound
				AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK,AUD_ADCDAT	: IN STD_LOGIC;
				CLOCK2_50										: IN STD_LOGIC;
				I2C_SDAT										: INOUT STD_LOGIC;
				I2C_SCLK,AUD_DACDAT,AUD_XCK						: OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT Display IS
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
	END COMPONENT;

	begin
  		SOUN	: Sound PORT MAP(SW,KEY,CLOCK_50,DATA,AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK,AUD_ADCDAT,CLOCK2_50,I2C_SDAT,I2C_SCLK,AUD_DACDAT,AUD_XCK);
		DISP	: Display PORT MAP(SW,CLOCK_50,CLOCK2_50,LEDR(16 downto 0), LEDG(8 downto 0),KEY, DATA, VGA_SYNC, VGA_BLANK, VGA_CLK,VGA_HS, VGA_VS,VGA_R, VGA_G, VGA_B);	
end behavior;