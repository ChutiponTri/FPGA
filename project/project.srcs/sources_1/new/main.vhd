library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Recommended over STD_LOGIC_ARITH/UNSIGNED

entity object_tracking_top is
    Port (
        -- System Clock & Pixel Clock
        clk       : in std_logic;       -- 100 MHz FPGA clock
        pclk      : in std_logic;       -- OV7670 Pixel Clock (typ. 24 MHz)
        
        -- Camera Interface Signals
        vsync     : in std_logic;       -- Frame Sync
        href      : in std_logic;       -- Line Sync
        data_in   : in std_logic_vector(7 downto 0); -- 8-bit pixel data
        
        -- VGA Output
        hsync     : out std_logic;      -- Horizontal Sync
        vsync_out : out std_logic;      -- Vertical Sync
        red       : out std_logic_vector(3 downto 0);
        green     : out std_logic_vector(3 downto 0);
        blue      : out std_logic_vector(3 downto 0)
    );
end object_tracking_top;

architecture Behavioral of object_tracking_top is
    -- Internal signals
    signal pixel_camera    : std_logic_vector(7 downto 0); -- Raw pixel from camera
    signal valid_camera    : std_logic;
    
    signal pixel_buffered  : std_logic_vector(7 downto 0); -- Frame buffer output
    signal feature_output  : std_logic_vector(7 downto 0); -- Feature extracted image
    signal match_score     : std_logic_vector(7 downto 0); -- Template matching score
    
    signal frame_address   : std_logic_vector(17 downto 0) := (others => '0');
    signal write_enable    : std_logic := '0';
    
    -- Added signals for better timing control
    signal vga_red         : std_logic_vector(3 downto 0);
    signal vga_green       : std_logic_vector(3 downto 0);
    signal vga_blue        : std_logic_vector(3 downto 0);
    
    -- Constants for template (should be moved to a package)
    constant TEMPLATE_PATTERN : std_logic_vector(7 downto 0) := "10101010";

begin
    -- Camera Interface Module
    cam_interface: entity work.camera_interface
        port map (
            clk => clk,
            pclk => pclk,
            vsync => vsync,
            href => href,
            data_in => data_in,
            pixel_out => pixel_camera,
            valid => valid_camera,
            frame_addr_out => frame_address  -- Added address output
        );

    -- Frame Buffer (BRAM) - Dual port for simultaneous read/write
    frame_buf: entity work.frame_buffer
        generic map (
            ADDR_WIDTH => 18,
            DATA_WIDTH => 8
        )
        port map (
            clk => clk,
            addr_a => frame_address,    -- Write address from camera
            din_a => pixel_camera,
            we_a => valid_camera,
            addr_b => frame_address,    -- Read address (needs proper generation)
            dout_b => pixel_buffered
        );

    -- Feature Extraction (Edge Detection / Keypoint Extraction)
    feature_extraction: entity work.feature_extraction
        generic map (
            WINDOW_SIZE => 3  -- 3x3 processing window
        )
        port map (
            clk => clk,
            pixel_in => pixel_buffered,
            valid_in => '1',  -- Needs proper validation signal
            feature_out => feature_output,
            valid_out => open  -- Add if needed
        );

    -- Template Matching (Correlation Filter)
    template_matching: entity work.template_matching
        generic map (
            TEMPLATE_SIZE => 8,
            IMAGE_WIDTH => 320,  -- Adjust based on your resolution
            IMAGE_HEIGHT => 240
        )
        port map (
            clk => clk,
            feature_in => feature_output,
            valid_in => '1',  -- Needs proper validation signal
            template => TEMPLATE_PATTERN,
            match_score => match_score,
            match_x => open,    -- Add object position outputs
            match_y => open,
            match_valid => open
        );

    -- VGA Controller for Display
    vga_ctrl: entity work.vga_controller
        generic map (
            H_RES => 640,
            V_RES => 480
        )
        port map (
            clk => clk,
            pixel_data => pixel_buffered,  -- Display original or processed image
            match_data => match_score,     -- Overlay matching result
            hsync => hsync,
            vsync => vsync_out,
            red => vga_red,
            green => vga_green,
            blue => vga_blue
        );
        
    -- Output registers for better timing
    process(clk)
    begin
        if rising_edge(clk) then
            red <= vga_red;
            green <= vga_green;
            blue <= vga_blue;
        end if;
    end process;

end Behavioral;