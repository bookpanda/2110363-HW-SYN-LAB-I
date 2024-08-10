# 2110363-HW-SYN-LAB-I

iverilog -o example_tb.vvp example_tb.v
vvp example_tb.vvp

## reg vs wire
```verilog
output reg Y1;
output wire Y2; //or just output Y2;
```
### wire aka net
- cannot hold value by self. It must be driven by continuous assignments (like assign statements) or by outputs of instantiated modules.
- cannot be used in always block (always block requires variables that can store values)
- default value is Z (high impedance state)

### reg
- required when assigning output values in always block