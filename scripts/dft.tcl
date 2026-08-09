create_port -port_type scan -direction out {so}
create_port -port_type scan -direction in  {si se tm}

set_scan_configuration -chain_count 1

set_dft_signal -port clk   -type ScanClock -timing [list 45 55]
set_dft_signal -port rst_n -type Reset -active_state 0
set_dft_signal -port si    -type ScanDataIn
set_dft_signal -port so    -type ScanDataOut
set_dft_signal -port se    -type ScanEnable

compile_fusion -to logic_opto
create_test_protocol
preview_dft
insert_dft

