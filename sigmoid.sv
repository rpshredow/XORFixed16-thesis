module sigmoid (
    input signed [15:0] in,
    output signed [15:0] out
);

reg signed [15:0] result;
reg signed [15:0] temp;

always @ (in) begin
	if( in >= 5120 )
		out <= 16'd1024;
	else if( in < 5120 && in >= 2432) begin
		result = (in >> 5);
		out =  result + 16'd864;
	end
	else if( in < 2432 && in >= 1024) begin
		result = (in >> 10) * 13;
		out = result + 16'd640;
	end
	else if( in < 1024 && in >= 0) begin
		result = in >> 2;
		out <= result + 16'd512;
	end
	else if( in < 0 && in >= -1024) begin
		temp = -in;
		result = temp >> 2;
		out <= 16'd512 - result;
	end
	else if( in < -1024 && in >= -2432) begin
		temp = -in;
		result = (temp >> 10) * 13;
		out = 16'd384 - result;
	end
	else if( in < -2432 && in >= -5120) begin
		temp = -in;
		result = (temp >> 5);
		out = 16'd160 - result;
	end
	else if( in < -5120)
		out <= 16'd0;
end
endmodule

