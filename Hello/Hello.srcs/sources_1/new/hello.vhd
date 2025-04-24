library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_imu_processor is
    Port (
        clk      : in  STD_LOGIC;         -- 100MHz clock
        uart_rx  : in  STD_LOGIC;         -- JA1 (C17)
        uart_tx  : out STD_LOGIC;         -- JA2 (D18)
        led      : out STD_LOGIC_VECTOR(15 downto 0)
    );
end uart_imu_processor;

architecture Behavioral of uart_imu_processor is
    -- Constants for scaled values (divided by 10)
    constant CLK_FREQ   : natural := 100_000_000;
    constant BAUD_RATE  : natural := 115200;
    
    -- Threshold range (70-130 corresponds to 0.7g-1.3g after scaling)
    constant LOWER_THRESHOLD : integer := 70;
    constant UPPER_THRESHOLD : integer := 130;
    
    -- UART Signals
    signal rx_data      : STD_LOGIC_VECTOR(7 downto 0);
    signal rx_done      : STD_LOGIC;
    signal tx_start     : STD_LOGIC := '0';
    signal tx_busy      : STD_LOGIC;
    signal tx_data      : STD_LOGIC_VECTOR(7 downto 0);
    
    -- Number Processing (reduced range for divided values)
    signal number_valid : STD_LOGIC := '0';
    signal is_negative  : STD_LOGIC := '0';
    signal digit_count  : integer range 0 to 3 := 0;  -- Max 3 digits (0-150)
    signal imu_value    : integer range -150 to 150 := 0;
    signal temp_value   : integer range 0 to 150 := 0;
    
    -- Logistic Regression Signal
    signal lr_prediction : STD_LOGIC;
    
    -- Signal for the absolute value
    signal abs_imu_value : integer range 0 to 150;
    
    -- State Machine
    type t_state is (IDLE, CHECK_SIGN, READ_DIGITS, EVALUATE, SEND_RESPONSE);
    signal state : t_state := IDLE;
    
begin
    -- UART Components (unchanged)
    uart_rx_inst: entity work.uart_rx
    generic map (CLK_FREQ => CLK_FREQ, BAUD_RATE => BAUD_RATE)
    port map (clk => clk, rx => uart_rx, data_out => rx_data, done => rx_done);
    
    uart_tx_inst: entity work.uart_tx
    generic map (CLK_FREQ => CLK_FREQ, BAUD_RATE => BAUD_RATE)
    port map (clk => clk, start => tx_start, data => tx_data, tx => uart_tx, busy => tx_busy);
    
    -- Instantiate the logistic regression unit
    lr_unit: entity work.logistic_regression
    port map (
        clk => clk,
        imu_value => abs_imu_value,  -- Use the pre-computed absolute value
        prediction => lr_prediction
    );
    
    -- Compute absolute value of imu_value
    abs_imu_value <= abs(imu_value);

    -- Number Processing State Machine
    process(clk)
        variable digit : integer range 0 to 9;
    begin
        if rising_edge(clk) then
            tx_start <= '0';  -- Default
            
            case state is
                when IDLE =>
                    if rx_done = '1' then
                        -- Reset parsing variables
                        is_negative <= '0';
                        temp_value <= 0;
                        digit_count <= 0;
                        
                        if rx_data = x"2D" then  -- ASCII '-'
                            is_negative <= '1';
                            state <= CHECK_SIGN;
                        else
                            state <= READ_DIGITS;
                        end if;
                    end if;
                
                when CHECK_SIGN =>
                    if rx_done = '1' then
                        state <= READ_DIGITS;
                    end if;
                
                when READ_DIGITS =>
                    if rx_done = '1' then
                        if rx_data >= x"30" and rx_data <= x"39" then
                            digit := to_integer(unsigned(rx_data)) - 48;
                            
                            -- Allow up to 3 digits (for values up to 150)
                            if digit_count < 3 then
                                temp_value <= temp_value * 10 + digit;
                                digit_count <= digit_count + 1;
                            end if;
                        elsif rx_data = x"0D" or rx_data = x"0A" then  -- CR/LF
                            -- Apply division by 10 here (right shift by 1 decimal digit)
                            temp_value <= temp_value / 10;
                            
                            if is_negative = '1' then
                                imu_value <= -temp_value;
                            else
                                imu_value <= temp_value;
                            end if;
                            number_valid <= '1';
                            state <= EVALUATE;
                        else
                            number_valid <= '0';
                            state <= EVALUATE;
                        end if;
                    end if;
                
                when EVALUATE =>
                    if number_valid = '1' then
                        -- Show absolute value on LEDs 4-15
                        led(15 downto 4) <= std_logic_vector(to_unsigned(abs(imu_value), 12));
                        
                        -- Check if LR Prediction is '1'
                        if lr_prediction = '1' then
                            tx_data <= x"4B"; -- 'K'
                        else
                            tx_data <= x"41"; -- 'A'
                        end if;
                    else
                        tx_data <= x"49"; -- 'I'
                    end if;
                    state <= SEND_RESPONSE;
                
                when SEND_RESPONSE =>
                    if tx_busy = '0' then
                        tx_start <= '1';
                        state <= IDLE;
                    end if;
                
                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process;

    -- LED Indicators
    led(0) <= '1' when number_valid = '1' else '0';  -- Number valid
    led(1) <= '1' when tx_data = x"4B" else '0';     -- 'K' sent (in range)
    led(2) <= '1' when tx_data = x"41" else '0';     -- 'A' sent (out of range)
    led(3) <= '1' when tx_data = x"49" else '0';     -- 'I' sent (invalid)
    led(15 downto 4) <= (others => '0');             -- Clear unused LEDs
end Behavioral;