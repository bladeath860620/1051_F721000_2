module main (clock, reset, switch, button, led, hr1, hr0, min1, min0, sec1, sec0);
	input clock, reset, switch;
	input [3:0] button;
	output [7:0] led;
	output [6:0] hr1, hr0, min1, min0, sec1, sec0; //seg

	wire [2:0] area;
	reg finish;
	integer i, j;

	area a(clock, reset, finish, switch, button, area);
	led l(reset, finish, switch, area, led);
	timer t(clock, reset, finish, switch, hr1, hr0, min1, min0, sec1, sec0);

	initial begin
		finish = 0;
	end

	always @(posedge clock) begin
	end
endmodule
