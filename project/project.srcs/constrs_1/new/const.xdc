## System Clock (100 MHz)
set_property -dict { PACKAGE_PIN E3  IOSTANDARD LVCMOS33 } [get_ports clk]  
create_clock -period 10.0 [get_ports clk]  # 100 MHz FPGA clock

## OV7670 Pixel Data on Pmod JA
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports data_in[0]]
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports data_in[1]]
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports data_in[2]]
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports data_in[3]]
set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports data_in[4]]
set_property -dict { PACKAGE_PIN E17 IOSTANDARD LVCMOS33 } [get_ports data_in[5]]
set_property -dict { PACKAGE_PIN F18 IOSTANDARD LVCMOS33 } [get_ports data_in[6]]
set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVCMOS33 } [get_ports data_in[7]]

## Sync & Control on Pmod JB
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports vsync]
set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports href]
set_property -dict { PACKAGE_PIN G16 IOSTANDARD LVCMOS33 } [get_ports pclk]
set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 } [get_ports reset]

## XCLK Output
set_property -dict { PACKAGE_PIN E16 IOSTANDARD LVCMOS33 } [get_ports xclk]

## VGA Sync Signals
set_property -dict { PACKAGE_PIN A3  IOSTANDARD LVCMOS33 } [get_ports hsync]   
set_property -dict { PACKAGE_PIN B3  IOSTANDARD LVCMOS33 } [get_ports vsync_out]  

## VGA Red (4-bit)
set_property -dict { PACKAGE_PIN B6  IOSTANDARD LVCMOS33 } [get_ports red[0]]
set_property -dict { PACKAGE_PIN B7  IOSTANDARD LVCMOS33 } [get_ports red[1]]
set_property -dict { PACKAGE_PIN B8  IOSTANDARD LVCMOS33 } [get_ports red[2]]
set_property -dict { PACKAGE_PIN B9  IOSTANDARD LVCMOS33 } [get_ports red[3]]

## VGA Green (4-bit)
set_property -dict { PACKAGE_PIN C10  IOSTANDARD LVCMOS33 } [get_ports green[0]]
set_property -dict { PACKAGE_PIN C11  IOSTANDARD LVCMOS33 } [get_ports green[1]]
set_property -dict { PACKAGE_PIN C12  IOSTANDARD LVCMOS33 } [get_ports green[2]]
set_property -dict { PACKAGE_PIN C13  IOSTANDARD LVCMOS33 } [get_ports green[3]]

## VGA Blue (4-bit)
set_property -dict { PACKAGE_PIN D10  IOSTANDARD LVCMOS33 } [get_ports blue[0]]
set_property -dict { PACKAGE_PIN D11  IOSTANDARD LVCMOS33 } [get_ports blue[1]]
set_property -dict { PACKAGE_PIN D12  IOSTANDARD LVCMOS33 } [get_ports blue[2]]
set_property -dict { PACKAGE_PIN D13  IOSTANDARD LVCMOS33 } [get_ports blue[3]]

## Push Buttons
set_property -dict { PACKAGE_PIN C14  IOSTANDARD LVCMOS33 } [get_ports btn0]
set_property -dict { PACKAGE_PIN C15  IOSTANDARD LVCMOS33 } [get_ports btn1]

## Slide Switches
set_property -dict { PACKAGE_PIN A16  IOSTANDARD LVCMOS33 } [get_ports switch0]
set_property -dict { PACKAGE_PIN A17  IOSTANDARD LVCMOS33 } [get_ports switch1]


