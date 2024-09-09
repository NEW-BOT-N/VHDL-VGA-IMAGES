library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA_top_module is
    Port ( clk : in  STD_LOGIC;
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (2 downto 1));
end VGA_top_module;

architecture Behavioral of VGA_top_module is
COMPONENT CI
PORT	 (
	CLKIN_IN : IN	std_logic;
	CLKFX_OUT : OUT std_logic
);
END COMPONENT;
COMPONENT VGA_sync
PORT	 (
			  Clk : in  STD_LOGIC;
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC;
           Red : out  STD_LOGIC_VECTOR (2 downto 0);
           Green : out  STD_LOGIC_VECTOR (2 downto 0);
           Blue : out  STD_LOGIC_VECTOR (2 downto 1)
	);
END COMPONENT;
SIGNAL clock : std_logic := '0';
begin
Clocking_in : CI
port map (
Clk, clock
);
VGA_inst : VGA_sync 
port map (
			  Clk => clock,
           hsync =>  hsync,
           vsync => vsync,
           Red => Red,
           Green => Green,
           Blue => Blue
);
end Behavioral;

