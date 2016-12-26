module led (pos, finish, led);
	input [2:0] pos;
	input finish;
	output reg [7:0] led;

	initial begin
		led = 8'b10000000;
	end

	always @(*) begin
		if (!finish) begin
			led = 8'b00000000;
			led[7-pos] = 1'b1;
		end
		else begin
			led = 8'b11111111;
		end
	end
endmodule
