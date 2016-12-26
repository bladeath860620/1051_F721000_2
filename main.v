module main (clock, switch, reset, hr1, hr0, min1, min0, sec1, sec0);
	input clock, switch, reset;
	output [6:0] hr1, hr0, min1, min0, sec1, sec0; //seg

	reg finish;

	timer t(clock, switch, reset, finish, hr1, hr0, min1, min0, sec1, sec0);

	initial begin
		finish = 0;
	end

	always @(posedge clock) begin
	end
endmodule
