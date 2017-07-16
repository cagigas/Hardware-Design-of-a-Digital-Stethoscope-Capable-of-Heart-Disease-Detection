LIBRARY ieee;
	USE ieee.std_logic_1164.all;
	USE ieee.std_logic_arith.all;

	USE ieee.std_logic_signed.all;
	USE work.david.ALL;

ENTITY screenRealTime IS
	PORT(	CLOCK_50, RESET0	: IN STD_LOGIC;		
			datoS				: IN ausculation1024;
			screen				: OUT fullScreen
	);
end screenRealTime;

ARCHITECTURE Behavior OF screenRealTime IS
	signal r: integer range 0 to 99:=0;
	signal data: std_logic_vector(255 downto 0);
	
	
	BEGIN
	--	RAMsc: RAM PORT MAP(datoini+127);

		process(CLOCK_50)
			begin
--				if RESET0 = '1' then		
--					screen <= (others => (others => '0'));

				if (CLOCK_50'event and CLOCK_50 ='1')then
					if r <= 99 then
						data <= (others => '0');
						data(datoS(r)+127) <= '1';
						screen(r) <= data;
						r<=r+1;
					else
						r<=0;
					end if;
				end if;
		end process;		
END Behavior;