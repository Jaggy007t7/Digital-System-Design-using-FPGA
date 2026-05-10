# Clock
set_property PACKAGE_PIN H16 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

create_clock -period 8.0 -name clk125 [get_ports clk]

# Push button (BTN0 on PYNQ-Z2)
set_property PACKAGE_PIN D19 [get_ports btn]
set_property IOSTANDARD LVCMOS33 [get_ports btn]

# LEDs
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {led[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports led[*]]
