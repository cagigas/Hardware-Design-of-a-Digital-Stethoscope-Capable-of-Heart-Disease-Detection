library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_arith.all;

entity Sync is
	port(  	A:	in std_logic;--_vector(3 downto 0);
			CLK:	in std_logic;
			Q:	out std_logic);--_vector(3 downto 0));
end entity;

architecture sinc of Sync is
	signal FFD1,FFD2,FFD3:		std_logic;--_vector(3 downto 0);
	begin				
	process(CLK)
		begin
		if (CLK = '1' and CLK'EVENT) then
			FFD1 <= A;
			FFD2 <= FFD1;
			FFD3 <= FFD2;
		end if;
		Q <= not(not(FFD2) and FFD3);
	end process;
end architecture;
