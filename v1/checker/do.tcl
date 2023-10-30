clear -all
analyze -sv09 and_case.sv and_wire.sv and_checker.sv bind.sv
analyze -vhdl and_proc.vhd
# elaborate -top and_case
elaborate -vhdl -top and_proc
clock clk
reset rst
prove -bg -all
