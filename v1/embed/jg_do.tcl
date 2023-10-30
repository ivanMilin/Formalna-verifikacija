analyze -sv "simple_example.sv"
elaborate -top {simple_example}
clock clk -factor 1 -phase 1
reset -expression {rst}
prove -bg -all
