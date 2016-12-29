module button (clock, reset, finish, switch, button, area);
	input clock, reset, finish, switch;
	input [3:0] button;
	output reg [2:0] area;

	reg [3:0] pre;

	initial begin
		area = 3'b000;
		pre = 4'b1111;
	end

	always @(posedge clock) begin
		if      (!reset) begin
			area = 3'b000;
			pre = 4'b1111;
		end
		else if (finish) begin
		end
		else if (switch) begin
			if (pre == button) begin
			end
			else if (button == 4'b0111 && (area <= 3)) begin
				area = area + 3'b100;
			end
			else if (button == 4'b1011 && (area >= 4)) begin
				area = area - 3'b100;
			end
			else if (button == 4'b1101 && (area != 0 && area != 4)) begin
				area = area - 3'b001;
			end
			else if (button == 4'b1110 && (area != 3 && area != 7)) begin
				area = area + 3'b001;
			end
			else begin
			end
			pre = button;
		end
		else begin
		end
	end
endmodule
