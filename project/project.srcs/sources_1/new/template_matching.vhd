library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Better for arithmetic operations

-- Improved Template Matching
entity template_matching is
    generic (
        TEMPLATE_SIZE : integer := 8;
        IMAGE_WIDTH   : integer := 640;
        IMAGE_HEIGHT  : integer := 480
    );
    Port (
        clk         : in std_logic;
        feature_in  : in std_logic_vector(7 downto 0);
        valid_in    : in std_logic;
        template    : in std_logic_vector(7 downto 0);
        match_score : out std_logic_vector(7 downto 0);
        match_x     : out std_logic_vector(9 downto 0);  -- X coordinate
        match_y     : out std_logic_vector(8 downto 0);  -- Y coordinate
        match_valid : out std_logic
    );
end template_matching;

architecture Behavioral of template_matching is
    signal correlation : integer range 0 to 255 := 0;
    signal best_score : integer := 0;
    signal best_x : unsigned(9 downto 0) := (others => '0');
    signal best_y : unsigned(8 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if valid_in = '1' then
                -- Simple correlation (replace with actual matching algorithm)
                if feature_in = template then
                    correlation <= correlation + 1;
                end if;
                
                -- Update best match position
                if correlation > best_score then
                    best_score <= correlation;
                    best_x <= best_x + 1;
                    if best_x = IMAGE_WIDTH-1 then
                        best_x <= (others => '0');
                        best_y <= best_y + 1;
                    end if;
                end if;
            end if;
            
            match_score <= std_logic_vector(to_unsigned(correlation, 8));
            match_x <= std_logic_vector(best_x);
            match_y <= std_logic_vector(best_y);
            match_valid <= '1';  -- Should be properly synchronized
        end if;
    end process;
end Behavioral;