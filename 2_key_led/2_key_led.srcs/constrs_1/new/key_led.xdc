set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVCMOS33} [get_ports clk]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports rst_n]

set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports led[0]]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports led[1]]
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports led[2]]
set_property -dict {PACKAGE_PIN Y2 IOSTANDARD LVCMOS33} [get_ports led[3]]

set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports key[0]]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports key[1]]
set_property -dict {PACKAGE_PIN W2 IOSTANDARD LVCMOS33} [get_ports key[2]]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports key[3]]