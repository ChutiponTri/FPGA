-- UART RX
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_rx is
    Generic (
        CLK_FREQ  : natural := 100_000_000;
        BAUD_RATE : natural := 115200
    );
    Port (
        clk      : in  STD_LOGIC;
        rx       : in  STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR(7 downto 0);  -- Note the port name
        done     : out STD_LOGIC
    );
end uart_rx;

architecture Behavioral of uart_rx is
    constant BIT_TICKS : natural := CLK_FREQ/BAUD_RATE;
    
    type t_state is (IDLE, START, DATA, STOP);
    signal state : t_state := IDLE;
    
    signal bit_count  : natural range 0 to 7 := 0;
    signal tick_count : natural range 0 to BIT_TICKS-1 := 0;
    signal shift_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- Internal buffer
    signal data_buf  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- Output buffer
    
begin
    process(clk)
    begin
        if rising_edge(clk) then
            done <= '0';  -- Default
            
            case state is
                when IDLE =>
                    if rx = '0' then  -- Start bit detected
                        state <= START;
                        tick_count <= 0;
                    end if;
                
                when START =>
                    if tick_count = BIT_TICKS/2 then  -- Sample mid-bit
                        if rx = '0' then  -- Valid start bit
                            state <= DATA;
                            tick_count <= 0;
                            bit_count <= 0;
                        else
                            state <= IDLE;  -- False start
                        end if;
                    else
                        tick_count <= tick_count + 1;
                    end if;
                
                when DATA =>
                    if tick_count = BIT_TICKS-1 then
                        shift_reg(bit_count) <= rx;  -- Store each bit
                        tick_count <= 0;
                        
                        if bit_count = 7 then
                            state <= STOP;
                        else
                            bit_count <= bit_count + 1;
                        end if;
                    else
                        tick_count <= tick_count + 1;
                    end if;
                
                when STOP =>
                    if tick_count = BIT_TICKS-1 then
                        data_buf <= shift_reg;  -- Buffer the complete byte
                        done <= '1';           -- Signal data ready
                        state <= IDLE;
                    else
                        tick_count <= tick_count + 1;
                    end if;
            end case;
        end if;
    end process;
    
    -- Continuous assignment to output port
    data_out <= data_buf;
end Behavioral;


-- UART TX
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is
    Generic (
        CLK_FREQ  : natural := 100_000_000;
        BAUD_RATE : natural := 115200
    );
    Port (
        clk   : in  STD_LOGIC;
        start : in  STD_LOGIC;
        data  : in  STD_LOGIC_VECTOR(7 downto 0);
        tx    : out STD_LOGIC;
        busy  : out STD_LOGIC
    );
end uart_tx;

architecture Behavioral of uart_tx is
    constant BIT_TICKS : natural := CLK_FREQ/BAUD_RATE;
    
    type t_state is (IDLE, START_BIT, DATA_BITS, STOP_BIT);
    signal state : t_state := IDLE;
    
    signal bit_index : natural range 0 to 7 := 0;
    signal tick_counter : natural range 0 to BIT_TICKS-1 := 0;
    signal shreg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
begin
    process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when IDLE =>
                    tx <= '1'; -- Idle high
                    busy <= '0';
                    
                    if start = '1' then
                        state <= START_BIT;
                        shreg <= data;
                        busy <= '1';
                        tick_counter <= 0;
                    end if;
                
                when START_BIT =>
                    tx <= '0';
                    
                    if tick_counter < BIT_TICKS-1 then
                        tick_counter <= tick_counter + 1;
                    else
                        state <= DATA_BITS;
                        tick_counter <= 0;
                        bit_index <= 0;
                    end if;
                
                when DATA_BITS =>
                    tx <= shreg(bit_index);
                    
                    if tick_counter < BIT_TICKS-1 then
                        tick_counter <= tick_counter + 1;
                    else
                        tick_counter <= 0;
                        
                        if bit_index < 7 then
                            bit_index <= bit_index + 1;
                        else
                            state <= STOP_BIT;
                        end if;
                    end if;
                
                when STOP_BIT =>
                    tx <= '1';
                    
                    if tick_counter < BIT_TICKS-1 then
                        tick_counter <= tick_counter + 1;
                    else
                        state <= IDLE;
                    end if;
            end case;
        end if;
    end process;
end Behavioral;


-- Logistic Regression
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity logistic_regression is
    Port (
        clk      : in  STD_LOGIC;
        imu_value: in  integer range -150 to 150;  -- Your scaled IMU value
        prediction: out STD_LOGIC  -- 0 for class A, 1 for class K
    );
end logistic_regression;

architecture Behavioral of logistic_regression is
    -- Autogenerated model parameters
    constant WEIGHT : integer := 4;
    constant BIAS : integer := -340;
    constant SCALE : integer := 1;
    
    -- Fixed-point multiplication helper function
    function fixed_mult(a, b : integer) return integer is
        variable temp : integer;
    begin
        temp := a * b;
        return temp / SCALE;
    end function;
    
    -- Sigmoid approximation (simplified for FPGA)
    function sigmoid(z : integer) return STD_LOGIC is
        constant DECISION_BOUNDARY : integer := 0;  -- Since sigmoid(0) = 0.5
    begin
        if z > DECISION_BOUNDARY then
            return '1';  -- Class K
        else
            return '0';  -- Class A
        end if;
    end function;
    
    signal z : integer := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Calculate z = (weight * x + bias) / scale
            z <= (WEIGHT * imu_value + BIAS) / SCALE;
            
            -- Apply decision boundary
            prediction <= sigmoid(z);
        end if;
    end process;
end Behavioral;