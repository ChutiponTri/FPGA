library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

entity uart_imu_processor_tb is
end uart_imu_processor_tb;

architecture Behavioral of uart_imu_processor_tb is
    -- Component Declaration
    component uart_imu_processor
        Port (
            clk      : in  STD_LOGIC;
            uart_rx  : in  STD_LOGIC;
            uart_tx  : out STD_LOGIC;
            led      : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- Constants
    constant CLK_PERIOD : time := 10 ns;  -- 100 MHz
    constant BIT_PERIOD : time := 8680 ns; -- 115200 baud
    
    -- Test Bench Signals
    signal clk      : STD_LOGIC := '0';
    signal uart_rx  : STD_LOGIC := '1';
    signal uart_tx  : STD_LOGIC;
    signal led      : STD_LOGIC_VECTOR(15 downto 0);
    
    -- Test Cases
    type test_case is record
        input    : string(1 to 4);  -- Fixed to 4 characters
        expected : character;      -- 'A' or 'K'
        leds     : integer;        -- Expected LED value
    end record;
    
    type test_array is array (natural range <>) of test_case;
    constant tests : test_array := (
        ("90" & CR & LF, 'K', 90),   -- CR = x"0D", LF = x"0A"
        ("50" & CR & LF, 'A', 50),
        ("120" & CR, 'K', 120),      -- Just CR for this case
        ("-50" & LF, 'A', 50),      -- Just LF for this case
        ("abc" & CR, 'I', 0)        -- Invalid input
    );
    
    -- ASCII character constants
    constant CR : character := character'val(13); -- Carriage return
    constant LF : character := character'val(10); -- Line feed

begin
    -- Instantiate DUT
    dut: uart_imu_processor
    port map (
        clk => clk,
        uart_rx => uart_rx,
        uart_tx => uart_tx,
        led => led
    );

    -- Clock Generation
    clk <= not clk after CLK_PERIOD/2;

    -- UART RX Simulation Process
    uart_rx_process: process
        procedure uart_send_byte(data : in STD_LOGIC_VECTOR(7 downto 0)) is
        begin
            -- Start bit
            uart_rx <= '0';
            wait for BIT_PERIOD;
            
            -- Data bits
            for i in 0 to 7 loop
                uart_rx <= data(i);
                wait for BIT_PERIOD;
            end loop;
            
            -- Stop bit
            uart_rx <= '1';
            wait for BIT_PERIOD;
        end procedure;
        
        procedure uart_send_string(s : in string) is
        begin
            for i in 1 to s'length loop
                uart_send_byte(std_logic_vector(to_unsigned(character'pos(s(i)), 8)));
                wait for BIT_PERIOD;
            end loop;
        end procedure;
    begin
        wait for 100 ns;
        
        -- Run all test cases
        for i in tests'range loop
            report "TEST CASE " & integer'image(i) & ": Sending '" & 
                   tests(i).input(1 to 2) & "'";  -- Show first 2 chars for display
            uart_send_string(tests(i).input);
            wait for 20*BIT_PERIOD;
        end loop;
        
        wait;
    end process;

    -- UART TX Monitoring Process
    uart_tx_monitor: process
        variable rx_byte : STD_LOGIC_VECTOR(7 downto 0);
        variable expected_byte : STD_LOGIC_VECTOR(7 downto 0);
    begin
        for i in tests'range loop
            -- Wait for transmission to start
            wait until uart_tx = '0' for 30*BIT_PERIOD;
            
            if uart_tx /= '0' then
                report "No response received for test case " & integer'image(i) severity warning;
                next;
            end if;
            
            -- Wait for middle of start bit
            wait for BIT_PERIOD/2;
            assert uart_tx = '0' report "Start bit error" severity error;
            
            -- Wait for full bit period
            wait for BIT_PERIOD;
            
            -- Read 8 data bits
            for j in 0 to 7 loop
                rx_byte(j) := uart_tx;
                wait for BIT_PERIOD;
            end loop;
            
            -- Verify stop bit
            assert uart_tx = '1' report "Stop bit error" severity error;
            
            -- Check against expected results
            expected_byte := std_logic_vector(to_unsigned(character'pos(tests(i).expected), 8));
            if rx_byte = expected_byte then
                report "TEST " & integer'image(i) & " PASSED: Received '" & 
                       character'val(to_integer(unsigned(rx_byte))) & "'";
            else
                report "TEST " & integer'image(i) & " FAILED: Expected '" & 
                       tests(i).expected & "' but received '" & 
                       character'val(to_integer(unsigned(rx_byte))) & "'" 
                       severity error;
            end if;
            
            -- Verify LEDs only for valid numeric inputs
            if tests(i).expected /= 'I' then
                wait for 10*CLK_PERIOD;  -- Allow LED update time
                assert to_integer(unsigned(led(15 downto 4))) = tests(i).leds
                    report "LED value mismatch for test " & integer'image(i) & 
                           ": Expected " & integer'image(tests(i).leds) & 
                           ", got " & integer'image(to_integer(unsigned(led(15 downto 4))))
                    severity error;
            end if;
        end loop;
        
        wait;
    end process;

    -- Timeout and Stop Simulation
    process
    begin
        wait for 500 us;
        report "Simulation completed" severity note;
        std.env.stop;
    end process;

end Behavioral;