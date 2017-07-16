-- Quartus II VHDL Template
-- Simple Dual-Port RAM with different read/write addresses and
-- different read/write clock

library ieee;
use ieee.std_logic_1164.all;

--entity simple_dual_port_ram_dual_clock is
--
--	generic 
--	(
--		DATA_WIDTH : natural := 8;
--		ADDR_WIDTH_R : natural := 6;
--		ADDR_WIDTH_W : natural := 6
--	);
--
--	port 
--	(
--		rclk	: in std_logic;
--		wclk	: in std_logic;
--		raddr	: in natural range 0 to 2**ADDR_WIDTH - 1;
--		waddr	: in natural range 0 to 2**ADDR_WIDTH - 1;
--		data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
--		we		: in std_logic := '1';
--		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
--	);
--
--end simple_dual_port_ram_dual_clock;
--
architecture rtl of simple_dual_port_ram_dual_clock is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector((DATA_WIDTH-1) downto 0);
	type memory_t is array(2**ADDR_WIDTH-1 downto 0) of word_t;

	-- Declare the RAM signal.	
	signal ram : memory_t;

begin

	process(wclk)
	begin
	if(rising_edge(wclk)) then 
		if(we = '1') then
			ram(waddr) <= data;
		end if;
	end if;
	end process;

	process(rclk)
	begin
	if(rising_edge(rclk)) then 
		q <= ram(raddr);
	end if;
	end process;

end rtl;
