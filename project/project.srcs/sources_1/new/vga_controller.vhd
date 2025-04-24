library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_controller is
    generic (
        H_RES : integer := 640;
        V_RES : integer := 480
    );
    Port (
        clk         : in std_logic;
        pixel_data  : in std_logic_vector(7 downto 0);
        match_data  : in std_logic_vector(7 downto 0);
        hsync       : out std_logic;
        vsync       : out std_logic;
        red         : out std_logic_vector(3 downto 0);
        green       : out std_logic_vector(3 downto 0);
        blue        : out std_logic_vector(3 downto 0)
    );

end vga_controller;

architecture Behavioral of vga_controller is
    -- VGA Timing constants for 640x480@60Hz
    constant H_MAX      : integer := 800;
    constant V_MAX      : integer := 525;
    constant H_SYNC_ON  : integer := 656;
    constant H_SYNC_OFF : integer := 752;
    constant V_SYNC_ON  : integer := 490;
    constant V_SYNC_OFF : integer := 492;

    signal h_counter : integer range 0 to H_MAX - 1 := 0;
    signal v_counter : integer range 0 to V_MAX - 1 := 0;
    signal display_active : std_logic;

begin
    -- Horizontal and Vertical counters
    process(clk)
    begin
        if rising_edge(clk) then
            if h_counter = H_MAX - 1 then
                h_counter <= 0;
                if v_counter = V_MAX - 1 then
                    v_counter <= 0;
                else
                    v_counter <= v_counter + 1;
                end if;
            else
                h_counter <= h_counter + 1;
            end if;
        end if;
    end process;

    -- Generate sync pulses
    hsync <= '0' when h_counter >= H_SYNC_ON and h_counter < H_SYNC_OFF else '1';
    vsync <= '0' when v_counter >= V_SYNC_ON and v_counter < V_SYNC_OFF else '1';

    -- Determine if we are in active display area
    display_active <= '1' when (h_counter < H_RES and v_counter < V_RES) else '0';

    -- Output video signals
    process(clk)
    begin
        if rising_edge(clk) then
            if display_active = '1' then
                if unsigned(match_data) < 128 then
                    red <= "1111";  -- highlight
                else
                    red <= pixel_data(7 downto 4);
                end if;
                green <= pixel_data(7 downto 4);
                blue  <= pixel_data(7 downto 4);
            else
                red   <= (others => '0');
                green <= (others => '0');
                blue  <= (others => '0');
            end if;
        end if;
    end process;
    
end Behavioral;