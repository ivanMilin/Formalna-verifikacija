clear -all
analyze -sv "simple_example.sv"
elaborate -top {simple_example}
clock clk -factor 1 -phase 1
reset -expression {rst}
assert -name {a0} {r0 == r1};
assert -name {a1} {r0 == r2};
prove -bg -all
