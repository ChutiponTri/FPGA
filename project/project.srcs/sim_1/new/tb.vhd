library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;  -- Required for file operations
use IEEE.STD_LOGIC_TEXTIO.ALL;  -- For std_logic_vector I/O

entity object_tracking_tb is
end object_tracking_tb;

architecture Behavioral of object_tracking_tb is
    -- Component Declaration for the System Under Test (SUT)
    component object_tracking_top
        Port (
            clk       : in  std_logic;
            pclk      : in  std_logic;
            vsync     : in  std_logic;
            href      : in  std_logic;
            data_in   : in  std_logic_vector(7 downto 0);
            hsync     : out std_logic;
            vsync_out : out std_logic;
            red       : out std_logic_vector(3 downto 0);
            green     : out std_logic_vector(3 downto 0);
            blue      : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Clock Signals
    signal clk       : std_logic := '0';
    signal pclk      : std_logic := '0';
    
    -- Camera Signals
    signal vsync     : std_logic := '1';
    signal href      : std_logic := '0';
    signal data_in   : std_logic_vector(7 downto 0) := (others => '0');

    -- VGA Output Signals
    signal hsync     : std_logic;
    signal vsync_out : std_logic;
    signal red       : std_logic_vector(3 downto 0);
    signal green     : std_logic_vector(3 downto 0);
    signal blue      : std_logic_vector(3 downto 0);

    -- Constants
    constant CLK_PERIOD   : time := 10 ns;
    constant PCLK_PERIOD  : time := 40 ns;
    constant FRAME_PERIOD : time := 16.7 ms;
    constant VSYNC_PULSE  : time := 64 us;

    -- Simulation Control
    signal simulation_active : boolean := true;
begin
    -- Instantiate the System Under Test (SUT)
    SUT: object_tracking_top
        port map (
            clk       => clk,
            pclk      => pclk,
            vsync     => vsync,
            href      => href,
            data_in   => data_in,
            hsync     => hsync,
            vsync_out => vsync_out,
            red       => red,
            green     => green,
            blue      => blue
        );

    -- Clock Generation (100 MHz)
    clk_process: process
    begin
        while simulation_active loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Pixel Clock Generation (25 MHz)
    pclk_process: process
    begin
        while simulation_active loop
            pclk <= '0';
            wait for PCLK_PERIOD / 2;
            pclk <= '1';
            wait for PCLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Camera Data Simulation
    camera_simulation: process
    begin
        wait for 100 ns; -- Initial delay
        
        while simulation_active loop
            -- Frame Start (VSYNC pulse - active low)
            vsync <= '0';
            wait for VSYNC_PULSE;
            vsync <= '1';
            
            -- Frame Data (480 lines)
            for y in 0 to 479 loop
                -- Line Start (HREF pulse)
                href <= '1';
                wait for PCLK_PERIOD/2;
                
                -- Pixel Data (640 pixels per line)
                for x in 0 to 639 loop
                    -- Simple test pattern - could be enhanced
                    if (x > 200 and x < 250 and y > 150 and y < 200) then
                        data_in <= "11111111"; -- White square
                    else
                        data_in <= std_logic_vector(to_unsigned((x + y) mod 256, 8));
                    end if;
                    wait for PCLK_PERIOD;
                end loop;
                
                -- Line End
                href <= '0';
                wait for PCLK_PERIOD * 10; -- Horizontal blanking
            end loop;
            
            -- Vertical blanking period
            wait for FRAME_PERIOD - (480 * (640 + 10) * PCLK_PERIOD);
        end loop;
        
        wait;
    end process;

    -- Simplified VGA Monitor without file I/O
    vga_monitor: process
    begin
        wait until rising_edge(clk);
        
        -- Detect frame start
        if vsync_out = '0' and hsync = '0' then
            report "Frame started at " & time'image(now);
        end if;
        
        -- Log significant VGA activity
        if red /= "0000" or green /= "0000" or blue /= "0000" then
            report "Active pixel - RGB: " & 
                  integer'image(to_integer(unsigned(red))) & " " &
                  integer'image(to_integer(unsigned(green))) & " " &
                  integer'image(to_integer(unsigned(blue)));
        end if;
    end process;

    -- Timeout Watchdog
    watchdog: process
    begin
        wait for 200 ms;
        if simulation_active then
            report "Simulation timeout" severity failure;
            simulation_active <= false;
        end if;
        wait;
    end process;

end Behavioral;