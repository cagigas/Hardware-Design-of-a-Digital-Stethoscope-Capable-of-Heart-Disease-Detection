LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	
PACKAGE david IS
	TYPE ausculation1000 IS ARRAY (999 DOWNTO 0) OF integer RANGE -127 TO 128;
	--TYPE ausculation1024 IS ARRAY (1023 DOWNTO 0) OF std_logic_vector(7 downto 0);

	TYPE colours IS
		RECORD
			ROJO	: std_logic_vector (7 DOWNTO 0);
			VERDE	: std_logic_vector (7 DOWNTO 0);
			AZUL	: std_logic_vector (7 DOWNTO 0);
		END RECORD;
	TYPE fullScreen IS array (99 DOWNTO 0) OF std_logic_vector(255 downto 0);
END david;

