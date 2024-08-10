module example(a, b, c, d, e, f, Y);
input a, b, c, d, e, f;
output reg Y;

// Intermediate signals
reg t1, t2, t3;

always @(*) begin //* = adding all inputs to the sensitivity list, so that the output is updated whenever any of the inputs change
    // Behavioral description of the logic
    t1 = ~(a & b);
    t2 = c & (~b) & d;
    t3 = ~(e | f);   
    Y  = ~(t1 & t2 & t3);
end

endmodule
