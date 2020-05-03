module sigmoidLUT(
	input [15:0]in,
	output [15:0]out
);

	reg sign;
	reg [14:0]number;

	assign sign = in[15];
	assign number = in[14:0];

	always @ (in) begin
		if(number >= 20480 && sign == 0)
			out <= 4096.0;
		else if(number >= 20070 && number < 20480 && sign == 0)
			out <= 4068;
		else if(number >= 19660 && number < 20070 && sign == 0)
			out <= 4065;
		else if(number >= 19251 && number < 19660 && sign == 0)
			out <= 4062;
		else if(number >= 18841 && number < 19251 && sign == 0)
			out <= 4059;
		else if(number >= 18432 && number < 18841 && sign == 0)
			out <= 4055;
		else if(number >= 18022 && number < 18432 && sign == 0)
			out <= 4050;
		else if(number >= 17612 && number < 18022 && sign == 0)
			out <= 4046;
		else if(number >= 17203 && number < 17612 && sign == 0)
			out <= 4041;
		else if(number >= 16793 && number < 17203 && sign == 0)
			out <= 4035;
		else if(number >= 16384 && number < 16793 && sign == 0)
			out <= 4029;
		else if(number >= 15974 && number < 16384 && sign == 0)
			out <= 4022;
		else if(number >= 15564 && number < 15974 && sign == 0)
			out <= 4014;
		else if(number >= 15155 && number < 15564 && sign == 0)
			out <= 4006;
		else if(number >= 14745 && number < 15155 && sign == 0)
			out <= 3997;
		else if(number >= 14336 && number < 14745 && sign == 0)
			out <= 3987;
		else if(number >= 13926 && number < 14336 && sign == 0)
			out <= 3975;
		else if(number >= 13516 && number < 13926 && sign == 0)
			out <= 3963;
		else if(number >= 13107 && number < 13516 && sign == 0)
			out <= 3950;
		else if(number >= 12697 && number < 13107 && sign == 0)
			out <= 3935;
		else if(number >= 12288 && number < 12697 && sign == 0)
			out <= 3919;
		else if(number >= 11878 && number < 12288 && sign == 0)
			out <= 3901;
		else if(number >= 11468 && number < 11878 && sign == 0)
			out <= 3882;
		else if(number >= 11059 && number < 11468 && sign == 0)
			out <= 3861;
		else if(number >= 10649 && number < 11059 && sign == 0)
			out <= 3838;
		else if(number >= 10240 && number < 10649 && sign == 0)
			out <= 3812;
		else if(number >= 9830 && number < 10240 && sign == 0)
			out <= 3785;
		else if(number >= 9420 && number < 9830 && sign == 0)
			out <= 3755;
		else if(number >= 9011 && number < 9420 && sign == 0)
			out <= 3722;
		else if(number >= 8601 && number < 9011 && sign == 0)
			out <= 3687;
		else if(number >= 8192 && number < 8601 && sign == 0)
			out <= 3649;
		else if(number >= 7782 && number < 8192 && sign == 0)
			out <= 3607;
		else if(number >= 7372 && number < 7782 && sign == 0)
			out <= 3563;
		else if(number >= 6963 && number < 7372 && sign == 0)
			out <= 3514;
		else if(number >= 6553 && number < 6963 && sign == 0)
			out <= 3463;
		else if(number >= 6144 && number < 6553 && sign == 0)
			out <= 3407;
		else if(number >= 5734 && number < 6144 && sign == 0)
			out <= 3348;
		else if(number >= 5324 && number < 5734 && sign == 0)
			out <= 3285;
		else if(number >= 4915 && number < 5324 && sign == 0)
			out <= 3218;
		else if(number >= 4505 && number < 4915 && sign == 0)
			out <= 3147;
		else if(number >= 4096 && number < 4505 && sign == 0)
			out <= 3073;
		else if(number >= 3686 && number < 4096 && sign == 0)
			out <= 2994;
		else if(number >= 3276 && number < 3686 && sign == 0)
			out <= 2912;
		else if(number >= 2867 && number < 3276 && sign == 0)
			out <= 2826;
		else if(number >= 2457 && number < 2867 && sign == 0)
			out <= 2736;
		else if(number >= 2048 && number < 2457 && sign == 0)
			out <= 2644;
		else if(number >= 1638 && number < 2048 && sign == 0)
			out <= 2549;
		else if(number >= 1228 && number < 1638 && sign == 0)
			out <= 2452;
		else if(number >= 819 && number < 1228 && sign == 0)
			out <= 2352;
		else if(number >= 409 && number < 819 && sign == 0)
			out <= 2252;
		else if(number >= 0 && number < 409 && sign == 0)
			out <= 2150;
		else if(number < 409 && number >= 0 && sign == 1)
			out <= 2048;
		else if(number < 819 && number >= 409 && sign == 1)
			out <= 1945;
		else if(number < 1228 && number >= 819 && sign == 1)
			out <= 1843;
		else if(number < 1638 && number >= 1228 && sign == 1)
			out <= 1743;
		else if(number < 2048 && number >= 1638 && sign == 1)
			out <= 1643;
		else if(number < 2457 && number >= 2048 && sign == 1)
			out <= 1546;
		else if(number < 2867 && number >= 2457 && sign == 1)
			out <= 1451;
		else if(number < 3276 && number >= 2867 && sign == 1)
			out <= 1359;
		else if(number < 3686 && number >= 3276 && sign == 1)
			out <= 1269;
		else if(number < 4096 && number >= 3686 && sign == 1)
			out <= 1183;
		else if(number < 4505 && number >= 4096 && sign == 1)
			out <= 1101;
		else if(number < 4915 && number >= 4505 && sign == 1)
			out <= 1022;
		else if(number < 5324 && number >= 4915 && sign == 1)
			out <= 948;
		else if(number < 5734 && number >= 5324 && sign == 1)
			out <= 877;
		else if(number < 6144 && number >= 5734 && sign == 1)
			out <= 810;
		else if(number < 6553 && number >= 6144 && sign == 1)
			out <= 747;
		else if(number < 6963 && number >= 6553 && sign == 1)
			out <= 688;
		else if(number < 7372 && number >= 6963 && sign == 1)
			out <= 632;
		else if(number < 7782 && number >= 7372 && sign == 1)
			out <= 581;
		else if(number < 8192 && number >= 7782 && sign == 1)
			out <= 532;
		else if(number < 8601 && number >= 8192 && sign == 1)
			out <= 488;
		else if(number < 9011 && number >= 8601 && sign == 1)
			out <= 446;
		else if(number < 9420 && number >= 9011 && sign == 1)
			out <= 408;
		else if(number < 9830 && number >= 9420 && sign == 1)
			out <= 373;
		else if(number < 10240 && number >= 9830 && sign == 1)
			out <= 340;
		else if(number < 10649 && number >= 10240 && sign == 1)
			out <= 310;
		else if(number < 11059 && number >= 10649 && sign == 1)
			out <= 283;
		else if(number < 11468 && number >= 11059 && sign == 1)
			out <= 257;
		else if(number < 11878 && number >= 11468 && sign == 1)
			out <= 234;
		else if(number < 12288 && number >= 11878 && sign == 1)
			out <= 213;
		else if(number < 12697 && number >= 12288 && sign == 1)
			out <= 194;
		else if(number < 13107 && number >= 12697 && sign == 1)
			out <= 176;
		else if(number < 13516 && number >= 13107 && sign == 1)
			out <= 160;
		else if(number < 13926 && number >= 13516 && sign == 1)
			out <= 145;
		else if(number < 14336 && number >= 13926 && sign == 1)
			out <= 132;
		else if(number < 14745 && number >= 14336 && sign == 1)
			out <= 120;
		else if(number < 15155 && number >= 14745 && sign == 1)
			out <= 108;
		else if(number < 15564 && number >= 15155 && sign == 1)
			out <= 98;
		else if(number < 15974 && number >= 15564 && sign == 1)
			out <= 89;
		else if(number < 16384 && number >= 15974 && sign == 1)
			out <= 81;
		else if(number < 16793 && number >= 16384 && sign == 1)
			out <= 73;
		else if(number < 17203 && number >= 16793 && sign == 1)
			out <= 66;
		else if(number < 17612 && number >= 17203 && sign == 1)
			out <= 60;
		else if(number < 18022 && number >= 17612 && sign == 1)
			out <= 54;
		else if(number < 18432 && number >= 18022 && sign == 1)
			out <= 49;
		else if(number < 18841 && number >= 18432 && sign == 1)
			out <= 45;
		else if(number < 19251 && number >= 18841 && sign == 1)
			out <= 40;
		else if(number < 19660 && number >= 19251 && sign == 1)
			out <= 36;
		else if(number < 20070 && number >= 19660 && sign == 1)
			out <= 33;
		else if(number < 20480 && number >= 20070 && sign == 1)
			out <= 30;
		else
			out <= 0;
	end
endmodule

