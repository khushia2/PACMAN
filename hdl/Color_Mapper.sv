//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size, PacmanX, PacmanY, clydexsig, clydeysig, inkyxsig, inkyysig, pinkyxsig, pinkyysig, blinkyxsig, blinkyysig,
                       output logic [7:0]  Red, Green, Blue,
					   input logic blank, pacman_type,
					   input logic food1on, food2on, food3on, food4on, food5on, food6on, food7on, food8on, food9on, food10on,
					   				food11on, food12on, food13on, food14on, food15on, food16on, food17on, food18on, food19on, food20on,
									food21on, food22on, food23on, food24on, food25on, food26on, food27on, food28on, food29on, food30on,
									food31on, food32on, food33on, food34on, food35on, food36on, food37on, food38on, food39on, food40on,
									food41on, food42on, food43on, food44on, food45on, food46on, food47on,
									food51on, food52on, food53on, food54on, food55on, food56on, food57on,
									food61on, food62on, food63on, food64on, food65on, food66on, food67on,
									food71on, food72on, food73on, food74on, food75on, food76on, food77on,
									food81on, food82on, food83on, food84on, food85on, food86on, food87on,
									food91on, food92on, food93on, food94on, food95on, food96on, food97on,
									food101on, food102on, food103on, food104on, food105on, food106on, food107on,
									food111on, food112on, food113on, food114on, food115on, food116on, food117on,
									food121on, food122on, food123on, food124on, food125on,
									food131on, food132on, food133on, food134on, food135on,
									food141on, food142on, food143on, food144on,
									food151on, food152on, food153on, food154on,
					   input logic [9:0] food1xsig, food1ysig, food2xsig, food2ysig, food3xsig, food3ysig, food4xsig, food4ysig, food5xsig, food5ysig, food6xsig, food6ysig, food7xsig, food7ysig, food8xsig, food8ysig, food9xsig, food9ysig, food10xsig, food10ysig,
					   					food11xsig, food11ysig, food12xsig, food12ysig, food13xsig, food13ysig, food14xsig, food14ysig, food15xsig, food15ysig, food16xsig, food16ysig, food17xsig, food17ysig, food18xsig, food18ysig, food19xsig, food19ysig, food20xsig, food20ysig,
										food21xsig, food21ysig, food22xsig, food22ysig, food23xsig, food23ysig, food24xsig, food24ysig, food25xsig, food25ysig, food26xsig, food26ysig, food27xsig, food27ysig, food28xsig, food28ysig, food29xsig, food29ysig, food30xsig, food30ysig,
										food31xsig, food31ysig, food32xsig, food32ysig, food33xsig, food33ysig, food34xsig, food34ysig, food35xsig, food35ysig, food36xsig, food36ysig, food37xsig, food37ysig, food38xsig, food38ysig, food39xsig, food39ysig, food40xsig, food40ysig,
										food41xsig, food41ysig, food42xsig, food42ysig, food43xsig, food43ysig, food44xsig, food44ysig, food45xsig, food45ysig, food46xsig, food46ysig, food47xsig, food47ysig,
										food51xsig, food51ysig, food52xsig, food52ysig, food53xsig, food53ysig, food54xsig, food54ysig, food55xsig, food55ysig, food56xsig, food56ysig, food57xsig, food57ysig,
										food61xsig, food61ysig, food62xsig, food62ysig, food63xsig, food63ysig, food64xsig, food64ysig, food65xsig, food65ysig, food66xsig, food66ysig, food67xsig, food67ysig,
										food71xsig, food71ysig, food72xsig, food72ysig, food73xsig, food73ysig, food74xsig, food74ysig, food75xsig, food75ysig, food76xsig, food76ysig, food77xsig, food77ysig,
										food81xsig, food81ysig, food82xsig, food82ysig, food83xsig, food83ysig, food84xsig, food84ysig, food85xsig, food85ysig, food86xsig, food86ysig, food87xsig, food87ysig,
										food91xsig, food91ysig, food92xsig, food92ysig, food93xsig, food93ysig, food94xsig, food94ysig, food95xsig, food95ysig, food96xsig, food96ysig, food97xsig, food97ysig,
										food101xsig, food101ysig, food102xsig, food102ysig, food103xsig, food103ysig, food104xsig, food104ysig, food105xsig, food105ysig, food106xsig, food106ysig, food107xsig, food107ysig,
										food111xsig, food111ysig, food112xsig, food112ysig, food113xsig, food113ysig, food114xsig, food114ysig, food115xsig, food115ysig, food116xsig, food116ysig, food117xsig, food117ysig,
										food131xsig, food131ysig, food132xsig, food132ysig, food133xsig, food133ysig, food134xsig, food134ysig, food135xsig, food135ysig,
										food121xsig, food121ysig, food122xsig, food122ysig, food123xsig, food123ysig, food124xsig, food124ysig, food125xsig, food125ysig,
										food141xsig, food141ysig, food142xsig, food142ysig, food143xsig, food143ysig, food144xsig, food144ysig,
										food151xsig, food151ysig, food152xsig, food152ysig, food153xsig, food153ysig, food154xsig, food154ysig,
						input logic game_over,
						input [7:0] score
					    );
    
    logic ball_on;
	logic shape_on;
	logic shape2_on;
	logic [10:0] shape_x = 300;
	logic [10:0] shape_y = 300;
	logic [10:0] shape_size_x = 8;
	logic [10:0] shape_size_y = 16;
	logic [10:0] shape2_x = 200;
	logic [10:0] shape2_y = 200;
	logic [10:0] shape2_size_x = 8;
	logic [10:0] shape2_size_y = 16;

	logic [5:0] one_place;
	logic [5:0] ten_place;
	logic [5:0] hundred_place;

	assign one_place = score % 10;
	assign ten_place = (score / 10) % 10;
	assign hundred_place = (score / 100);
	
	// logic [10:0] sprite_addr;
	// logic [7:0] sprite_data;
	logic [8:0] big_sprite_addr;
	logic [23:0] big_sprite_data;
	logic [1:0] wall_sprite_addr;
	logic [599:0] wall_sprite_data;
	logic [8:0] wall_v_sprite_addr;
	logic [3:0] wall_v_sprite_data;
	logic [6:0] chars_sprite_addr;
	logic [15:0] chars_sprite_data;
	logic [9:0] special_walls_5_1_addr;
	logic [74:0] special_walls_5_1_data;
	logic [9:0] special_walls_5_2_addr;
	logic [74:0] special_walls_5_2_data;
	logic [9:0] special_walls_5_3_addr;
	logic [74:0] special_walls_5_3_data;
	logic [9:0] special_walls_5_4_addr;
	logic [74:0] special_walls_5_4_data;
	logic [7:0] special_walls_2_1_addr;
	logic [3:0] special_walls_2_1_data;
	logic [7:0] special_walls_2_2_addr;
	logic [3:0] special_walls_2_2_data;
	logic [7:0] special_walls_2_3_addr;
	logic [3:0] special_walls_2_3_data;
	logic [7:0] special_walls_2_4_addr;
	logic [3:0] special_walls_2_4_data;
	logic [1:0] special_walls_3_1_addr;
	logic [325:0] special_walls_3_1_data;
	logic [1:0] special_walls_3_2_addr;
	logic [325:0] special_walls_3_2_data;
	logic [1:0] special_walls_4_1_addr;
	logic [74:0] special_walls_4_1_data;
	logic [1:0] special_walls_4_2_addr;
	logic [74:0] special_walls_4_2_data;
	logic [1:0] special_walls_4_3_addr;
	logic [74:0] special_walls_4_3_data;
	logic [1:0] special_walls_4_4_addr;
	logic [74:0] special_walls_4_4_data;
	logic [4:0] special_walls_1_1_addr;
	logic [79:0] special_walls_1_1_data;
	logic [1:0] special_walls_6_1_addr;
	logic [90:0] special_walls_6_1_data;
	logic [1:0] special_walls_6_2_addr;
	logic [90:0] special_walls_6_2_data;
	logic [1:0] special_walls_7_1_addr;
	logic [118:0] special_walls_7_1_data;
	logic [1:0] special_walls_7_2_addr;
	logic [118:0] special_walls_7_2_data;
	logic [1:0] special_walls_8_1_addr;
	logic [88:0] special_walls_8_1_data;
	logic [1:0] special_walls_8_2_addr;
	logic [88:0] special_walls_8_2_data;
	logic [6:0] special_walls_10_1_addr;
	logic [325:0] special_walls_10_1_data;
	logic [6:0] special_walls_10_2_addr;
	logic [325:0] special_walls_10_2_data;
	logic [6:0] game_over_addr;
	logic [7:0] game_over_data;
	logic [7:0] score_addr;
	logic [7:0] score_data;
	logic [3:0] food1_addr;
	logic [7:0] food1_data;
	logic [3:0] food2_addr;
	logic [7:0] food2_data;
	logic [3:0] food3_addr;
	logic [7:0] food3_data;
	logic [3:0] food4_addr;
	logic [7:0] food4_data;
	logic [3:0] food5_addr;
	logic [7:0] food5_data;
	logic [3:0] food6_addr;
	logic [7:0] food6_data;
	logic [3:0] food7_addr;
	logic [7:0] food7_data;
	logic [3:0] food8_addr;
	logic [7:0] food8_data;
	logic [3:0] food9_addr;
	logic [7:0] food9_data;
	logic [3:0] food10_addr;
	logic [7:0] food10_data;
	logic [3:0] food11_addr;
	logic [7:0] food11_data;
	logic [3:0] food12_addr;
	logic [7:0] food12_data;
	logic [3:0] food13_addr;
	logic [7:0] food13_data;
	logic [3:0] food14_addr;
	logic [7:0] food14_data;
	logic [3:0] food15_addr;
	logic [7:0] food15_data;
	logic [3:0] food16_addr;
	logic [7:0] food16_data;
	logic [3:0] food17_addr;
	logic [7:0] food17_data;
	logic [3:0] food18_addr;
	logic [7:0] food18_data;
	logic [3:0] food19_addr;
	logic [7:0] food19_data;
	logic [3:0] food20_addr;
	logic [7:0] food20_data;
	logic [3:0] food21_addr;
	logic [7:0] food21_data;
	logic [3:0] food22_addr;
	logic [7:0] food22_data;
	logic [3:0] food23_addr;
	logic [7:0] food23_data;
	logic [3:0] food24_addr;
	logic [7:0] food24_data;
	logic [3:0] food25_addr;
	logic [7:0] food25_data;
	logic [3:0] food26_addr;
	logic [7:0] food26_data;
	logic [3:0] food27_addr;
	logic [7:0] food27_data;
	logic [3:0] food28_addr;
	logic [7:0] food28_data;
	logic [3:0] food29_addr;
	logic [7:0] food29_data;
	logic [3:0] food30_addr;
	logic [7:0] food30_data;
	logic [3:0] food31_addr;
	logic [7:0] food31_data;
	logic [3:0] food32_addr;
	logic [7:0] food32_data;
	logic [3:0] food33_addr;
	logic [7:0] food33_data;
	logic [3:0] food34_addr;
	logic [7:0] food34_data;
	logic [3:0] food35_addr;
	logic [7:0] food35_data;
	logic [3:0] food36_addr;
	logic [7:0] food36_data;
	logic [3:0] food37_addr;
	logic [7:0] food37_data;
	logic [3:0] food38_addr;
	logic [7:0] food38_data;
	logic [3:0] food39_addr;
	logic [7:0] food39_data;
	logic [3:0] food40_addr;
	logic [7:0] food40_data;
	logic [3:0] food41_addr;
	logic [7:0] food41_data;
	logic [3:0] food42_addr;
	logic [7:0] food42_data;
	logic [3:0] food43_addr;
	logic [7:0] food43_data;
	logic [3:0] food44_addr;
	logic [7:0] food44_data;
	logic [3:0] food45_addr;
	logic [7:0] food45_data;
	logic [3:0] food46_addr;
	logic [7:0] food46_data;
	logic [3:0] food47_addr;
	logic [7:0] food47_data;
	logic [3:0] food51_addr;
	logic [7:0] food51_data;
	logic [3:0] food52_addr;
	logic [7:0] food52_data;
	logic [3:0] food53_addr;
	logic [7:0] food53_data;
	logic [3:0] food54_addr;
	logic [7:0] food54_data;
	logic [3:0] food55_addr;
	logic [7:0] food55_data;
	logic [3:0] food56_addr;
	logic [7:0] food56_data;
	logic [3:0] food57_addr;
	logic [7:0] food57_data;
	logic [3:0] food61_addr;
	logic [7:0] food61_data;
	logic [3:0] food62_addr;
	logic [7:0] food62_data;
	logic [3:0] food63_addr;
	logic [7:0] food63_data;
	logic [3:0] food64_addr;
	logic [7:0] food64_data;
	logic [3:0] food65_addr;
	logic [7:0] food65_data;
	logic [3:0] food66_addr;
	logic [7:0] food66_data;
	logic [3:0] food67_addr;
	logic [7:0] food67_data;
	logic [3:0] food71_addr;
	logic [7:0] food71_data;
	logic [3:0] food72_addr;
	logic [7:0] food72_data;
	logic [3:0] food73_addr;
	logic [7:0] food73_data;
	logic [3:0] food74_addr;
	logic [7:0] food74_data;
	logic [3:0] food75_addr;
	logic [7:0] food75_data;
	logic [3:0] food76_addr;
	logic [7:0] food76_data;
	logic [3:0] food77_addr;
	logic [7:0] food77_data;
	logic [3:0] food81_addr;
	logic [7:0] food81_data;
	logic [3:0] food82_addr;
	logic [7:0] food82_data;
	logic [3:0] food83_addr;
	logic [7:0] food83_data;
	logic [3:0] food84_addr;
	logic [7:0] food84_data;
	logic [3:0] food85_addr;
	logic [7:0] food85_data;
	logic [3:0] food86_addr;
	logic [7:0] food86_data;
	logic [3:0] food87_addr;
	logic [7:0] food87_data;
	logic [3:0] food91_addr;
	logic [7:0] food91_data;
	logic [3:0] food92_addr;
	logic [7:0] food92_data;
	logic [3:0] food93_addr;
	logic [7:0] food93_data;
	logic [3:0] food94_addr;
	logic [7:0] food94_data;
	logic [3:0] food95_addr;
	logic [7:0] food95_data;
	logic [3:0] food96_addr;
	logic [7:0] food96_data;
	logic [3:0] food97_addr;
	logic [7:0] food97_data;
	logic [3:0] food101_addr;
	logic [7:0] food101_data;
	logic [3:0] food102_addr;
	logic [7:0] food102_data;
	logic [3:0] food103_addr;
	logic [7:0] food103_data;
	logic [3:0] food104_addr;
	logic [7:0] food104_data;
	logic [3:0] food105_addr;
	logic [7:0] food105_data;
	logic [3:0] food106_addr;
	logic [7:0] food106_data;
	logic [3:0] food107_addr;
	logic [7:0] food107_data;
	logic [3:0] food111_addr;
	logic [7:0] food111_data;
	logic [3:0] food112_addr;
	logic [7:0] food112_data;
	logic [3:0] food113_addr;
	logic [7:0] food113_data;
	logic [3:0] food114_addr;
	logic [7:0] food114_data;
	logic [3:0] food115_addr;
	logic [7:0] food115_data;
	logic [3:0] food116_addr;
	logic [7:0] food116_data;
	logic [3:0] food117_addr;
	logic [7:0] food117_data;
	logic [3:0] food121_addr;
	logic [7:0] food121_data;
	logic [3:0] food122_addr;
	logic [7:0] food122_data;
	logic [3:0] food123_addr;
	logic [7:0] food123_data;
	logic [3:0] food124_addr;
	logic [7:0] food124_data;
	logic [3:0] food125_addr;
	logic [7:0] food125_data;
	logic [3:0] food131_addr;
	logic [7:0] food131_data;
	logic [3:0] food132_addr;
	logic [7:0] food132_data;
	logic [3:0] food133_addr;
	logic [7:0] food133_data;
	logic [3:0] food134_addr;
	logic [7:0] food134_data;
	logic [3:0] food135_addr;
	logic [7:0] food135_data;
	logic [3:0] food141_addr;
	logic [7:0] food141_data;
	logic [3:0] food142_addr;
	logic [7:0] food142_data;
	logic [3:0] food143_addr;
	logic [7:0] food143_data;
	logic [3:0] food144_addr;
	logic [7:0] food144_data;
	logic [3:0] food151_addr;
	logic [7:0] food151_data;
	logic [3:0] food152_addr;
	logic [7:0] food152_data;
	logic [3:0] food153_addr;
	logic [7:0] food153_data;
	logic [3:0] food154_addr;
	logic [7:0] food154_data;

	logic print_game_over;

	//PACMAN print
	//P
	logic [10:0] start_x_P = 248;
	logic [10:0] start_y_P = 0;
	logic [10:0] shape_size_x_P = 24;
	logic [10:0] shape_size_y_P = 48;
	logic shape_P_on;

	//A
	logic [10:0] start_x_A = 272;
	logic [10:0] start_y_A = 0;
	logic [10:0] shape_size_x_A = 24;
	logic [10:0] shape_size_y_A = 48;
	logic shape_A_on;

	//C
	logic [10:0] start_x_C = 296;
	logic [10:0] start_y_C = 0;
	logic [10:0] shape_size_x_C = 24;
	logic [10:0] shape_size_y_C = 48;
	logic shape_C_on;

	//M
	logic [10:0] start_x_M = 320;
	logic [10:0] start_y_M = 0;
	logic [10:0] shape_size_x_M = 24;
	logic [10:0] shape_size_y_M = 48;
	logic shape_M_on;

	//A2
	logic [10:0] start_x_A2 = 344;
	logic [10:0] start_y_A2 = 0;
	logic [10:0] shape_size_x_A2 = 24;
	logic [10:0] shape_size_y_A2 = 48;
	logic shape_A2_on;

	//N
	logic [10:0] start_x_N = 368;
	logic [10:0] start_y_N = 0;
	logic [10:0] shape_size_x_N = 24;
	logic [10:0] shape_size_y_N = 48;
	logic shape_N_on;

	//Wall
	logic [10:0] start_x_Wall = 10;
	logic [10:0] start_y_Wall = 60;
	logic [10:0] shape_size_x_Wall = 600;
	logic [10:0] shape_size_y_Wall = 4;
	logic shape_Wall_on;

	//Wall 2
	logic [10:0] start_x_Wall2 = 10;
	logic [10:0] start_y_Wall2 = 460;
	logic [10:0] shape_size_x_Wall2 = 600;
	logic [10:0] shape_size_y_Wall2 = 4;
	logic shape_Wall2_on;

	//Wall v
	logic [10:0] start_x_Wallv = 10;
	logic [10:0] start_y_Wallv = 64;
	logic [10:0] shape_size_x_Wallv = 4;
	logic [10:0] shape_size_y_Wallv = 396;
	logic shape_Wallv_on;

	//Wall v 2
	logic [10:0] start_x_Wallv2 = 606;
	logic [10:0] start_y_Wallv2 = 64;
	logic [10:0] shape_size_x_Wallv2 = 4;
	logic [10:0] shape_size_y_Wallv2 = 396;
	logic shape_Wallv2_on;

	//PACMAN Player
	logic pacman_on; 
	logic [10:0] shape_pacman_x = 16;
	logic [10:0] shape_pacman_y = 16;

	//Clyde
	logic clyde_on; 
	logic [10:0] shape_clyde_x = 16;
	logic [10:0] shape_clyde_y = 16;

	//Inky
	logic inky_on; 
	logic [10:0] shape_inky_x = 16;
	logic [10:0] shape_inky_y = 16;

	//Blinky
	logic blinky_on; 
	logic [10:0] shape_blinky_x = 16;
	logic [10:0] shape_blinky_y = 16;

	//Pinky
	logic pinky_on; 
	logic [10:0] shape_pinky_x = 16;
	logic [10:0] shape_pinky_y = 16;

	//Special Walls 5 1
	logic special_walls_5_1_on; 
	logic [10:0] start_x_sw51 = 32;
	logic [10:0] start_y_sw51 = 82;
	logic [10:0] shape_size_x_sw51 = 75;
	logic [10:0] shape_size_y_sw51 = 171;

	//Special Walls 5 2
	logic special_walls_5_2_on; 
	logic [10:0] start_x_sw52 = 32;
	logic [10:0] start_y_sw52 = 271;
	logic [10:0] shape_size_x_sw52 = 75;
	logic [10:0] shape_size_y_sw52 = 171;

	//Special Walls 5 3
	logic special_walls_5_3_on; 
	logic [10:0] start_x_sw53 = 513;
	logic [10:0] start_y_sw53 = 82;
	logic [10:0] shape_size_x_sw53 = 75;
	logic [10:0] shape_size_y_sw53 = 171;

	//Special Walls 5 4
	logic special_walls_5_4_on; 
	logic [10:0] start_x_sw54 = 513;
	logic [10:0] start_y_sw54 = 271;
	logic [10:0] shape_size_x_sw54 = 75;
	logic [10:0] shape_size_y_sw54 = 171;

	//Special Walls 2 1
	logic special_walls_2_1_on; 
	logic [10:0] start_x_sw21 = 125;
	logic [10:0] start_y_sw21 = 64;
	logic [10:0] shape_size_x_sw21 = 4;
	logic [10:0] shape_size_y_sw21 = 167;

	//Special Walls 2 2
	logic special_walls_2_2_on; 
	logic [10:0] start_x_sw22 = 125;
	logic [10:0] start_y_sw22 = 293;
	logic [10:0] shape_size_x_sw22 = 4;
	logic [10:0] shape_size_y_sw22 = 167;

	//Special Walls 2 3
	logic special_walls_2_3_on; 
	logic [10:0] start_x_sw23 = 491;
	logic [10:0] start_y_sw23 = 64;
	logic [10:0] shape_size_x_sw23 = 4;
	logic [10:0] shape_size_y_sw23 = 167;
	
	//Special Walls 2 4
	logic special_walls_2_4_on; 
	logic [10:0] start_x_sw24 = 491;
	logic [10:0] start_y_sw24 = 293;
	logic [10:0] shape_size_x_sw24 = 4;
	logic [10:0] shape_size_y_sw24 = 167;

	//Special Walls 3 1
	logic special_walls_3_1_on; 
	logic [10:0] start_x_sw31 = 147;
	logic [10:0] start_y_sw31 = 82;
	logic [10:0] shape_size_x_sw31 = 326;
	logic [10:0] shape_size_y_sw31 = 4;
	
	//Special Walls 3 2
	logic special_walls_3_2_on; 
	logic [10:0] start_x_sw32 = 147;
	logic [10:0] start_y_sw32 = 438;
	logic [10:0] shape_size_x_sw32 = 326;
	logic [10:0] shape_size_y_sw32 = 4;

	//Special Walls 4 1
	logic special_walls_4_1_on; 
	logic [10:0] start_x_sw41 = 54;
	logic [10:0] start_y_sw41 = 249;
	logic [10:0] shape_size_x_sw41 = 75;
	logic [10:0] shape_size_y_sw41 = 4;

	//Special Walls 4 2
	logic special_walls_4_2_on; 
	logic [10:0] start_x_sw42 = 54;
	logic [10:0] start_y_sw42 = 271;
	logic [10:0] shape_size_x_sw42 = 75;
	logic [10:0] shape_size_y_sw42 = 4;

	//Special Walls 4 3
	logic special_walls_4_3_on; 
	logic [10:0] start_x_sw43 = 491;
	logic [10:0] start_y_sw43 = 249;
	logic [10:0] shape_size_x_sw43 = 75;
	logic [10:0] shape_size_y_sw43 = 4;

	//Special Walls 4 4
	logic special_walls_4_4_on; 
	logic [10:0] start_x_sw44 = 491;
	logic [10:0] start_y_sw44 = 271;
	logic [10:0] shape_size_x_sw44 = 75;
	logic [10:0] shape_size_y_sw44 = 4;

	//Special Wall 1 1
	logic special_walls_1_1_on; 
	logic [10:0] start_x_sw1 = 256;
	logic [10:0] start_y_sw1 = 249;
	logic [10:0] shape_size_x_sw1 = 80;
	logic [10:0] shape_size_y_sw1 = 26;

	//Special Wall 6 1
	logic special_walls_6_1_on; 
	logic [10:0] start_x_sw61 = 147;
	logic [10:0] start_y_sw61 = 249;
	logic [10:0] shape_size_x_sw61 = 91;
	logic [10:0] shape_size_y_sw61 = 4;

	//Special Wall 6 2
	logic special_walls_6_2_on; 
	logic [10:0] start_x_sw62 = 147;
	logic [10:0] start_y_sw62 = 271;
	logic [10:0] shape_size_x_sw62 = 91;
	logic [10:0] shape_size_y_sw62 = 4;
	
	//Special Wall 7 1
	logic special_walls_7_1_on; 
	logic [10:0] start_x_sw71 = 354;
	logic [10:0] start_y_sw71 = 249;
	logic [10:0] shape_size_x_sw71 = 119;
	logic [10:0] shape_size_y_sw71 = 4;

	//Special Wall 7 2
	logic special_walls_7_2_on; 
	logic [10:0] start_x_sw72 = 354;
	logic [10:0] start_y_sw72 = 271;
	logic [10:0] shape_size_x_sw72 = 119;
	logic [10:0] shape_size_y_sw72 = 4;

	//Special Wall 8 1
	logic special_walls_8_1_on; 
	logic [10:0] start_x_sw81 = 147;
	logic [10:0] start_y_sw81 = 416;
	logic [10:0] shape_size_x_sw81 = 326;
	logic [10:0] shape_size_y_sw81 = 4;

	//Special Wall 8 2
	logic special_walls_8_2_on; 
	logic [10:0] start_x_sw82 = 147;
	logic [10:0] start_y_sw82 = 104;
	logic [10:0] shape_size_x_sw82 = 326;
	logic [10:0] shape_size_y_sw82 = 4;

	//Special Wall 10 1
	logic special_walls_10_1_on; 
	logic [10:0] start_x_sw101 = 147;
	logic [10:0] start_y_sw101 = 126;
	logic [10:0] shape_size_x_sw101 = 326;
	logic [10:0] shape_size_y_sw101 = 105;

	//Special Wall 10 2
	logic special_walls_10_2_on; 
	logic [10:0] start_x_sw102 = 147;
	logic [10:0] start_y_sw102 = 293;
	logic [10:0] shape_size_x_sw102 = 326;
	logic [10:0] shape_size_y_sw102 = 105;

	//Food
	logic [10:0] shape_size_x_food = 8;
	logic [10:0] shape_size_y_food = 16;

	//Game Over Print
	//G
	logic [10:0] start_x_g = 18;
	logic [10:0] start_y_g = 44;
	logic [10:0] shape_size_x_go = 8;
	logic [10:0] shape_size_y_go = 16;

	//A
	logic [10:0] start_x_a = 26;
	logic [10:0] start_y_a = 44;
	
	//M
	logic [10:0] start_x_m = 34;
	logic [10:0] start_y_m = 44;

	//E
	logic [10:0] start_x_e = 42;
	logic [10:0] start_y_e = 44;

	//O
	logic [10:0] start_x_o = 54;
	logic [10:0] start_y_o = 44;

	//V
	logic [10:0] start_x_v = 62;
	logic [10:0] start_y_v = 44;

	//E
	logic [10:0] start_x_e2 = 70;
	logic [10:0] start_y_e2 = 44;

	//R
	logic [10:0] start_x_r = 78;
	logic [10:0] start_y_r = 44;

	//Score Print
	//S
	logic [10:0] start_score_x_S = 506;
	logic [10:0] start_score_y_S = 44; 
	logic [10:0] shape_size_x_score = 8;
	logic [10:0] shape_size_y_score = 16;
	logic score_S_on;

	//c
	logic [10:0] start_score_x_c = 514;
	logic [10:0] start_score_y_c = 44;
	logic score_c_on;
	
	//o
	logic [10:0] start_score_x_o = 522;
	logic [10:0] start_score_y_o = 44;
	logic score_o_on;

	//r
	logic [10:0] start_score_x_r = 530;
	logic [10:0] start_score_y_r = 44;
	logic score_r_on;

	//e
	logic [10:0] start_score_x_e = 538;
	logic [10:0] start_score_y_e = 44;
	logic score_e_on;

	//:
	logic [10:0] start_score_x_colon = 546;
	logic [10:0] start_score_y_colon = 44;
	logic score_colon_on;

	//hundreds
	logic [10:0] start_score_x_100 = 558;
	logic [10:0] start_score_y_100 = 44;
	logic score_100_on;

	//tens
	logic [10:0] start_score_x_10 = 566;
	logic [10:0] start_score_y_10 = 44;
	logic score_10_on;

	//zeroth
	logic [10:0] start_score_x_1 = 574;
	logic [10:0] start_score_y_1 = 44;
	logic score_1_on;

	// font_rom fontrom (
	// 	.addr(sprite_addr),
	// 	.data(sprite_data)
	// );

	bigfont_rom bigfont_rom (
		.addr(big_sprite_addr),
		.data(big_sprite_data)
	);

	wall_rom wall_rom (
		.addr(wall_sprite_addr),
		.data(wall_sprite_data)
	);

	wall_v_rom wall_v_rom (
		.addr(wall_v_sprite_addr),
		.data(wall_v_sprite_data)
	);

	characters_rom characters_rom (
		.addr(chars_sprite_addr),
		.data(chars_sprite_data)
	);

	special_walls_5_rom special_walls_5_1_rom (
		.addr(special_walls_5_1_addr),
		.data(special_walls_5_1_data)	
	);

	special_walls_5_rom special_walls_5_2_rom (
		.addr(special_walls_5_2_addr),
		.data(special_walls_5_2_data)	
	);

	special_walls_5_rom special_walls_5_3_rom (
		.addr(special_walls_5_3_addr),
		.data(special_walls_5_3_data)	
	);

	special_walls_5_rom special_walls_5_4_rom (
		.addr(special_walls_5_4_addr),
		.data(special_walls_5_4_data)	
	);

	special_walls_2_rom special_walls_2_1_rom (
		.addr(special_walls_2_1_addr),
		.data(special_walls_2_1_data)	
	);

	special_walls_2_rom special_walls_2_2_rom (
		.addr(special_walls_2_2_addr),
		.data(special_walls_2_2_data)	
	);

	special_walls_2_rom special_walls_2_3_rom (
		.addr(special_walls_2_3_addr),
		.data(special_walls_2_3_data)	
	);

	special_walls_2_rom special_walls_2_4_rom (
		.addr(special_walls_2_4_addr),
		.data(special_walls_2_4_data)	
	);

	special_walls_3_rom special_walls_3_1_rom (
		.addr(special_walls_3_1_addr),
		.data(special_walls_3_1_data)	
	);

	special_walls_3_rom special_walls_3_2_rom (
		.addr(special_walls_3_2_addr),
		.data(special_walls_3_2_data)	
	);

	special_walls_4_rom special_walls_4_1_rom (
		.addr(special_walls_4_1_addr),
		.data(special_walls_4_1_data)	
	);

	special_walls_4_rom special_walls_4_2_rom (
		.addr(special_walls_4_2_addr),
		.data(special_walls_4_2_data)	
	);

	special_walls_4_rom special_walls_4_3_rom (
		.addr(special_walls_4_3_addr),
		.data(special_walls_4_3_data)	
	);

	special_walls_4_rom special_walls_4_4_rom (
		.addr(special_walls_4_4_addr),
		.data(special_walls_4_4_data)	
	);

	special_walls_1_rom special_walls_1_1_rom (
		.addr(special_walls_1_1_addr),
		.data(special_walls_1_1_data)	
	);

	special_walls_6_rom special_walls_6_1_rom (
		.addr(special_walls_6_1_addr),
		.data(special_walls_6_1_data)	
	);

	special_walls_6_rom special_walls_6_2_rom (
		.addr(special_walls_6_2_addr),
		.data(special_walls_6_2_data)	
	);
	
	special_walls_7_rom special_walls_7_1_rom (
		.addr(special_walls_7_1_addr),
		.data(special_walls_7_1_data)	
	);

	special_walls_7_rom special_walls_7_2_rom (
		.addr(special_walls_7_2_addr),
		.data(special_walls_7_2_data)	
	);

	special_walls_3_rom special_walls_8_1_rom (
		.addr(special_walls_8_1_addr),
		.data(special_walls_8_1_data)	
	);

	special_walls_3_rom special_walls_8_2_rom (
		.addr(special_walls_8_2_addr),
		.data(special_walls_8_2_data)	
	);

	special_walls_10_rom special_walls_10_1_rom (
		.addr(special_walls_10_1_addr),
		.data(special_walls_10_1_data)	
	);

	special_walls_10_rom special_walls_10_2_rom (
		.addr(special_walls_10_2_addr),
		.data(special_walls_10_2_data)	
	);

	food_rom food1 (
		.addr(food1_addr),
		.data(food1_data)	
	);

	food_rom food2 (
		.addr(food2_addr),
		.data(food2_data)	
	);

	food_rom food3 (
		.addr(food3_addr),
		.data(food3_data)	
	);
	
	food_rom food4 (
		.addr(food4_addr),
		.data(food4_data)	
	);
	
	food_rom food5 (
		.addr(food5_addr),
		.data(food5_data)	
	);

	food_rom food6 (
		.addr(food6_addr),
		.data(food6_data)	
	);

	food_rom food7 (
		.addr(food7_addr),
		.data(food7_data)	
	);

	food_rom food8 (
		.addr(food8_addr),
		.data(food8_data)	
	);

	food_rom food9 (
		.addr(food9_addr),
		.data(food9_data)	
	);

	food_rom food10 (
		.addr(food10_addr),
		.data(food10_data)	
	);

	food_rom food11 (
		.addr(food11_addr),
		.data(food11_data)	
	);

	food_rom food12 (
		.addr(food12_addr),
		.data(food12_data)	
	);

	food_rom food13 (
		.addr(food13_addr),
		.data(food13_data)	
	);
	
	food_rom food14 (
		.addr(food14_addr),
		.data(food14_data)	
	);
	
	food_rom food15 (
		.addr(food15_addr),
		.data(food15_data)	
	);

	food_rom food16 (
		.addr(food16_addr),
		.data(food16_data)	
	);

	food_rom food17 (
		.addr(food17_addr),
		.data(food17_data)	
	);

	food_rom food18 (
		.addr(food18_addr),
		.data(food18_data)	
	);

	food_rom food19 (
		.addr(food19_addr),
		.data(food19_data)	
	);

	food_rom food20 (
		.addr(food20_addr),
		.data(food20_data)	
	);
	
	food_rom food21 (
		.addr(food21_addr),
		.data(food21_data)	
	);

	food_rom food22 (
		.addr(food22_addr),
		.data(food22_data)	
	);

	food_rom food23 (
		.addr(food23_addr),
		.data(food23_data)	
	);
	
	food_rom food24 (
		.addr(food24_addr),
		.data(food24_data)	
	);
	
	food_rom food25 (
		.addr(food25_addr),
		.data(food25_data)	
	);

	food_rom food26 (
		.addr(food26_addr),
		.data(food26_data)	
	);

	food_rom food27 (
		.addr(food27_addr),
		.data(food27_data)	
	);

	food_rom food28 (
		.addr(food28_addr),
		.data(food28_data)	
	);

	food_rom food29 (
		.addr(food29_addr),
		.data(food29_data)	
	);

	food_rom food30 (
		.addr(food30_addr),
		.data(food30_data)	
	);

	food_rom food31 (
		.addr(food31_addr),
		.data(food31_data)	
	);

	food_rom food32 (
		.addr(food32_addr),
		.data(food32_data)	
	);

	food_rom food33 (
		.addr(food33_addr),
		.data(food33_data)	
	);
	
	food_rom food34 (
		.addr(food34_addr),
		.data(food34_data)	
	);
	
	food_rom food35 (
		.addr(food35_addr),
		.data(food35_data)	
	);

	food_rom food36 (
		.addr(food36_addr),
		.data(food36_data)	
	);

	food_rom food37 (
		.addr(food37_addr),
		.data(food37_data)	
	);

	food_rom food38 (
		.addr(food38_addr),
		.data(food38_data)	
	);

	food_rom food39 (
		.addr(food39_addr),
		.data(food39_data)	
	);

	food_rom food40 (
		.addr(food40_addr),
		.data(food40_data)	
	);

	food_rom food41 (
		.addr(food41_addr),
		.data(food41_data)	
	);

	food_rom food42 (
		.addr(food42_addr),
		.data(food42_data)	
	);

	food_rom food43 (
		.addr(food43_addr),
		.data(food43_data)	
	);
	
	food_rom food44 (
		.addr(food44_addr),
		.data(food44_data)	
	);
	
	food_rom food45 (
		.addr(food45_addr),
		.data(food45_data)	
	);

	food_rom food46 (
		.addr(food46_addr),
		.data(food46_data)	
	);

	food_rom food47 (
		.addr(food47_addr),
		.data(food47_data)	
	);

	food_rom food51 (
		.addr(food51_addr),
		.data(food51_data)	
	);

	food_rom food52 (
		.addr(food52_addr),
		.data(food52_data)	
	);

	food_rom food53 (
		.addr(food53_addr),
		.data(food53_data)	
	);
	
	food_rom food54 (
		.addr(food54_addr),
		.data(food54_data)	
	);
	
	food_rom food55 (
		.addr(food55_addr),
		.data(food55_data)	
	);

	food_rom food56 (
		.addr(food56_addr),
		.data(food56_data)	
	);

	food_rom food57 (
		.addr(food57_addr),
		.data(food57_data)	
	);

	food_rom food61 (
		.addr(food61_addr),
		.data(food61_data)	
	);

	food_rom food62 (
		.addr(food62_addr),
		.data(food62_data)	
	);

	food_rom food63 (
		.addr(food63_addr),
		.data(food63_data)	
	);
	
	food_rom food64 (
		.addr(food64_addr),
		.data(food64_data)	
	);
	
	food_rom food65 (
		.addr(food65_addr),
		.data(food65_data)	
	);

	food_rom food66 (
		.addr(food66_addr),
		.data(food66_data)	
	);

	food_rom food67 (
		.addr(food67_addr),
		.data(food67_data)	
	);
	
	food_rom food71 (
		.addr(food71_addr),
		.data(food71_data)	
	);

	food_rom food72 (
		.addr(food72_addr),
		.data(food72_data)	
	);

	food_rom food73 (
		.addr(food73_addr),
		.data(food73_data)	
	);
	
	food_rom food74 (
		.addr(food74_addr),
		.data(food74_data)	
	);
	
	food_rom food75 (
		.addr(food75_addr),
		.data(food75_data)	
	);

	food_rom food76 (
		.addr(food76_addr),
		.data(food76_data)	
	);

	food_rom food77 (
		.addr(food77_addr),
		.data(food77_data)	
	);

	food_rom food81 (
		.addr(food81_addr),
		.data(food81_data)	
	);

	food_rom food82 (
		.addr(food82_addr),
		.data(food82_data)	
	);

	food_rom food83 (
		.addr(food83_addr),
		.data(food83_data)	
	);
	
	food_rom food84 (
		.addr(food84_addr),
		.data(food84_data)	
	);
	
	food_rom food85 (
		.addr(food85_addr),
		.data(food85_data)	
	);

	food_rom food86 (
		.addr(food86_addr),
		.data(food86_data)	
	);

	food_rom food87 (
		.addr(food87_addr),
		.data(food87_data)	
	);

	food_rom food91 (
		.addr(food91_addr),
		.data(food91_data)	
	);

	food_rom food92 (
		.addr(food92_addr),
		.data(food92_data)	
	);

	food_rom food93 (
		.addr(food93_addr),
		.data(food93_data)	
	);
	
	food_rom food94 (
		.addr(food94_addr),
		.data(food94_data)	
	);
	
	food_rom food95 (
		.addr(food95_addr),
		.data(food95_data)	
	);

	food_rom food96 (
		.addr(food96_addr),
		.data(food96_data)	
	);

	food_rom food97 (
		.addr(food97_addr),
		.data(food97_data)	
	);

	food_rom food101 (
		.addr(food101_addr),
		.data(food101_data)	
	);

	food_rom food102 (
		.addr(food102_addr),
		.data(food102_data)	
	);

	food_rom food103 (
		.addr(food103_addr),
		.data(food103_data)	
	);
	
	food_rom food104 (
		.addr(food104_addr),
		.data(food104_data)	
	);
	
	food_rom food105 (
		.addr(food105_addr),
		.data(food105_data)	
	);

	food_rom food106 (
		.addr(food106_addr),
		.data(food106_data)	
	);

	food_rom food107 (
		.addr(food107_addr),
		.data(food107_data)	
	);

	food_rom food111 (
		.addr(food111_addr),
		.data(food111_data)	
	);

	food_rom food112 (
		.addr(food112_addr),
		.data(food112_data)	
	);

	food_rom food113 (
		.addr(food113_addr),
		.data(food113_data)	
	);
	
	food_rom food114 (
		.addr(food114_addr),
		.data(food114_data)	
	);
	
	food_rom food115 (
		.addr(food115_addr),
		.data(food115_data)	
	);

	food_rom food116 (
		.addr(food116_addr),
		.data(food116_data)	
	);

	food_rom food117 (
		.addr(food117_addr),
		.data(food117_data)	
	);

	food_rom food121 (
		.addr(food121_addr),
		.data(food121_data)	
	);

	food_rom food122 (
		.addr(food122_addr),
		.data(food122_data)	
	);

	food_rom food123 (
		.addr(food123_addr),
		.data(food123_data)	
	);
	
	food_rom food124 (
		.addr(food124_addr),
		.data(food124_data)	
	);
	
	food_rom food125 (
		.addr(food125_addr),
		.data(food125_data)	
	);

	food_rom food131 (
		.addr(food131_addr),
		.data(food131_data)	
	);

	food_rom food132 (
		.addr(food132_addr),
		.data(food132_data)	
	);

	food_rom food133 (
		.addr(food133_addr),
		.data(food133_data)	
	);
	
	food_rom food134 (
		.addr(food134_addr),
		.data(food134_data)	
	);
	
	food_rom food135 (
		.addr(food135_addr),
		.data(food135_data)	
	);

	food_rom food141 (
		.addr(food141_addr),
		.data(food141_data)	
	);

	food_rom food142 (
		.addr(food142_addr),
		.data(food142_data)	
	);

	food_rom food143 (
		.addr(food143_addr),
		.data(food143_data)	
	);
	
	food_rom food144 (
		.addr(food144_addr),
		.data(food144_data)	
	);

	food_rom food151 (
		.addr(food151_addr),
		.data(food151_data)	
	);

	food_rom food152 (
		.addr(food152_addr),
		.data(food152_data)	
	);

	food_rom food153 (
		.addr(food153_addr),
		.data(food153_data)	
	);
	
	food_rom food154 (
		.addr(food154_addr),
		.data(food154_data)	
	);

	game_over_rom game_over_rom (
		.addr(game_over_addr),
		.data(game_over_data)	
	);
	
	numbers_rom numbers_rom(
		.addr(score_addr),
		.data(score_data)	
	);

 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;

	function void default_values();
		shape_on = 1'b0;
		shape2_on = 1'b0;
		// sprite_addr = 11'b0;
		big_sprite_addr = 9'b0;
		wall_sprite_addr = 2'b0;
		wall_v_sprite_addr = 9'b0;
		chars_sprite_addr = 6'b0;
		special_walls_5_1_addr = 10'b0;
		special_walls_5_2_addr = 10'b0;
		special_walls_5_3_addr = 10'b0;
		special_walls_5_4_addr = 10'b0;
		special_walls_2_1_addr = 8'b0;
		special_walls_2_2_addr = 8'b0;
		special_walls_2_3_addr = 8'b0;
		special_walls_2_4_addr = 8'b0;
		special_walls_3_1_addr = 2'b0;
		special_walls_3_2_addr = 2'b0;
		special_walls_4_1_addr = 2'b0;
		special_walls_4_2_addr = 2'b0;
		special_walls_4_3_addr = 2'b0;
		special_walls_4_4_addr = 2'b0;
		special_walls_1_1_addr = 5'b0;
		special_walls_6_1_addr = 2'b0;
		special_walls_6_2_addr = 2'b0;
		special_walls_7_1_addr = 2'b0;
		special_walls_7_2_addr = 2'b0;
		special_walls_8_1_addr = 2'b0;
		special_walls_8_2_addr = 2'b0;
		special_walls_10_1_addr = 7'b0;
		special_walls_10_2_addr = 7'b0;
		game_over_addr = 7'b0;
		score_addr = 8'b0;
		print_game_over = 1'b0;
		food1_addr = 4'b0;
		food2_addr = 4'b0;
		food3_addr = 4'b0;
		food4_addr = 4'b0;
		food5_addr = 4'b0;
		food6_addr = 4'b0;
		food7_addr = 4'b0;
		food8_addr = 4'b0;
		food9_addr = 4'b0;
		food10_addr = 4'b0;
		food11_addr = 4'b0;
		food12_addr = 4'b0;
		food13_addr = 4'b0;
		food14_addr = 4'b0;
		food15_addr = 4'b0;
		food16_addr = 4'b0;
		food17_addr = 4'b0;
		food18_addr = 4'b0;
		food19_addr = 4'b0;
		food20_addr = 4'b0;
		food21_addr = 4'b0;
		food22_addr = 4'b0;
		food23_addr = 4'b0;
		food24_addr = 4'b0;
		food25_addr = 4'b0;
		food26_addr = 4'b0;
		food27_addr = 4'b0;
		food28_addr = 4'b0;
		food29_addr = 4'b0;
		food30_addr = 4'b0;
		food31_addr = 4'b0;
		food32_addr = 4'b0;
		food33_addr = 4'b0;
		food34_addr = 4'b0;
		food35_addr = 4'b0;
		food36_addr = 4'b0;
		food37_addr = 4'b0;
		food38_addr = 4'b0;
		food39_addr = 4'b0;
		food40_addr = 4'b0;
		food41_addr = 4'b0;
		food42_addr = 4'b0;
		food43_addr = 4'b0;
		food44_addr = 4'b0;
		food45_addr = 4'b0;
		food46_addr = 4'b0;
		food47_addr = 4'b0;
		food51_addr = 4'b0;
		food52_addr = 4'b0;
		food53_addr = 4'b0;
		food54_addr = 4'b0;
		food55_addr = 4'b0;
		food56_addr = 4'b0;
		food57_addr = 4'b0;
		food61_addr = 4'b0;
		food62_addr = 4'b0;
		food63_addr = 4'b0;
		food64_addr = 4'b0;
		food65_addr = 4'b0;
		food66_addr = 4'b0;
		food67_addr = 4'b0;
		food71_addr = 4'b0;
		food72_addr = 4'b0;
		food73_addr = 4'b0;
		food74_addr = 4'b0;
		food75_addr = 4'b0;
		food76_addr = 4'b0;
		food77_addr = 4'b0;
		food81_addr = 4'b0;
		food82_addr = 4'b0;
		food83_addr = 4'b0;
		food84_addr = 4'b0;
		food85_addr = 4'b0;
		food86_addr = 4'b0;
		food87_addr = 4'b0;
		food91_addr = 4'b0;
		food92_addr = 4'b0;
		food93_addr = 4'b0;
		food94_addr = 4'b0;
		food95_addr = 4'b0;
		food96_addr = 4'b0;
		food97_addr = 4'b0;
		food101_addr = 4'b0;
		food102_addr = 4'b0;
		food103_addr = 4'b0;
		food104_addr = 4'b0;
		food105_addr = 4'b0;
		food106_addr = 4'b0;
		food107_addr = 4'b0;
		food111_addr = 4'b0;
		food112_addr = 4'b0;
		food113_addr = 4'b0;
		food114_addr = 4'b0;
		food115_addr = 4'b0;
		food116_addr = 4'b0;
		food117_addr = 4'b0;
		food121_addr = 4'b0;
		food122_addr = 4'b0;
		food123_addr = 4'b0;
		food124_addr = 4'b0;
		food125_addr = 4'b0;
		food131_addr = 4'b0;
		food132_addr = 4'b0;
		food133_addr = 4'b0;
		food134_addr = 4'b0;
		food135_addr = 4'b0;
		food141_addr = 4'b0;
		food142_addr = 4'b0;
		food143_addr = 4'b0;
		food144_addr = 4'b0;
		food151_addr = 4'b0;
		food152_addr = 4'b0;
		food153_addr = 4'b0;
		food154_addr = 4'b0;
		shape_P_on = 1'b0;
		shape_A_on = 1'b0;
		shape_C_on = 1'b0;
		shape_M_on = 1'b0;
		shape_A2_on = 1'b0;
		shape_N_on = 1'b0;
		shape_Wall_on = 1'b0;
		shape_Wall2_on = 1'b0;
		shape_Wallv_on = 1'b0;
		shape_Wallv2_on = 1'b0;
		pacman_on = 1'b0;
		clyde_on = 1'b0;
		inky_on = 1'b0;
		blinky_on = 1'b0;
		pinky_on = 1'b0;
		special_walls_5_1_on = 1'b0;
		special_walls_5_2_on = 1'b0;
		special_walls_5_3_on = 1'b0;
		special_walls_5_4_on = 1'b0;
		special_walls_2_1_on = 1'b0;
		special_walls_2_2_on = 1'b0;
		special_walls_2_3_on = 1'b0;
		special_walls_2_4_on = 1'b0;
		special_walls_3_1_on = 1'b0;
		special_walls_3_2_on = 1'b0;
		special_walls_4_1_on = 1'b0;
		special_walls_4_2_on = 1'b0;
		special_walls_4_3_on = 1'b0;
		special_walls_4_4_on = 1'b0;
		special_walls_1_1_on = 1'b0;
		special_walls_6_1_on = 1'b0;
		special_walls_6_2_on = 1'b0;
		special_walls_7_1_on = 1'b0;
		special_walls_7_2_on = 1'b0;
		special_walls_8_1_on = 1'b0;
		special_walls_8_2_on = 1'b0;
		special_walls_10_1_on = 1'b0;
		special_walls_10_2_on = 1'b0;
		score_S_on = 1'b0;
		score_c_on = 1'b0;
		score_o_on = 1'b0;
		score_r_on = 1'b0;
		score_e_on = 1'b0;
		score_colon_on = 1'b0;
		score_100_on = 1'b0;
		score_10_on = 1'b0;
		score_1_on = 1'b0;

	endfunction
	  
    always_comb
    begin:Ball_on_proc
