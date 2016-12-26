`define MINE 32

module main (clock, switch, reset, hr1, hr0, min1, min0, sec1, sec0);
	input clock, switch, reset;
	output [6:0] hr1, hr0, min1, min0, sec1, sec0; //seg

	reg finish;
	reg [15:0] mine [7:0];
	integer i, j;

	timer t(clock, switch, reset, finish, hr1, hr0, min1, min0, sec1, sec0);

	initial begin
		finish = 0;
		for (i = 0; i < 8; i = i + 1) begin
			mine[i] = 16'b0000000000000000;
			j = $random % 16;
			while (mine[i][j]) begin
				j = $random % 16;
			end
			mine[i][j] = 1;
			j = $random % 16;
			while (mine[i][j]) begin
				j = $random % 16;
			end
			mine[i][j] = 1;
		end
	end

	always @(posedge clock) begin
	end
endmodule
