
library ieee;
use ieee.std_logic_1164.all;

entity Ram is
		generic(
			DATA_WIDTH_R : natural := 1024;
			DATA_WIDTH_W : natural := 256;
			ADDR_WIDTH_R : natural := 8;
			ADDR_WIDTH_W : natural := 10
		);

		port(
			data	: in std_logic_vector((DATA_WIDTH_W-1) downto 0);
			raddr	: in integer range 0 to 2**ADDR_WIDTH_R - 1;
			rclk	: in std_logic;
			waddr	: in integer range 0 to 2**ADDR_WIDTH_W - 1;
			wclk	: in std_logic;
			we		: in std_logic := '1';
			q		: out std_logic_vector((DATA_WIDTH_R - 1) downto 0)
		);

end Ram;

architecture rtl of Ram is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector((DATA_WIDTH_W-1) downto 0);
	type memory_t is array(2**ADDR_WIDTH_W-1 downto 0) of word_t;

	-- Declare the RAM signal.	
	signal ram : memory_t;

begin

	process(wclk)
	begin
	if(rising_edge(wclk)) then 
		if(we = '1') then
			ram(waddr)(32) <= data;
		end if;
	end if;
	end process;

	process(rclk)
	begin
	if(rising_edge(rclk)) then 
		bucle: for i in 0 to 2**ADDR_WIDTH_W - 1 LOOP
			q(i) <= ram(i(raddr));
		end LOOP bucle;
	end if;
	end process;

end rtl;