//        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
//            ball_on = 1'b1;
//        else 
//            ball_on = 1'b0;
//     end

			default_values();
			
			//if(DrawX >= shape_x && DrawX < shape_x + shape_size_x && DrawY >= shape_y && DrawY < shape_y + shape_size_y)
			//begin
			//	shape_on = 1'b1;
			//	shape2_on = 1'b0;
			//	sprite_addr = (DrawY-shape_y+16*'h48);
			//end
			//else if(DrawX >= shape2_x && DrawX < shape2_x + shape2_size_x && DrawY >= shape2_y && DrawY < shape2_y + shape2_size_y)
			//begin
			//	shape_on = 1'b0;
			//	shape2_on = 1'b1;
			//	sprite_addr = (DrawY-shape2_y+16*'h49);
			//end
			if(DrawX >= PacmanX && DrawX < PacmanX + shape_pacman_x && DrawY >= PacmanY && DrawY < PacmanY + shape_pacman_y)
			begin
				pacman_on = 1'b1;
				if (pacman_type) chars_sprite_addr = (DrawY - PacmanY+16*'h01);
				else chars_sprite_addr = (DrawY - PacmanY+16*'h02);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= clydexsig && DrawX < clydexsig + shape_clyde_x && DrawY >= clydeysig && DrawY < clydeysig + shape_clyde_y)
			begin
				clyde_on = 1'b1;
				chars_sprite_addr = (DrawY - clydeysig+16*'h00);
			end
			else if(DrawX >= pinkyxsig && DrawX < pinkyxsig + shape_pinky_x && DrawY >= pinkyysig && DrawY < pinkyysig + shape_pinky_y)
			begin
				pinky_on = 1'b1;
				chars_sprite_addr = (DrawY - pinkyysig+16*'h00);
			end
			else if(DrawX >= inkyxsig && DrawX < inkyxsig + shape_inky_x && DrawY >= inkyysig && DrawY < inkyysig + shape_inky_y)
			begin
				inky_on = 1'b1;
				chars_sprite_addr = (DrawY - inkyysig+16*'h00);
			end
			else if(DrawX >= blinkyxsig && DrawX < blinkyxsig + shape_blinky_x && DrawY >= blinkyysig && DrawY < blinkyysig + shape_blinky_y)
			begin
				blinky_on = 1'b1;
				chars_sprite_addr = (DrawY - blinkyysig+16*'h00);
			end
			else if(DrawX >= start_x_P && DrawX < start_x_P + shape_size_x_P && DrawY >= start_y_P && DrawY < start_y_P + shape_size_y_P)
			begin
				shape_P_on = 1'b1;
				big_sprite_addr = (DrawY - start_y_P+64*'h00);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_A && DrawX < start_x_A + shape_size_x_A && DrawY >= start_y_A && DrawY < start_y_A + shape_size_y_A)
			begin
				shape_A_on = 1'b1;
				big_sprite_addr = (DrawY - start_y_A+64*'h01);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_C && DrawX < start_x_C + shape_size_x_C && DrawY >= start_y_C && DrawY < start_y_C + shape_size_y_C)
			begin
				shape_C_on = 1'b1;
				big_sprite_addr = (DrawY - start_y_C+64*'h02);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_M && DrawX < start_x_M + shape_size_x_M && DrawY >= start_y_M && DrawY < start_y_M + shape_size_y_M)
			begin
				shape_M_on = 1'b1;
				big_sprite_addr = (DrawY - start_y_M+64*'h03);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_A2 && DrawX < start_x_A2 + shape_size_x_A2 && DrawY >= start_y_A2 && DrawY < start_y_A2 + shape_size_y_A2)
			begin
				shape_A2_on = 1'b1;
				big_sprite_addr = (DrawY - start_y_A2+64*'h01);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_N && DrawX < start_x_N + shape_size_x_N && DrawY >= start_y_N && DrawY < start_y_N + shape_size_y_N)
			begin
				shape_N_on = 1'b1;
				big_sprite_addr = (DrawY - start_y_N+64*'h04);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_Wall && DrawX < start_x_Wall + shape_size_x_Wall && DrawY >= start_y_Wall && DrawY < start_y_Wall + shape_size_y_Wall)
			begin
				shape_Wall_on = 1'b1;
				wall_sprite_addr = (DrawY - start_y_Wall+4*'h00);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_Wall2 && DrawX < start_x_Wall2 + shape_size_x_Wall2 && DrawY >= start_y_Wall2 && DrawY < start_y_Wall2 + shape_size_y_Wall2)
			begin
				shape_Wall2_on = 1'b1;
				wall_sprite_addr = (DrawY - start_y_Wall2+4*'h00);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_Wallv && DrawX < start_x_Wallv + shape_size_x_Wallv && DrawY >= start_y_Wallv && DrawY < start_y_Wallv + shape_size_y_Wallv)
			begin
				shape_Wallv_on = 1'b1;
				wall_v_sprite_addr = (DrawY - start_y_Wallv);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_Wallv2 && DrawX < start_x_Wallv2 + shape_size_x_Wallv2 && DrawY >= start_y_Wallv2 && DrawY < start_y_Wallv2 + shape_size_y_Wallv2)
			begin
				shape_Wallv2_on = 1'b1;
				wall_v_sprite_addr = (DrawY - start_y_Wallv2);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw51 && DrawX < start_x_sw51 + shape_size_x_sw51 && DrawY >= start_y_sw51 && DrawY < start_y_sw51 + shape_size_y_sw51)
			begin
				special_walls_5_1_on = 1'b1;
				special_walls_5_1_addr = (DrawY - start_y_sw51);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw52 && DrawX < start_x_sw52 + shape_size_x_sw52 && DrawY >= start_y_sw52 && DrawY < start_y_sw52 + shape_size_y_sw52)
			begin
				special_walls_5_2_on = 1'b1;
				special_walls_5_2_addr = (DrawY - start_y_sw52+171*'h01);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw53 && DrawX < start_x_sw53 + shape_size_x_sw53 && DrawY >= start_y_sw53 && DrawY < start_y_sw53 + shape_size_y_sw53)
			begin
				special_walls_5_3_on = 1'b1;
				special_walls_5_3_addr = (DrawY - start_y_sw53+171*'h02);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw54 && DrawX < start_x_sw54 + shape_size_x_sw54 && DrawY >= start_y_sw54 && DrawY < start_y_sw54 + shape_size_y_sw54)
			begin
				special_walls_5_4_on = 1'b1;
				special_walls_5_4_addr = (DrawY - start_y_sw54+171*'h03);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw21 && DrawX < start_x_sw21 + shape_size_x_sw21 && DrawY >= start_y_sw21 && DrawY < start_y_sw21 + shape_size_y_sw21)
			begin
				special_walls_2_1_on = 1'b1;
				special_walls_2_1_addr = (DrawY - start_y_sw21);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw22 && DrawX < start_x_sw22 + shape_size_x_sw22 && DrawY >= start_y_sw22 && DrawY < start_y_sw22 + shape_size_y_sw22)
			begin
				special_walls_2_2_on = 1'b1;
				special_walls_2_2_addr = (DrawY - start_y_sw22);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw23 && DrawX < start_x_sw23 + shape_size_x_sw23 && DrawY >= start_y_sw23 && DrawY < start_y_sw23 + shape_size_y_sw23)
			begin
				special_walls_2_3_on = 1'b1;
				special_walls_2_3_addr = (DrawY - start_y_sw23);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw24 && DrawX < start_x_sw24 + shape_size_x_sw24 && DrawY >= start_y_sw24 && DrawY < start_y_sw24 + shape_size_y_sw24)
			begin
				special_walls_2_4_on = 1'b1;
				special_walls_2_4_addr = (DrawY - start_y_sw24);
				//
			end
			else if(DrawX >= start_x_sw31 && DrawX < start_x_sw31 + shape_size_x_sw31 && DrawY >= start_y_sw31 && DrawY < start_y_sw31 + shape_size_y_sw31)
			begin
				special_walls_3_1_on = 1'b1;
				special_walls_3_1_addr = (DrawY - start_y_sw31);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw32 && DrawX < start_x_sw32 + shape_size_x_sw32 && DrawY >= start_y_sw32 && DrawY < start_y_sw32 + shape_size_y_sw32)
			begin
				special_walls_3_2_on = 1'b1;
				special_walls_3_2_addr = (DrawY - start_y_sw32);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw41 && DrawX < start_x_sw41 + shape_size_x_sw41 && DrawY >= start_y_sw41 && DrawY < start_y_sw41 + shape_size_y_sw41)
			begin
				special_walls_4_1_on = 1'b1;
				special_walls_4_1_addr = (DrawY - start_y_sw41);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw42 && DrawX < start_x_sw42 + shape_size_x_sw42 && DrawY >= start_y_sw42 && DrawY < start_y_sw42 + shape_size_y_sw42)
			begin
				special_walls_4_2_on = 1'b1;
				special_walls_4_2_addr = (DrawY - start_y_sw42);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw43 && DrawX < start_x_sw43 + shape_size_x_sw43 && DrawY >= start_y_sw43 && DrawY < start_y_sw43 + shape_size_y_sw43)
			begin
				special_walls_4_3_on = 1'b1;
				special_walls_4_3_addr = (DrawY - start_y_sw43);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw44 && DrawX < start_x_sw44 + shape_size_x_sw44 && DrawY >= start_y_sw44 && DrawY < start_y_sw44 + shape_size_y_sw44)
			begin
				special_walls_4_4_on = 1'b1;
				special_walls_4_4_addr = (DrawY - start_y_sw44);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw1 && DrawX < start_x_sw1 + shape_size_x_sw1 && DrawY >= start_y_sw1 && DrawY < start_y_sw1 + shape_size_y_sw1)
			begin
				special_walls_1_1_on = 1'b1;
				special_walls_1_1_addr = (DrawY - start_y_sw1);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw61 && DrawX < start_x_sw61 + shape_size_x_sw61 && DrawY >= start_y_sw61 && DrawY < start_y_sw61 + shape_size_y_sw61)
			begin
				special_walls_6_1_on = 1'b1;
				special_walls_6_1_addr = (DrawY - start_y_sw61);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw62 && DrawX < start_x_sw62 + shape_size_x_sw62 && DrawY >= start_y_sw62 && DrawY < start_y_sw62 + shape_size_y_sw62)
			begin
				special_walls_6_2_on = 1'b1;
				special_walls_6_2_addr = (DrawY - start_y_sw62);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw71 && DrawX < start_x_sw71 + shape_size_x_sw71 && DrawY >= start_y_sw71 && DrawY < start_y_sw71 + shape_size_y_sw71)
			begin
				special_walls_7_1_on = 1'b1;
				special_walls_7_1_addr = (DrawY - start_y_sw71);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw72 && DrawX < start_x_sw72 + shape_size_x_sw72 && DrawY >= start_y_sw72 && DrawY < start_y_sw72 + shape_size_y_sw72)
			begin
				special_walls_7_2_on = 1'b1;
				special_walls_7_2_addr = (DrawY - start_y_sw72);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw81 && DrawX < start_x_sw81 + shape_size_x_sw81 && DrawY >= start_y_sw81 && DrawY < start_y_sw81 + shape_size_y_sw81)
			begin
				special_walls_8_1_on = 1'b1;
				special_walls_8_1_addr = (DrawY - start_y_sw81);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw82 && DrawX < start_x_sw82 + shape_size_x_sw82 && DrawY >= start_y_sw82 && DrawY < start_y_sw82 + shape_size_y_sw82)
			begin
				special_walls_8_2_on = 1'b1;
				special_walls_8_2_addr = (DrawY - start_y_sw82);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw101 && DrawX < start_x_sw101 + shape_size_x_sw101 && DrawY >= start_y_sw101 && DrawY < start_y_sw101 + shape_size_y_sw101)
			begin
				special_walls_10_1_on = 1'b1;
				special_walls_10_1_addr = (DrawY - start_y_sw101);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_x_sw102 && DrawX < start_x_sw102 + shape_size_x_sw102 && DrawY >= start_y_sw102 && DrawY < start_y_sw102 + shape_size_y_sw102)
			begin
				special_walls_10_2_on = 1'b1;
				special_walls_10_2_addr = (DrawY - start_y_sw102);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food1xsig && DrawX < food1xsig + shape_size_x_food && DrawY >= food1ysig && DrawY < food1ysig + shape_size_y_food)
			begin
				food1_addr = (DrawY - food1ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food2xsig && DrawX < food2xsig + shape_size_x_food && DrawY >= food2ysig && DrawY < food2ysig + shape_size_y_food)
			begin
				food2_addr = (DrawY - food2ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food3xsig && DrawX < food3xsig + shape_size_x_food && DrawY >= food3ysig && DrawY < food3ysig + shape_size_y_food)
			begin
				food3_addr = (DrawY - food3ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food4xsig && DrawX < food4xsig + shape_size_x_food && DrawY >= food4ysig && DrawY < food4ysig + shape_size_y_food)
			begin
				food4_addr = (DrawY - food4ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food5xsig && DrawX < food5xsig + shape_size_x_food && DrawY >= food5ysig && DrawY < food5ysig + shape_size_y_food)
			begin
				food5_addr = (DrawY - food5ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food6xsig && DrawX < food6xsig + shape_size_x_food && DrawY >= food6ysig && DrawY < food6ysig + shape_size_y_food)
			begin
				food6_addr = (DrawY - food6ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food7xsig && DrawX < food7xsig + shape_size_x_food && DrawY >= food7ysig && DrawY < food7ysig + shape_size_y_food)
			begin
				food7_addr = (DrawY - food7ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food8xsig && DrawX < food8xsig + shape_size_x_food && DrawY >= food8ysig && DrawY < food8ysig + shape_size_y_food)
			begin
				food8_addr = (DrawY - food8ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food9xsig && DrawX < food9xsig + shape_size_x_food && DrawY >= food9ysig && DrawY < food9ysig + shape_size_y_food)
			begin
				food9_addr = (DrawY - food9ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food10xsig && DrawX < food10xsig + shape_size_x_food && DrawY >= food10ysig && DrawY < food10ysig + shape_size_y_food)
			begin
				food10_addr = (DrawY - food10ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food11xsig && DrawX < food11xsig + shape_size_x_food && DrawY >= food11ysig && DrawY < food11ysig + shape_size_y_food)
			begin
				food11_addr = (DrawY - food11ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food12xsig && DrawX < food12xsig + shape_size_x_food && DrawY >= food12ysig && DrawY < food12ysig + shape_size_y_food)
			begin
				food12_addr = (DrawY - food12ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food13xsig && DrawX < food13xsig + shape_size_x_food && DrawY >= food13ysig && DrawY < food13ysig + shape_size_y_food)
			begin
				food13_addr = (DrawY - food13ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food14xsig && DrawX < food14xsig + shape_size_x_food && DrawY >= food14ysig && DrawY < food14ysig + shape_size_y_food)
			begin
				food14_addr = (DrawY - food14ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food15xsig && DrawX < food15xsig + shape_size_x_food && DrawY >= food15ysig && DrawY < food15ysig + shape_size_y_food)
			begin
				food15_addr = (DrawY - food15ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food16xsig && DrawX < food16xsig + shape_size_x_food && DrawY >= food16ysig && DrawY < food16ysig + shape_size_y_food)
			begin
				food16_addr = (DrawY - food16ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food17xsig && DrawX < food17xsig + shape_size_x_food && DrawY >= food17ysig && DrawY < food17ysig + shape_size_y_food)
			begin
				food17_addr = (DrawY - food17ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food18xsig && DrawX < food18xsig + shape_size_x_food && DrawY >= food18ysig && DrawY < food18ysig + shape_size_y_food)
			begin
				food18_addr = (DrawY - food18ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food19xsig && DrawX < food19xsig + shape_size_x_food && DrawY >= food19ysig && DrawY < food19ysig + shape_size_y_food)
			begin
				food19_addr = (DrawY - food19ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food20xsig && DrawX < food20xsig + shape_size_x_food && DrawY >= food20ysig && DrawY < food20ysig + shape_size_y_food)
			begin
				food20_addr = (DrawY - food20ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food21xsig && DrawX < food21xsig + shape_size_x_food && DrawY >= food21ysig && DrawY < food21ysig + shape_size_y_food)
			begin
				food21_addr = (DrawY - food21ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food22xsig && DrawX < food22xsig + shape_size_x_food && DrawY >= food22ysig && DrawY < food22ysig + shape_size_y_food)
			begin
				food22_addr = (DrawY - food22ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food23xsig && DrawX < food23xsig + shape_size_x_food && DrawY >= food23ysig && DrawY < food23ysig + shape_size_y_food)
			begin
				food23_addr = (DrawY - food23ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food24xsig && DrawX < food24xsig + shape_size_x_food && DrawY >= food24ysig && DrawY < food24ysig + shape_size_y_food)
			begin
				food24_addr = (DrawY - food24ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food25xsig && DrawX < food25xsig + shape_size_x_food && DrawY >= food25ysig && DrawY < food25ysig + shape_size_y_food)
			begin
				food25_addr = (DrawY - food25ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food26xsig && DrawX < food26xsig + shape_size_x_food && DrawY >= food26ysig && DrawY < food26ysig + shape_size_y_food)
			begin
				food26_addr = (DrawY - food26ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food27xsig && DrawX < food27xsig + shape_size_x_food && DrawY >= food27ysig && DrawY < food27ysig + shape_size_y_food)
			begin
				food27_addr = (DrawY - food27ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food28xsig && DrawX < food28xsig + shape_size_x_food && DrawY >= food28ysig && DrawY < food28ysig + shape_size_y_food)
			begin
				food28_addr = (DrawY - food28ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food29xsig && DrawX < food29xsig + shape_size_x_food && DrawY >= food29ysig && DrawY < food29ysig + shape_size_y_food)
			begin
				food29_addr = (DrawY - food29ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food30xsig && DrawX < food30xsig + shape_size_x_food && DrawY >= food30ysig && DrawY < food30ysig + shape_size_y_food)
			begin
				food30_addr = (DrawY - food30ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food31xsig && DrawX < food31xsig + shape_size_x_food && DrawY >= food31ysig && DrawY < food31ysig + shape_size_y_food)
			begin
				food31_addr = (DrawY - food31ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food32xsig && DrawX < food32xsig + shape_size_x_food && DrawY >= food32ysig && DrawY < food32ysig + shape_size_y_food)
			begin
				food32_addr = (DrawY - food32ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food33xsig && DrawX < food33xsig + shape_size_x_food && DrawY >= food33ysig && DrawY < food33ysig + shape_size_y_food)
			begin
				food33_addr = (DrawY - food33ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food34xsig && DrawX < food34xsig + shape_size_x_food && DrawY >= food34ysig && DrawY < food34ysig + shape_size_y_food)
			begin
				food34_addr = (DrawY - food34ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food35xsig && DrawX < food35xsig + shape_size_x_food && DrawY >= food35ysig && DrawY < food35ysig + shape_size_y_food)
			begin
				food35_addr = (DrawY - food35ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food36xsig && DrawX < food36xsig + shape_size_x_food && DrawY >= food36ysig && DrawY < food36ysig + shape_size_y_food)
			begin
				food36_addr = (DrawY - food36ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food37xsig && DrawX < food37xsig + shape_size_x_food && DrawY >= food37ysig && DrawY < food37ysig + shape_size_y_food)
			begin
				food37_addr = (DrawY - food37ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food38xsig && DrawX < food38xsig + shape_size_x_food && DrawY >= food38ysig && DrawY < food38ysig + shape_size_y_food)
			begin
				food38_addr = (DrawY - food38ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food39xsig && DrawX < food39xsig + shape_size_x_food && DrawY >= food39ysig && DrawY < food39ysig + shape_size_y_food)
			begin
				food39_addr = (DrawY - food39ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food40xsig && DrawX < food40xsig + shape_size_x_food && DrawY >= food40ysig && DrawY < food40ysig + shape_size_y_food)
			begin
				food40_addr = (DrawY - food40ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food41xsig && DrawX < food41xsig + shape_size_x_food && DrawY >= food41ysig && DrawY < food41ysig + shape_size_y_food)
			begin
				food41_addr = (DrawY - food41ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food42xsig && DrawX < food42xsig + shape_size_x_food && DrawY >= food42ysig && DrawY < food42ysig + shape_size_y_food)
			begin
				food42_addr = (DrawY - food42ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food43xsig && DrawX < food43xsig + shape_size_x_food && DrawY >= food43ysig && DrawY < food43ysig + shape_size_y_food)
			begin
				food43_addr = (DrawY - food43ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food44xsig && DrawX < food44xsig + shape_size_x_food && DrawY >= food44ysig && DrawY < food44ysig + shape_size_y_food)
			begin
				food44_addr = (DrawY - food44ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food45xsig && DrawX < food45xsig + shape_size_x_food && DrawY >= food45ysig && DrawY < food45ysig + shape_size_y_food)
			begin
				food45_addr = (DrawY - food45ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food46xsig && DrawX < food46xsig + shape_size_x_food && DrawY >= food46ysig && DrawY < food46ysig + shape_size_y_food)
			begin
				food46_addr = (DrawY - food46ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food47xsig && DrawX < food47xsig + shape_size_x_food && DrawY >= food47ysig && DrawY < food47ysig + shape_size_y_food)
			begin
				food47_addr = (DrawY - food47ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food51xsig && DrawX < food51xsig + shape_size_x_food && DrawY >= food51ysig && DrawY < food51ysig + shape_size_y_food)
			begin
				food51_addr = (DrawY - food51ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food52xsig && DrawX < food52xsig + shape_size_x_food && DrawY >= food52ysig && DrawY < food52ysig + shape_size_y_food)
			begin
				food52_addr = (DrawY - food52ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food53xsig && DrawX < food53xsig + shape_size_x_food && DrawY >= food53ysig && DrawY < food53ysig + shape_size_y_food)
			begin
				food53_addr = (DrawY - food53ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food54xsig && DrawX < food54xsig + shape_size_x_food && DrawY >= food54ysig && DrawY < food54ysig + shape_size_y_food)
			begin
				food54_addr = (DrawY - food54ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food55xsig && DrawX < food55xsig + shape_size_x_food && DrawY >= food55ysig && DrawY < food55ysig + shape_size_y_food)
			begin
				food55_addr = (DrawY - food55ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food56xsig && DrawX < food56xsig + shape_size_x_food && DrawY >= food56ysig && DrawY < food56ysig + shape_size_y_food)
			begin
				food56_addr = (DrawY - food56ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food57xsig && DrawX < food57xsig + shape_size_x_food && DrawY >= food57ysig && DrawY < food57ysig + shape_size_y_food)
			begin
				food57_addr = (DrawY - food57ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food61xsig && DrawX < food61xsig + shape_size_x_food && DrawY >= food61ysig && DrawY < food61ysig + shape_size_y_food)
			begin
				food61_addr = (DrawY - food61ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food62xsig && DrawX < food62xsig + shape_size_x_food && DrawY >= food62ysig && DrawY < food62ysig + shape_size_y_food)
			begin
				food62_addr = (DrawY - food62ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food63xsig && DrawX < food63xsig + shape_size_x_food && DrawY >= food63ysig && DrawY < food63ysig + shape_size_y_food)
			begin
				food63_addr = (DrawY - food63ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food64xsig && DrawX < food64xsig + shape_size_x_food && DrawY >= food64ysig && DrawY < food64ysig + shape_size_y_food)
			begin
				food64_addr = (DrawY - food64ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food65xsig && DrawX < food65xsig + shape_size_x_food && DrawY >= food65ysig && DrawY < food65ysig + shape_size_y_food)
			begin
				food65_addr = (DrawY - food65ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food66xsig && DrawX < food66xsig + shape_size_x_food && DrawY >= food66ysig && DrawY < food66ysig + shape_size_y_food)
			begin
				food66_addr = (DrawY - food66ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food67xsig && DrawX < food67xsig + shape_size_x_food && DrawY >= food67ysig && DrawY < food67ysig + shape_size_y_food)
			begin
				food67_addr = (DrawY - food67ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food71xsig && DrawX < food71xsig + shape_size_x_food && DrawY >= food71ysig && DrawY < food71ysig + shape_size_y_food)
			begin
				food71_addr = (DrawY - food71ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food72xsig && DrawX < food72xsig + shape_size_x_food && DrawY >= food72ysig && DrawY < food72ysig + shape_size_y_food)
			begin
				food72_addr = (DrawY - food72ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food73xsig && DrawX < food73xsig + shape_size_x_food && DrawY >= food73ysig && DrawY < food73ysig + shape_size_y_food)
			begin
				food73_addr = (DrawY - food73ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food74xsig && DrawX < food74xsig + shape_size_x_food && DrawY >= food74ysig && DrawY < food74ysig + shape_size_y_food)
			begin
				food74_addr = (DrawY - food74ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food75xsig && DrawX < food75xsig + shape_size_x_food && DrawY >= food75ysig && DrawY < food75ysig + shape_size_y_food)
			begin
				food75_addr = (DrawY - food75ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food76xsig && DrawX < food76xsig + shape_size_x_food && DrawY >= food76ysig && DrawY < food76ysig + shape_size_y_food)
			begin
				food76_addr = (DrawY - food76ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food77xsig && DrawX < food77xsig + shape_size_x_food && DrawY >= food77ysig && DrawY < food77ysig + shape_size_y_food)
			begin
				food77_addr = (DrawY - food77ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food81xsig && DrawX < food81xsig + shape_size_x_food && DrawY >= food81ysig && DrawY < food81ysig + shape_size_y_food)
			begin
				food81_addr = (DrawY - food81ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food82xsig && DrawX < food82xsig + shape_size_x_food && DrawY >= food82ysig && DrawY < food82ysig + shape_size_y_food)
			begin
				food82_addr = (DrawY - food82ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food83xsig && DrawX < food83xsig + shape_size_x_food && DrawY >= food83ysig && DrawY < food83ysig + shape_size_y_food)
			begin
				food83_addr = (DrawY - food83ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food84xsig && DrawX < food84xsig + shape_size_x_food && DrawY >= food84ysig && DrawY < food84ysig + shape_size_y_food)
			begin
				food84_addr = (DrawY - food84ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food85xsig && DrawX < food85xsig + shape_size_x_food && DrawY >= food85ysig && DrawY < food85ysig + shape_size_y_food)
			begin
				food85_addr = (DrawY - food85ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food86xsig && DrawX < food86xsig + shape_size_x_food && DrawY >= food86ysig && DrawY < food86ysig + shape_size_y_food)
			begin
				food86_addr = (DrawY - food86ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food87xsig && DrawX < food87xsig + shape_size_x_food && DrawY >= food87ysig && DrawY < food87ysig + shape_size_y_food)
			begin
				food87_addr = (DrawY - food87ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food91xsig && DrawX < food91xsig + shape_size_x_food && DrawY >= food91ysig && DrawY < food91ysig + shape_size_y_food)
			begin
				food91_addr = (DrawY - food91ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food92xsig && DrawX < food92xsig + shape_size_x_food && DrawY >= food92ysig && DrawY < food92ysig + shape_size_y_food)
			begin
				food92_addr = (DrawY - food92ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food93xsig && DrawX < food93xsig + shape_size_x_food && DrawY >= food93ysig && DrawY < food93ysig + shape_size_y_food)
			begin
				food93_addr = (DrawY - food93ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food94xsig && DrawX < food94xsig + shape_size_x_food && DrawY >= food94ysig && DrawY < food94ysig + shape_size_y_food)
			begin
				food94_addr = (DrawY - food94ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food95xsig && DrawX < food95xsig + shape_size_x_food && DrawY >= food95ysig && DrawY < food95ysig + shape_size_y_food)
			begin
				food95_addr = (DrawY - food95ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food96xsig && DrawX < food96xsig + shape_size_x_food && DrawY >= food96ysig && DrawY < food96ysig + shape_size_y_food)
			begin
				food96_addr = (DrawY - food96ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food97xsig && DrawX < food97xsig + shape_size_x_food && DrawY >= food97ysig && DrawY < food97ysig + shape_size_y_food)
			begin
				food97_addr = (DrawY - food97ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food101xsig && DrawX < food101xsig + shape_size_x_food && DrawY >= food101ysig && DrawY < food101ysig + shape_size_y_food)
			begin
				food101_addr = (DrawY - food101ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food102xsig && DrawX < food102xsig + shape_size_x_food && DrawY >= food102ysig && DrawY < food102ysig + shape_size_y_food)
			begin
				food102_addr = (DrawY - food102ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food103xsig && DrawX < food103xsig + shape_size_x_food && DrawY >= food103ysig && DrawY < food103ysig + shape_size_y_food)
			begin
				food103_addr = (DrawY - food103ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food104xsig && DrawX < food104xsig + shape_size_x_food && DrawY >= food104ysig && DrawY < food104ysig + shape_size_y_food)
			begin
				food104_addr = (DrawY - food104ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food105xsig && DrawX < food105xsig + shape_size_x_food && DrawY >= food105ysig && DrawY < food105ysig + shape_size_y_food)
			begin
				food105_addr = (DrawY - food105ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food106xsig && DrawX < food106xsig + shape_size_x_food && DrawY >= food106ysig && DrawY < food106ysig + shape_size_y_food)
			begin
				food106_addr = (DrawY - food106ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food107xsig && DrawX < food107xsig + shape_size_x_food && DrawY >= food107ysig && DrawY < food107ysig + shape_size_y_food)
			begin
				food107_addr = (DrawY - food107ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food111xsig && DrawX < food111xsig + shape_size_x_food && DrawY >= food111ysig && DrawY < food111ysig + shape_size_y_food)
			begin
				food111_addr = (DrawY - food111ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food112xsig && DrawX < food112xsig + shape_size_x_food && DrawY >= food112ysig && DrawY < food112ysig + shape_size_y_food)
			begin
				food112_addr = (DrawY - food112ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food113xsig && DrawX < food113xsig + shape_size_x_food && DrawY >= food113ysig && DrawY < food113ysig + shape_size_y_food)
			begin
				food113_addr = (DrawY - food113ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food114xsig && DrawX < food114xsig + shape_size_x_food && DrawY >= food114ysig && DrawY < food114ysig + shape_size_y_food)
			begin
				food114_addr = (DrawY - food114ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food115xsig && DrawX < food115xsig + shape_size_x_food && DrawY >= food115ysig && DrawY < food115ysig + shape_size_y_food)
			begin
				food115_addr = (DrawY - food115ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food116xsig && DrawX < food116xsig + shape_size_x_food && DrawY >= food116ysig && DrawY < food116ysig + shape_size_y_food)
			begin
				food116_addr = (DrawY - food116ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food117xsig && DrawX < food117xsig + shape_size_x_food && DrawY >= food117ysig && DrawY < food117ysig + shape_size_y_food)
			begin
				food117_addr = (DrawY - food117ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food121xsig && DrawX < food121xsig + shape_size_x_food && DrawY >= food121ysig && DrawY < food121ysig + shape_size_y_food)
			begin
				food121_addr = (DrawY - food121ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food122xsig && DrawX < food122xsig + shape_size_x_food && DrawY >= food122ysig && DrawY < food122ysig + shape_size_y_food)
			begin
				food122_addr = (DrawY - food122ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food123xsig && DrawX < food123xsig + shape_size_x_food && DrawY >= food123ysig && DrawY < food123ysig + shape_size_y_food)
			begin
				food123_addr = (DrawY - food123ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food124xsig && DrawX < food124xsig + shape_size_x_food && DrawY >= food124ysig && DrawY < food124ysig + shape_size_y_food)
			begin
				food124_addr = (DrawY - food124ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food125xsig && DrawX < food125xsig + shape_size_x_food && DrawY >= food125ysig && DrawY < food125ysig + shape_size_y_food)
			begin
				food125_addr = (DrawY - food125ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food131xsig && DrawX < food131xsig + shape_size_x_food && DrawY >= food131ysig && DrawY < food131ysig + shape_size_y_food)
			begin
				food131_addr = (DrawY - food131ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food132xsig && DrawX < food132xsig + shape_size_x_food && DrawY >= food132ysig && DrawY < food132ysig + shape_size_y_food)
			begin
				food132_addr = (DrawY - food132ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food133xsig && DrawX < food133xsig + shape_size_x_food && DrawY >= food133ysig && DrawY < food133ysig + shape_size_y_food)
			begin
				food133_addr = (DrawY - food133ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food134xsig && DrawX < food134xsig + shape_size_x_food && DrawY >= food134ysig && DrawY < food134ysig + shape_size_y_food)
			begin
				food134_addr = (DrawY - food134ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food135xsig && DrawX < food135xsig + shape_size_x_food && DrawY >= food135ysig && DrawY < food135ysig + shape_size_y_food)
			begin
				food135_addr = (DrawY - food135ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food141xsig && DrawX < food141xsig + shape_size_x_food && DrawY >= food141ysig && DrawY < food141ysig + shape_size_y_food)
			begin
				food141_addr = (DrawY - food141ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food142xsig && DrawX < food142xsig + shape_size_x_food && DrawY >= food142ysig && DrawY < food142ysig + shape_size_y_food)
			begin
				food142_addr = (DrawY - food142ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food143xsig && DrawX < food143xsig + shape_size_x_food && DrawY >= food143ysig && DrawY < food143ysig + shape_size_y_food)
			begin
				food143_addr = (DrawY - food143ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food144xsig && DrawX < food144xsig + shape_size_x_food && DrawY >= food144ysig && DrawY < food144ysig + shape_size_y_food)
			begin
				food144_addr = (DrawY - food144ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food151xsig && DrawX < food151xsig + shape_size_x_food && DrawY >= food151ysig && DrawY < food151ysig + shape_size_y_food)
			begin
				food151_addr = (DrawY - food151ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food152xsig && DrawX < food152xsig + shape_size_x_food && DrawY >= food152ysig && DrawY < food152ysig + shape_size_y_food)
			begin
				food152_addr = (DrawY - food152ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food153xsig && DrawX < food153xsig + shape_size_x_food && DrawY >= food153ysig && DrawY < food153ysig + shape_size_y_food)
			begin
				food153_addr = (DrawY - food153ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= food154xsig && DrawX < food154xsig + shape_size_x_food && DrawY >= food154ysig && DrawY < food154ysig + shape_size_y_food)
			begin
				food154_addr = (DrawY - food154ysig);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if (game_over == 1'b1) begin
				if (DrawX >= start_x_g && DrawX < start_x_g + shape_size_x_go && DrawY >= start_y_g && DrawY < start_y_g + shape_size_y_go)
				begin
					print_game_over = 1'b0;
					game_over_addr = (DrawY - start_y_g+16*'h00);
				end
				else if (DrawX >= start_x_a && DrawX < start_x_a + shape_size_x_go && DrawY >= start_y_a && DrawY < start_y_a + shape_size_y_go)
				begin
					print_game_over = 1'b0;
					game_over_addr = (DrawY - start_y_a+16*'h01);
				end
				else if (DrawX >= start_x_m && DrawX < start_x_m + shape_size_x_go && DrawY >= start_y_m && DrawY < start_y_m + shape_size_y_go)
				begin
					print_game_over = 1'b0;
					game_over_addr = (DrawY - start_y_m+16*'h02);
				end
				else if (DrawX >= start_x_e && DrawX < start_x_e + shape_size_x_go && DrawY >= start_y_e && DrawY < start_y_e + shape_size_y_go)
				begin
					print_game_over = 1'b0;
					game_over_addr = (DrawY - start_y_e+16*'h03);
				end
				else if (DrawX >= start_x_o && DrawX < start_x_o + shape_size_x_go && DrawY >= start_y_o && DrawY < start_y_o + shape_size_y_go)
				begin
					print_game_over = 1'b1;
					game_over_addr = (DrawY - start_y_o+16*'h04);
				end
				else if (DrawX >= start_x_v && DrawX < start_x_v + shape_size_x_go && DrawY >= start_y_v && DrawY < start_y_v + shape_size_y_go)
				begin
					print_game_over = 1'b1;
					game_over_addr = (DrawY - start_y_v+16*'h05);
				end
				else if (DrawX >= start_x_e2 && DrawX < start_x_e2 + shape_size_x_go && DrawY >= start_y_e2 && DrawY < start_y_e2 + shape_size_y_go)
				begin
					print_game_over = 1'b1;
					game_over_addr = (DrawY - start_y_e2+16*'h03);
				end
				else if (DrawX >= start_x_r && DrawX < start_x_r + shape_size_x_go && DrawY >= start_y_r && DrawY < start_y_r + shape_size_y_go)
				begin
					print_game_over = 1'b1;
					game_over_addr = (DrawY - start_y_r+16*'h06);
				end
			end
			else if(DrawX >= start_score_x_S && DrawX < start_score_x_S + shape_size_x_score && DrawY >= start_score_y_S && DrawY < start_score_y_S + shape_size_y_score)
			begin
				score_S_on = 1'b1;
				score_addr = (DrawY - start_score_y_S+16*'h0b);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_score_x_c && DrawX < start_score_x_c + shape_size_x_score && DrawY >= start_score_y_c && DrawY < start_score_y_c + shape_size_y_score)
			begin
				score_c_on = 1'b1;
				score_addr = (DrawY - start_score_y_c+16*'h0c);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_score_x_o && DrawX < start_score_x_o + shape_size_x_score && DrawY >= start_score_y_o && DrawY < start_score_y_o + shape_size_y_score)
			begin
				score_o_on = 1'b1;
				score_addr = (DrawY - start_score_y_o+16*'h0d);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_score_x_r && DrawX < start_score_x_r + shape_size_x_score && DrawY >= start_score_y_r && DrawY < start_score_y_r + shape_size_y_score)
			begin
				score_r_on = 1'b1;
				score_addr = (DrawY - start_score_y_r+16*'h0e);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_score_x_e && DrawX < start_score_x_e + shape_size_x_score && DrawY >= start_score_y_e && DrawY < start_score_y_e + shape_size_y_score)
			begin
				score_e_on = 1'b1;
				score_addr = (DrawY - start_score_y_e+16*'h0f);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_score_x_colon && DrawX < start_score_x_colon + shape_size_x_score && DrawY >= start_score_y_colon && DrawY < start_score_y_colon + shape_size_y_score)
			begin
				score_colon_on = 1'b1;
				score_addr = (DrawY - start_score_y_colon+16*'h0a);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_score_x_100 && DrawX < start_score_x_100 + shape_size_x_score && DrawY >= start_score_y_100 && DrawY < start_score_y_100 + shape_size_y_score)
			begin
				score_100_on = 1'b1;
				score_addr = (DrawY - start_score_y_100+16*hundred_place);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_score_x_10 && DrawX < start_score_x_10 + shape_size_x_score && DrawY >= start_score_y_10 && DrawY < start_score_y_10 + shape_size_y_score)
			begin
				score_10_on = 1'b1;
				score_addr = (DrawY - start_score_y_10+16*ten_place);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else if(DrawX >= start_score_x_1 && DrawX < start_score_x_1 + shape_size_x_score && DrawY >= start_score_y_1 && DrawY < start_score_y_1 + shape_size_y_score)
			begin
				score_1_on = 1'b1;
				score_addr = (DrawY - start_score_y_1+16*one_place);
				// sprite_addr = (DrawY - start_y_P+16*'h50);
			end
			else
			begin
				shape_on = 1'b0;
				shape2_on = 1'b0;
				// sprite_addr = 11'b0;
			end
		end
				
       
    always_comb
    begin:RGB_Display
//        if ((ball_on == 1'b1)) 
//        begin 
//            Red = 8'hff;
//            Green = 8'h55;
//            Blue = 8'h00;
//        end       
//        else 
//        begin 
//            Red = 8'h00; 
//            Green = 8'h00;
//            Blue = 8'h7f - DrawX[9:3];
//        end      
//    end
		if (blank) begin
			//if ((shape_on == 1'b1) && sprite_data[DrawX-shape_x] == 1'b1)
			//begin
			//	Red = 8'h00;
			//	Green = 8'hff;
			//	Blue = 8'hff;
			//end
			//else if((shape2_on == 1'b1) && sprite_data[DrawX-shape2_x] == 1'b1)
			//begin
			//	Red = 8'hff;
			//	Green = 8'hff;
			//	Blue = 8'h00;
			//end
			if((pacman_on == 1'b1) && chars_sprite_data[16+PacmanX-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((shape_P_on == 1'b1) && big_sprite_data[24+start_x_P-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((shape_A_on == 1'b1) && big_sprite_data[24+start_x_A-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((shape_C_on == 1'b1) && big_sprite_data[24+start_x_C-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((shape_M_on == 1'b1) && big_sprite_data[24+start_x_M-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((shape_A2_on == 1'b1) && big_sprite_data[24+start_x_A2-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((shape_N_on == 1'b1) && big_sprite_data[24+start_x_N-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((shape_Wall_on == 1'b1) && wall_sprite_data[600+start_x_Wall-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((shape_Wall2_on == 1'b1) && wall_sprite_data[600+start_x_Wall2-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((shape_Wallv_on == 1'b1) && wall_v_sprite_data[4+start_x_Wallv-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((shape_Wallv2_on == 1'b1) && wall_v_sprite_data[400+start_x_Wallv2-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_5_1_on == 1'b1) && special_walls_5_1_data[75+start_x_sw51-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_5_2_on == 1'b1) && special_walls_5_2_data[75+start_x_sw52-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_5_3_on == 1'b1) && special_walls_5_3_data[75+start_x_sw53-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_5_4_on == 1'b1) && special_walls_5_4_data[75+start_x_sw54-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_2_1_on == 1'b1) && special_walls_2_1_data[4+start_x_sw21-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_2_2_on == 1'b1) && special_walls_2_2_data[4+start_x_sw22-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_2_3_on == 1'b1) && special_walls_2_3_data[4+start_x_sw23-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_2_4_on == 1'b1) && special_walls_2_4_data[4+start_x_sw24-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_3_1_on == 1'b1) && special_walls_3_1_data[326+start_x_sw31-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_3_2_on == 1'b1) && special_walls_3_2_data[326+start_x_sw32-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_4_1_on == 1'b1) && special_walls_4_1_data[75+start_x_sw41-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_4_2_on == 1'b1) && special_walls_4_2_data[75+start_x_sw42-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_4_3_on == 1'b1) && special_walls_4_3_data[75+start_x_sw43-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_4_4_on == 1'b1) && special_walls_4_4_data[75+start_x_sw44-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_6_1_on == 1'b1) && special_walls_6_1_data[91+start_x_sw61-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_6_2_on == 1'b1) && special_walls_6_2_data[91+start_x_sw62-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_7_1_on == 1'b1) && special_walls_7_1_data[119+start_x_sw71-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_7_2_on == 1'b1) && special_walls_7_2_data[119+start_x_sw72-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_8_1_on == 1'b1) && special_walls_8_1_data[326+start_x_sw81-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_8_2_on == 1'b1) && special_walls_8_2_data[326+start_x_sw82-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_10_1_on == 1'b1) && special_walls_10_1_data[326+start_x_sw101-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_10_2_on == 1'b1) && special_walls_10_2_data[326+start_x_sw102-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'hff;
			end
			else if((special_walls_1_1_on == 1'b1) && special_walls_1_1_data[80+start_x_sw1-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if((clyde_on == 1'b1) && chars_sprite_data[16+clydexsig-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'h99;
				Blue = 8'h33;
			end
			else if((pinky_on == 1'b1) && chars_sprite_data[16+pinkyxsig-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'h66;
				Blue = 8'hff;
			end
			else if((inky_on == 1'b1) && chars_sprite_data[16+inkyxsig-DrawX] == 1'b1)
			begin
				Red = 8'h33;
				Green = 8'hff;
				Blue = 8'hff;
			end
			else if((blinky_on == 1'b1) && chars_sprite_data[16+blinkyxsig-DrawX] == 1'b1)
			begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if((food1on == 1'b1) && food1_data[8+food1xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food2on == 1'b1) && food2_data[8+food2xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food3on == 1'b1) && food3_data[8+food3xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food4on == 1'b1) && food4_data[8+food4xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food5on == 1'b1) && food5_data[8+food5xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food6on == 1'b1) && food6_data[8+food6xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food7on == 1'b1) && food7_data[8+food7xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food8on == 1'b1) && food8_data[8+food8xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food9on == 1'b1) && food9_data[8+food9xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food10on == 1'b1) && food10_data[8+food10xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food11on == 1'b1) && food11_data[8+food11xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food12on == 1'b1) && food12_data[8+food12xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food13on == 1'b1) && food13_data[8+food13xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food14on == 1'b1) && food14_data[8+food14xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food15on == 1'b1) && food15_data[8+food15xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food16on == 1'b1) && food16_data[8+food16xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food17on == 1'b1) && food17_data[8+food17xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food18on == 1'b1) && food18_data[8+food18xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food19on == 1'b1) && food19_data[8+food19xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food20on == 1'b1) && food20_data[8+food20xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food21on == 1'b1) && food21_data[8+food21xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food22on == 1'b1) && food22_data[8+food22xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food23on == 1'b1) && food23_data[8+food23xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food24on == 1'b1) && food24_data[8+food24xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food25on == 1'b1) && food25_data[8+food25xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food26on == 1'b1) && food26_data[8+food26xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food27on == 1'b1) && food27_data[8+food27xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food28on == 1'b1) && food28_data[8+food28xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food29on == 1'b1) && food29_data[8+food29xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food30on == 1'b1) && food30_data[8+food30xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food31on == 1'b1) && food31_data[8+food31xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food32on == 1'b1) && food32_data[8+food32xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food33on == 1'b1) && food33_data[8+food33xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food34on == 1'b1) && food34_data[8+food34xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food35on == 1'b1) && food35_data[8+food35xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food36on == 1'b1) && food36_data[8+food36xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food37on == 1'b1) && food37_data[8+food37xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food38on == 1'b1) && food38_data[8+food38xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food39on == 1'b1) && food39_data[8+food39xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food40on == 1'b1) && food40_data[8+food40xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food41on == 1'b1) && food41_data[8+food41xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food42on == 1'b1) && food42_data[8+food42xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food43on == 1'b1) && food43_data[8+food43xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food44on == 1'b1) && food44_data[8+food44xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food45on == 1'b1) && food45_data[8+food45xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food46on == 1'b1) && food46_data[8+food46xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food47on == 1'b1) && food47_data[8+food47xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food51on == 1'b1) && food51_data[8+food51xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food52on == 1'b1) && food52_data[8+food52xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food53on == 1'b1) && food53_data[8+food53xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food54on == 1'b1) && food54_data[8+food54xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food55on == 1'b1) && food55_data[8+food55xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food56on == 1'b1) && food56_data[8+food56xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food57on == 1'b1) && food57_data[8+food57xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food61on == 1'b1) && food61_data[8+food61xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food62on == 1'b1) && food62_data[8+food62xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food63on == 1'b1) && food63_data[8+food63xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food64on == 1'b1) && food64_data[8+food64xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food65on == 1'b1) && food65_data[8+food65xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food66on == 1'b1) && food66_data[8+food66xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food67on == 1'b1) && food67_data[8+food67xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food71on == 1'b1) && food71_data[8+food71xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food72on == 1'b1) && food72_data[8+food72xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food73on == 1'b1) && food73_data[8+food73xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food74on == 1'b1) && food74_data[8+food74xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food75on == 1'b1) && food75_data[8+food75xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food76on == 1'b1) && food76_data[8+food76xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food77on == 1'b1) && food77_data[8+food77xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food81on == 1'b1) && food81_data[8+food81xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food82on == 1'b1) && food82_data[8+food82xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food83on == 1'b1) && food83_data[8+food83xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food84on == 1'b1) && food84_data[8+food84xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food85on == 1'b1) && food85_data[8+food85xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food86on == 1'b1) && food86_data[8+food86xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food87on == 1'b1) && food87_data[8+food87xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food91on == 1'b1) && food91_data[8+food91xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food92on == 1'b1) && food92_data[8+food92xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food93on == 1'b1) && food93_data[8+food93xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food94on == 1'b1) && food94_data[8+food94xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food95on == 1'b1) && food95_data[8+food95xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food96on == 1'b1) && food96_data[8+food96xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food97on == 1'b1) && food97_data[8+food97xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food101on == 1'b1) && food101_data[8+food101xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food102on == 1'b1) && food102_data[8+food102xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food103on == 1'b1) && food103_data[8+food103xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food104on == 1'b1) && food104_data[8+food104xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food105on == 1'b1) && food105_data[8+food105xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food106on == 1'b1) && food106_data[8+food106xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food107on == 1'b1) && food107_data[8+food107xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food111on == 1'b1) && food111_data[8+food111xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food112on == 1'b1) && food112_data[8+food112xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food113on == 1'b1) && food113_data[8+food113xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food114on == 1'b1) && food114_data[8+food114xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food115on == 1'b1) && food115_data[8+food115xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food116on == 1'b1) && food116_data[8+food116xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food117on == 1'b1) && food117_data[8+food117xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food121on == 1'b1) && food121_data[8+food121xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food122on == 1'b1) && food122_data[8+food122xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food123on == 1'b1) && food123_data[8+food123xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food124on == 1'b1) && food124_data[8+food124xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food125on == 1'b1) && food125_data[8+food125xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food131on == 1'b1) && food131_data[8+food131xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food132on == 1'b1) && food132_data[8+food132xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food133on == 1'b1) && food133_data[8+food133xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food134on == 1'b1) && food134_data[8+food134xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food135on == 1'b1) && food135_data[8+food135xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food141on == 1'b1) && food141_data[8+food141xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food142on == 1'b1) && food142_data[8+food142xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food143on == 1'b1) && food143_data[8+food143xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food144on == 1'b1) && food144_data[8+food144xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food151on == 1'b1) && food151_data[8+food151xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food152on == 1'b1) && food152_data[8+food152xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food153on == 1'b1) && food153_data[8+food153xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if((food154on == 1'b1) && food154_data[8+food154xsig-DrawX] == 1'b1)
			begin
				Red = 8'h00;
				Green = 8'hff;
				Blue = 8'h00;
			end
			else if(game_over == 1'b1)
			begin
				if (print_game_over == 1'b0 && game_over_data[8+start_x_g-DrawX] == 1'b1) begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else if (print_game_over == 1'b1 && game_over_data[8+4+start_x_g-DrawX] == 1'b1) begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'h00;
				end
				else begin
					Red = 8'h00;
					Green = 8'h00;
					Blue = 8'h00;
				end
			end
			else if (score_S_on == 1'b1 && score_data[8+start_score_x_S-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (score_c_on == 1'b1 && score_data[8+start_score_x_c-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (score_o_on == 1'b1 && score_data[8+start_score_x_o-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (score_r_on == 1'b1 && score_data[8+start_score_x_r-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (score_e_on == 1'b1 && score_data[8+start_score_x_e-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (score_colon_on == 1'b1 && score_data[8+start_score_x_colon-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (score_100_on == 1'b1 && score_data[8+start_score_x_100-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (score_10_on == 1'b1 && score_data[8+start_score_x_10-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else if (score_1_on == 1'b1 && score_data[8+start_score_x_1-DrawX] == 1'b1) begin
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end
			else
			begin
				Red = 8'h00;
				Green = 8'h00;
				Blue = 8'h00;
			end
		end
		else begin
			Red = 8'h00;
			Green = 8'h00;
			Blue = 8'h00;
		end
	end
		
    
endmodule
