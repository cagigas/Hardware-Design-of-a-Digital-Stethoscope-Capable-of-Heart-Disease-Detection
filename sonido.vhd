LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY sonido IS
	PORT(	KEY,CLOCK_50										: IN STD_LOGIC;
			LEDR 												: OUT STD_LOGIC_VECTOR(16 downto 0); 
			LEDG 												: OUT STD_LOGIC_VECTOR(8 downto 0);
			DATA												: OUT STD_LOGIC_VECTOR(23 downto 0);
			CLKaux												: out STD_LOGIC;
			--sonido
			AUD_DACLRCK, AUD_ADCLRCK, AUD_BCLK,AUD_ADCDAT		:IN STD_LOGIC;
			CLOCK2_50											:IN STD_LOGIC;
			I2C_SDAT											:INOUT STD_LOGIC;
			I2C_SCLK,AUD_DACDAT,AUD_XCK							:OUT STD_LOGIC
	);
END sonido;

ARCHITECTURE Behavior OF sonido IS
	COMPONENT clock_generator
		PORT(	CLOCK2_50														:IN STD_LOGIC;
		    	reset															:IN STD_LOGIC;
				AUD_XCK														:OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT audio_and_video_config
		PORT(	CLOCK_50,reset												:IN STD_LOGIC;
		    	I2C_SDAT														:INOUT STD_LOGIC;
				I2C_SCLK														:OUT STD_LOGIC);
	END COMPONENT;	

	COMPONENT audio_codec
		PORT(	CLOCK_50,reset,read_s,write_s							:IN STD_LOGIC;
				writedata_left, writedata_right						:IN STD_LOGIC_VECTOR(23 DOWNTO 0);
				AUD_ADCDAT,AUD_BCLK,AUD_ADCLRCK,AUD_DACLRCK		:IN STD_LOGIC;
				read_ready, write_ready									:OUT STD_LOGIC;
				readdata_left, readdata_right							:OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
				AUD_DACDAT													:OUT STD_LOGIC);
	END COMPONENT;
	
--	COMPONENT filter is
--		port (	clk 		: IN  std_logic;
--				datain
--				dataout 	: OUT integer range -128 to 127
--		);
--	END COMPONENT;
	
	SIGNAL read_ready, write_ready, read_s, write_s				:STD_LOGIC;
	SIGNAL readdata_left, readdata_right							:STD_LOGIC_VECTOR(23 DOWNTO 0);
	SIGNAL writedata_left, writedata_right							:STD_LOGIC_VECTOR(23 DOWNTO 0);	
	SIGNAL reset	:STD_LOGIC;
	SIGNAL aux2		:std_logic := '0';
	SIGNAL dato 	:STD_LOGIC_VECTOR(23 downto 0);
	type auxmem is array (9 downto 0) of std_logic_vector(23 downto 0);
	signal aux: auxmem;

	
BEGIN
	reset <= NOT(KEY);
	
	process(CLOCK_50, reset)
		variable contador,contador2: integer:=0;
		begin
		if reset = '1' then
			LEDR(0) <= '1';
			read_s <= '0';
			write_s <= '0';
			contador:=0;
			contador2:=0;
		elsif (CLOCK_50'event and CLOCK_50 = '1') then
			LEDR(0) <= '0';
			if read_ready = '1' and read_s = '0' then
				dato <= readdata_left;
				read_s <= '1';
				write_s <= '0';
				if contador = 96 then
					DATA <= dato;
					contador :=0;
					LEDR(16 downto 1) <= dato(23 downto 8);
					LEDG(7 downto 0)<= dato(7 downto 0);
					
				end if;
				if contador2 = 48 then --
					contador2:=0;
					aux2 <= not(aux2);
					CLKaux <= aux2;
				end if;
				contador2:=contador2+1;
				contador:=contador+1;
			elsif write_ready = '1' and write_s = '0' then
				--writedata_left <= dato;
				writedata_right <= dato;-- and "111111111100000000000000";
				write_s <= '1'; 
				read_s <= '0';	
			end if;
		end if;
	end process;


	my_clock_gen: clock_generator PORT MAP (CLOCK2_50, reset, AUD_XCK);
	cfg: audio_and_video_config PORT MAP (CLOCK_50, reset, I2C_SDAT, I2C_SCLK);
	codec: audio_codec PORT MAP(CLOCK_50,reset,read_s,write_s,writedata_left, writedata_right,AUD_ADCDAT,AUD_BCLK,AUD_ADCLRCK,AUD_DACLRCK,read_ready, write_ready,readdata_left, readdata_right,AUD_DACDAT);

END Behavior;