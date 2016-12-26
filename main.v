module main (clock, switch, reset, button4, led, seg5, seg4, seg3, seg2, seg1, seg0);
	input clock, switch, reset;
	input [3:0] button4;
	output [7:0] led;
	output [6:0] seg5, seg4, seg3, seg2, seg1, seg0;

	reg [2:0] pos;
	reg finish;

	button b(switch, reset, button4, pos);
	led l(pos, finish, led);
	timer t(clock, switch, reset, finish, seg5, seg4, seg3, seg2, seg1, seg0);

	initial begin
		pos = 3'b000;
		finish = 1'b0;
	end

	always @(*) begin
		if (finish && switch) begin
			finish = 1'b0;
		end
		else begin
		end
	end
endmodule
