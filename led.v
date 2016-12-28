module led (reset, finish, switch, area, led);
	input reset, finish, switch;
	input [2:0] area;
	output reg [7:0] led;

	initial begin
		led = 8'b10000000;
	end

	always @(*) begin
		if (!reset) begin
			led = 8'b10000000;
		end
		else if (finish) begin
			led = 8'b11111111;
		end
		else if (switch) begin
			case (area)
				0:led = 8'b10000000;
				1:led = 8'b01000000;
				2:led = 8'b00100000;
				3:led = 8'b00010000;
				4:led = 8'b00001000;
				5:led = 8'b00000100;
				6:led = 8'b00000010;
				7:led = 8'b00000001;
				default:;
			endcase
		end
		else begin
		end
	end
endmodule
