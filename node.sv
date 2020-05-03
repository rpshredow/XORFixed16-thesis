module node(
	input signed [15:0] in1,
	input signed [15:0] in2,
	input signed [15:0] weight1,
	input signed [15:0] weight2,
	input signed [15:0] bias,
	output signed [15:0] out
);

reg signed [31:0] mult1;
reg signed [31:0] mult2;

always @ (in1,in2) begin
	mult1 <= in1 * weight1;
	mult2 <= in2 * weight2;
end

always @ (mult1, mult2) begin
	out <= mult1[25:10] + mult2[25:10] + bias;
end

endmodule