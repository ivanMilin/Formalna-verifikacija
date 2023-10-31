analyze -vhdl2k lut4.vhd
analyze -vhdl2k v1_z2.vhd
analyze -sv09 top.sv
elaborate -top {top}
clock clk
reset rst
prove -bg -all
