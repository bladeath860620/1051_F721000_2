module timer (clock, switch, reset, finish, seg5, seg4, seg3, seg2, seg1, seg0);
	input clock, switch, reset, finish;
	output [6:0] seg5, seg4, seg3, seg2, seg1, seg0;

	reg [3:0] hr  [1:0];
	reg [3:0] min [1:0];
	reg [3:0] sec [1:0];

	integer cnt;

	seg_decoder sd5(hr[1] , seg5);
	seg_decoder sd4(hr[0] , seg4);
	seg_decoder sd3(min[1], seg3);
	seg_decoder sd2(min[0], seg2);
	seg_decoder sd1(sec[1], seg1);
	seg_decoder sd0(sec[0], seg0);

	initial begin
		hr [1] = 1'b0;
		hr [0] = 1'b0;
		min[1] = 1'b0;
		min[0] = 1'b0;
		sec[1] = 1'b0;
		sec[0] = 1'b0;
		cnt    = 1'b0;
	end

	always @(posedge clock) begin
		if (reset) begin
			if (switch) begin
				if (cnt == 50000000) begin
					sec[0] = sec[0] + 1;
					if (sec[0] == 10) begin
						sec[0] = 1'b0;
						sec[1] = sec[1] + 1'b1;
						if (sec[1] == 6) begin
							sec[1] = 1'b0;
							min[0] = min[0] + 1'b1;
							if (min[0] == 10) begin
								min[0] = 1'b0;
								min[1] = min[1] + 1'b1;
								if (min[1] == 6) begin
									min[1] = 1'b0;
									hr[0] = hr[0] + 1'b1;
									if (hr[0] == 10) begin
										hr[0] = 1'b0;
										hr[1] = hr[1] + 1'b1;
										if (hr[1] == 10) begin
											hr[1] = 1'b0;
										end
										else begin
										end
									end
									else begin
									end
								end
								else begin
								end
							end
							else begin
							end
						end
						else begin
						end
					end
					else begin
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
		else begin
			hr [1] = 1'b0;
			hr [0] = 1'b0;
			min[1] = 1'b0;
			min[0] = 1'b0;
			sec[1] = 1'b0;
			sec[0] = 1'b0;
			cnt    = 0;
		end
		if (finish) begin
			hr [1] = 8;
			hr [0] = 8;
			min[1] = 8;
			min[0] = 8;
			sec[1] = 8;
			sec[0] = 8;
		end
		else begin
		end
	end
endmodule
