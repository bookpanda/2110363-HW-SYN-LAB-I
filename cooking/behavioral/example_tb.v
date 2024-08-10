`include "example.v"

module example_tb;
reg a, b, c, d, e, f;
wire Y;

example DUT(a, b, c, d, e, f, Y); // device under test

initial begin
  $dumpfile("example.vcd");
  $dumpvars(0, example_tb);
  $monitor($time, " a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, Y=%b", a, b, c, d, e, f, Y);

  a=1; b=0; c=0; d=1; e=0; f=0;
  #5
  a=0; b=0; c=1; d=1; e=0; f=0;
  #5
  a=1; c=0;
  #5
  f=1;
  #5
  $finish;
end

endmodule