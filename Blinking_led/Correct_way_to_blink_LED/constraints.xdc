## Clock signal
set_property PACKAGE_PIN H16 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 8.000 -name sys_clk_pin -waveform {0 4} [get_ports clk]

## LED output
set_property PACKAGE_PIN R14 [get_ports y]
set_property IOSTANDARD LVCMOS33 [get_ports y]
