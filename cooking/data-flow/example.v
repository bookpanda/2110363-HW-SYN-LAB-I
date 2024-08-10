module example(a, b, c, d, e, f, Y);
input a, b, c, d, e, f;
output Y;
wire t1, t2, t3;

nand G1(t1, a, b);
and  G2(t2, c, ~b, d);
nor  G3(t3, e, f);
nand G4(Y, t1, t2, t3);
endmodule