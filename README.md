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


### 7-segment
#### Common cathode
- A-G active high
- AN active low

#### Common anode
- A-G active low
- AN active high

#### Display left -> right
W4 an[3], V4 an[2], U4 an[1], U2 an[0]
