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

	reg [15:0] map [7:0];
	reg [15:0] pressed [7:0];
	pressed[0] = 16'b0000000000000000;
	pressed[1] = 16'b0000000000000000;
	pressed[2] = 16'b0000000000000000;
	pressed[3] = 16'b0000000000000000;
	pressed[4] = 16'b0000000000000000;
	pressed[5] = 16'b0000000000000000;
	pressed[6] = 16'b0000000000000000;
	pressed[7] = 16'b0000000000000000;

	mat m(clock, reset, finish, switch, area, dot, row, col, map0, map1, map2, map3, map4, map5, map6, map7, before0, before1, before2, before3, before4, before5, before6, before7, after0, after1, after2, after3, after4, after5, after6, after7, result);
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
