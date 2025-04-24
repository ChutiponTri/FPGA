library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Better for arithmetic operations

-- Enhanced Feature Extraction (Sobel Edge Detection Example)
entity feature_extraction is
    generic (
        WINDOW_SIZE : integer := 3  -- Add this generic declaration
    );
    Port (
        clk          : in std_logic;
        pixel_in     : in std_logic_vector(7 downto 0);
        valid_in     : in std_logic;
        feature_out  : out std_logic_vector(7 downto 0);
        valid_out    : out std_logic
    );
end feature_extraction;

architecture Behavioral of feature_extraction is
    -- Need line buffers for neighborhood operations
    -- This simplified version shows the concept
    signal sum : unsigned(9 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if valid_in = '1' then
                -- Simple averaging (replace with actual edge detection)
                sum <= resize(unsigned(pixel_in), sum'length) + 1;
                feature_out <= std_logic_vector(sum(9 downto 2));  -- Divide by 4
                valid_out <= '1';
            else
                valid_out <= '0';
            end if;
        end if;
    end process;
end Behavioral;