module main (clock, reset, switch, keycol, button, keyrow, row, col, led, hr1, hr0, min1, min0, sec1, sec0);
	input clock, reset, switch;
	input [3:0] keycol;
	input [3:0] button;
	output [3:0] keyrow;
	output [7:0] row;
	output [15:0] col;
	output [7:0] led;
	output [6:0] hr1, hr0, min1, min0, sec1, sec0; //seg

	wire [2:0] area;
	wire [15:0] dot;
	reg finish;

	mat m(clock, reset, finish, switch, area, dot, row, col);
	keypad kp(clock, reset, finish, switch, keycol, keyrow, dot);
	button b(clock, reset, finish, switch, button, area);
	led l(reset, finish, switch, area, led);
	timer t(clock, reset, finish, switch, hr1, hr0, min1, min0, sec1, sec0);

	initial begin
		finish = 0;
	end

	always @(posedge clock) begin
	end
endmodule
