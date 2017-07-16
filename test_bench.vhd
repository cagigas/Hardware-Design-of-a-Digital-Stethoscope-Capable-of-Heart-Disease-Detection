LIBRARY ieee ;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_arith.all;

entity test_bench is
    
end entity;

architecture only of test_bench is

component Practica6  --definir las entradas y salidas del dise�o
  port(SW :in std_logic_vector (7 downto 0);
       CLK,KEY3,RESET: in std_logic;
       VGA_SYNC, VGA_BLANK, VGA_CLK: out std_logic;
       VGA_HS, VGA_VS:out std_logic;
       VGA_R, VGA_G, VGA_B 	: OUT std_logic_vector(7 downto 0);
       LEDR: out std_logic_vector(17 downto 0));
end component;

    SIGNAL sw :STD_LOGIC_VECTOR(7 downto 0);
    SIGNAL clk : std_logic := '0';
    signal key3,reset,vga_sync, vga_blank, vga_clk : STD_LOGIC;	
	  SIGNAL vga_hs, vga_vs: std_logic;
    SIGNAL vga_r, vga_g, vga_b:STD_LOGIC_VECTOR(9 downto 0);
    SIGNAL Ledr:  std_logic_vector(17 downto 0);
  
    begin
  
    dut : Project	-- mapear las se�ales 
    port map(sw => SW,clk => CLK,key3 => KEY3,reset => RESET,vga_sync => VGA_SYNC, vga_blank => VGA_BLANK,
             vga_clk => VGA_CLK,vga_hs => VGA_HS, vga_vs => VGA_VS,vga_r => VGA_R, vga_g => VGA_G, vga_b => VGA_B,
             ledr => LEDR);
      
    PROCESS 
      
        begin
        reset <= '0';
        wait for 20 ns;
        reset <= '1';
    
        wait;
    end PROCESS;
    
    process
      begin
        clk <=not(clk);
        wait for 9.26 ns; --(50 MHZ)
    end PROCESS;
    
end only;

