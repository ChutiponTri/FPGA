library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Better for arithmetic operations

-- Camera Interface Module
entity camera_interface is
    Port (
        clk       : in std_logic;       -- System clock for synchronization
        pclk      : in std_logic;       -- Pixel clock from camera (typ. 24MHz)
        vsync     : in std_logic;       -- Vertical sync (active low)
        href      : in std_logic;       -- Horizontal reference (active high)
        data_in   : in std_logic_vector(7 downto 0); -- Camera pixel data
        pixel_out : out std_logic_vector(7 downto 0); -- Processed pixel output
        valid     : out std_logic;      -- Data valid signal
        frame_addr_out : out std_logic_vector(17 downto 0) -- Added address output
    );
end camera_interface;

architecture Behavioral of camera_interface is
    signal x_counter : unsigned(9 downto 0) := (others => '0');  -- 640 columns (0-639)
    signal y_counter : unsigned(8 downto 0) := (others => '0');  -- 480 rows (0-479)
    signal pixel_valid : std_logic := '0';
begin
    process(pclk, vsync)
    begin
        if vsync = '1' then  -- Reset counters during vertical sync
            x_counter <= (others => '0');
            y_counter <= (others => '0');
            pixel_valid <= '0';
        elsif rising_edge(pclk) then
            if href = '1' then  -- Active line
                if x_counter < 640 then  -- Only capture valid pixels
                    pixel_out <= data_in;
                    pixel_valid <= '1';
                    frame_addr_out <= std_logic_vector(y_counter) & std_logic_vector(x_counter(8 downto 0));
                    x_counter <= x_counter + 1;
                else
                    pixel_valid <= '0';
                end if;
            else  -- End of line
                if y_counter < 480 then
                    y_counter <= y_counter + 1;
                end if;
                x_counter <= (others => '0');
                pixel_valid <= '0';
            end if;
        end if;
    end process;
    
    valid <= pixel_valid;
end Behavioral;
