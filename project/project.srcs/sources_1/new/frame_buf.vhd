library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Better for arithmetic operations

-- Dual-Port Frame Buffer
entity frame_buffer is
    generic (
        ADDR_WIDTH : integer := 18;
        DATA_WIDTH : integer := 8
    );
    Port (
        clk      : in std_logic;
        addr_a   : in std_logic_vector(ADDR_WIDTH-1 downto 0);  -- Write port
        din_a    : in std_logic_vector(DATA_WIDTH-1 downto 0);
        we_a     : in std_logic;
        addr_b   : in std_logic_vector(ADDR_WIDTH-1 downto 0);  -- Read port
        dout_b   : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end frame_buffer;

architecture Behavioral of frame_buffer is
    type mem_array is array (0 to 2**ADDR_WIDTH-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
    shared variable memory : mem_array := (others => (others => '0'));
    attribute ram_style : string;
    attribute ram_style of memory : variable is "block";  -- Force BRAM implementation
begin
    -- Port A (Write)
    process(clk)
    begin
        if rising_edge(clk) then
            if we_a = '1' then
                memory(to_integer(unsigned(addr_a))) := din_a;
            end if;
        end if;
    end process;
    
    -- Port B (Read)
    process(clk)
    begin
        if rising_edge(clk) then
            dout_b <= memory(to_integer(unsigned(addr_b)));
        end if;
    end process;
end Behavioral;
