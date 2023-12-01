analyze -sv09 sv_model.sv
analyze -sv09 bind.sv
analyze -sv09 top.sv
elaborate -top {sv_model}
clock clk
reset rst
prove -bg -all
