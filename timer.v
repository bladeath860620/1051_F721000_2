module timer (clock, reset, finish, switch, hr1, hr0, min1, min0, sec1, sec0);
	input clock, reset, finish, switch;
	output [6:0] hr1, hr0, min1, min0, sec1, sec0;

	reg [3:0] hr  [1:0];
	reg [3:0] min [1:0];
	reg [3:0] sec [1:0];

	integer cnt;

	seg_decoder sd5(hr[1] , hr1 );
	seg_decoder sd4(hr[0] , hr0 );
	seg_decoder sd3(min[1], min1);
	seg_decoder sd2(min[0], min0);
	seg_decoder sd1(sec[1], sec1);
	seg_decoder sd0(sec[0], sec0);

	initial begin
		hr [1] = 4'b0000;
		hr [0] = 4'b0000;
		min[1] = 4'b0000;
		min[0] = 4'b0000;
		sec[1] = 4'b0000;
		sec[0] = 4'b0000;
		cnt    = 0;
	end

	always @(posedge clock) begin
		if (!reset) begin
			hr [1] = 4'b0000;
			hr [0] = 4'b0000;
			min[1] = 4'b0000;
			min[0] = 4'b0000;
			sec[1] = 4'b0000;
			sec[0] = 4'b0000;
			cnt    = 0;
		end
		else if (finish) begin
			hr [1] = 4'b1000;
			hr [0] = 4'b1000;
			min[1] = 4'b1000;
			min[0] = 4'b1000;
			sec[1] = 4'b1000;
			sec[0] = 4'b1000;
			cnt    = 0;
		end
		else if (switch) begin
			if (cnt == 50000000) begin
				if (sec[0] == 9) begin
					sec[0] = 4'b0000;
					if (sec[1] == 5) begin
						sec[1] = 4'b0000;
						if (min[0] == 9) begin
							min[0] = 4'b0000;
							if (min[1] == 5) begin
								min[1] = 4'b0000;
								if (hr[0] == 9) begin
									hr[0] = 4'b0000;
									if (hr[1] == 9) begin
										hr[1] = 4'b0000;
									end
									else begin
										hr[1] = hr[1] + 4'b0001;
									end
								end
								else begin
									hr[0] = hr[0] + 4'b0001;
								end
							end
							else begin
								min[1] = min[1] + 4'b0001;
							end
						end
						else begin
							min[0] = min[0] + 4'b0001;
						end
					end
					else begin
						sec[1] = sec[1] + 4'b0001;
					end
				end
				else begin
					sec[0] = sec[0] + 4'b0001;
				end
				cnt = 0;
			end
			else begin
				cnt = cnt + 1;
			end
		end
		else begin
		end
	end
endmodule
