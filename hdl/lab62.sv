//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 62                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab62 (

      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);




logic Reset_h, vssig, blank, sync, VGA_Clk;


//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig, pacmanxsig, pacmanysig;
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode;
	logic pacman_type;
	logic [9:0] clydexsig, clydeysig, inkyxsig, inkyysig, blinkyxsig, blinkyysig, pinkyxsig, pinkyysig;
	logic [9:0] food1xsig, food1ysig, food2xsig, food2ysig, food3xsig, food3ysig, food4xsig, food4ysig, food5xsig, food5ysig, food6xsig, food6ysig;
	logic [9:0] food7xsig, food7ysig, food8xsig, food8ysig, food9xsig, food9ysig, food10xsig, food10ysig;
	logic [9:0] food11xsig, food11ysig, food12xsig, food12ysig, food13xsig, food13ysig, food14xsig, food14ysig, food15xsig, food15ysig, food16xsig, food16ysig;
	logic [9:0] food17xsig, food17ysig, food18xsig, food18ysig, food19xsig, food19ysig, food20xsig, food20ysig;
	logic [9:0] food21xsig, food21ysig, food22xsig, food22ysig, food23xsig, food23ysig, food24xsig, food24ysig, food25xsig, food25ysig, food26xsig, food26ysig;
	logic [9:0] food27xsig, food27ysig, food28xsig, food28ysig, food29xsig, food29ysig, food30xsig, food30ysig;
	logic [9:0] food31xsig, food31ysig, food32xsig, food32ysig, food33xsig, food33ysig, food34xsig, food34ysig, food35xsig, food35ysig, food36xsig, food36ysig;
	logic [9:0] food37xsig, food37ysig, food38xsig, food38ysig, food39xsig, food39ysig, food40xsig, food40ysig;
	logic [9:0] food41xsig, food41ysig, food42xsig, food42ysig, food43xsig, food43ysig, food44xsig, food44ysig, food45xsig, food45ysig, food46xsig, food46ysig, food47xsig, food47ysig;
	logic [9:0] food51xsig, food51ysig, food52xsig, food52ysig, food53xsig, food53ysig, food54xsig, food54ysig, food55xsig, food55ysig, food56xsig, food56ysig, food57xsig, food57ysig;
	logic [9:0] food61xsig, food61ysig, food62xsig, food62ysig, food63xsig, food63ysig, food64xsig, food64ysig, food65xsig, food65ysig, food66xsig, food66ysig, food67xsig, food67ysig;
	logic [9:0] food71xsig, food71ysig, food72xsig, food72ysig, food73xsig, food73ysig, food74xsig, food74ysig, food75xsig, food75ysig, food76xsig, food76ysig, food77xsig, food77ysig;
	logic [9:0] food81xsig, food81ysig, food82xsig, food82ysig, food83xsig, food83ysig, food84xsig, food84ysig, food85xsig, food85ysig, food86xsig, food86ysig, food87xsig, food87ysig;
	logic [9:0] food91xsig, food91ysig, food92xsig, food92ysig, food93xsig, food93ysig, food94xsig, food94ysig, food95xsig, food95ysig, food96xsig, food96ysig, food97xsig, food97ysig;
	logic [9:0] food101xsig, food101ysig, food102xsig, food102ysig, food103xsig, food103ysig, food104xsig, food104ysig, food105xsig, food105ysig, food106xsig, food106ysig, food107xsig, food107ysig;
	logic [9:0] food111xsig, food111ysig, food112xsig, food112ysig, food113xsig, food113ysig, food114xsig, food114ysig, food115xsig, food115ysig, food116xsig, food116ysig, food117xsig, food117ysig;
	logic [9:0] food121xsig, food121ysig, food122xsig, food122ysig, food123xsig, food123ysig, food124xsig, food124ysig, food125xsig, food125ysig;
	logic [9:0] food131xsig, food131ysig, food132xsig, food132ysig, food133xsig, food133ysig, food134xsig, food134ysig, food135xsig, food135ysig;
	logic [9:0] food141xsig, food141ysig, food142xsig, food142ysig, food143xsig, food143ysig, food144xsig, food144ysig;
	logic [9:0] food151xsig, food151ysig, food152xsig, food152ysig, food153xsig, food153ysig, food154xsig, food154ysig;
	logic food1on, food2on, food3on, food4on, food5on, food6on, food7on, food8on, food9on, food10on;
	logic food11on, food12on, food13on, food14on, food15on, food16on, food17on, food18on, food19on, food20on;
	logic food21on, food22on, food23on, food24on, food25on, food26on, food27on, food28on, food29on, food30on;
	logic food31on, food32on, food33on, food34on, food35on, food36on, food37on, food38on, food39on, food40on;
	logic food41on, food42on, food43on, food44on, food45on, food46on, food47on;
	logic food51on, food52on, food53on, food54on, food55on, food56on, food57on;
	logic food61on, food62on, food63on, food64on, food65on, food66on, food67on;
	logic food71on, food72on, food73on, food74on, food75on, food76on, food77on;
	logic food81on, food82on, food83on, food84on, food85on, food86on, food87on;
	logic food91on, food92on, food93on, food94on, food95on, food96on, food97on;
	logic food101on, food102on, food103on, food104on, food105on, food106on, food107on;
	logic food111on, food112on, food113on, food114on, food115on, food116on, food117on;
	logic food121on, food122on, food123on, food124on, food125on;
	logic food131on, food132on, food133on, food134on, food135on;
	logic food141on, food142on, food143on, food144on;
	logic food151on, food152on, food153on, food154on;

	logic p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20;
	logic p21, p22, p23, p24, p25, p26, p27, p28, p29, p30;
	logic p31, p32, p33, p34, p35, p36, p37, p38, p39, p40;
	logic p41, p42, p43, p44, p45, p46, p47;
	logic p51, p52, p53, p54, p55, p56, p57;
	logic p61, p62, p63, p64, p65, p66, p67;
	logic p71, p72, p73, p74, p75, p76, p77;
	logic p81, p82, p83, p84, p85, p86, p87;
	logic p91, p92, p93, p94, p95, p96, p97;
	logic p101, p102, p103, p104, p105, p106, p107;
	logic p111, p112, p113, p114, p115, p116, p117;
	logic p121, p122, p123, p124, p125;
	logic p131, p132, p133, p134, p135;
	logic p141, p142, p143, p144;
	logic p151, p152, p153, p154;
	logic [7:0] score, score_next;

	logic game_over, start_game;
	logic [7:0] keycode_enter;

	assign keycode_enter = 8'h28;

	logic food_eaten, already_added;
	assign food_eaten = p1 | p2 | p3 | p4 | p5 | p6 | p7 | p8 | p9 | p10 | p11 | p12 | p13 | p14 | p15 | p16 | p17 | p18 | p19 | p20 
						| p21 | p22 | p23 | p24 | p25 | p26 | p27 | p28 | p29 | p30
						| p31 | p32 | p33 | p34 | p35 | p36 | p37 | p38 | p39 | p40
						| p41 | p42 | p43 | p44 | p45 | p46 | p47
						| p51 | p52 | p53 | p54 | p55 | p56 | p57
						| p61 | p62 | p63 | p64 | p65 | p66 | p67
						| p71 | p72 | p73 | p74 | p75 | p76 | p77
						| p81 | p82 | p83 | p84 | p85 | p86 | p87
						| p91 | p92 | p93 | p94 | p95 | p96 | p97
						| p101 | p102 | p103 | p104 | p105 | p106 | p107
						| p111 | p112 | p113 | p114 | p115 | p116 | p117
						| p121 | p122 | p123 | p124 | p125
						| p131 | p132 | p133 | p134 | p135
						| p141 | p142 | p143 | p144
						| p151 | p152 | p153 | p154;

	always_ff @( posedge VGA_VS ) begin : score_update
		if (Reset_h) begin
			score <= '0;
			already_added <= 1'b0;
		end
		else if (food_eaten) begin
			if (!already_added)
				score <= score_next;
			already_added <= 1'b1;
		end
		else begin
			already_added <= 1'b0;
		end
	end

	always_comb begin : score_keeping
		if (food_eaten)
			score_next = score + 8'b1;
		else
			score_next = score;
	end

	logic test, test_minus2, test_plus18, test_plus4, test_plus8, test_plus12;
	logic [1:0] direction;
	logic [9:0] Pacman_X_Motion;
	logic [9:0] Pacman_Y_Motion;

	logic [4:0] counter;
	//2D read-only dimension array
	// logic maze_array[0:524][0:799]

	//hardcode for now;
//	assign clydexsig = 10'd261;
//	assign clydeysig = 10'd249;
	// assign inkyxsig = 10'd279;
	// assign inkyysig = 10'd249;
	// assign blinkyxsig = 10'd297;
	// assign blinkyysig = 10'd249;
	// assign pinkyxsig = 10'd315;
	// assign pinkyysig = 10'd249;

	//Food
	assign food1xsig = 10'd19;
	assign food1ysig = 10'd65;
	assign food2xsig = 10'd19;
	assign food2ysig = 10'd105;
	assign food3xsig = 10'd19;
	assign food3ysig = 10'd145;
	assign food4xsig = 10'd19;
	assign food4ysig = 10'd185;
	assign food5xsig = 10'd19;
	assign food5ysig = 10'd225;
	assign food6xsig = 10'd19;
	assign food6ysig = 10'd265;
	assign food7xsig = 10'd19;
	assign food7ysig = 10'd305;
	assign food8xsig = 10'd19;
	assign food8ysig = 10'd345;
	assign food9xsig = 10'd19;
	assign food9ysig = 10'd385;
	assign food10xsig = 10'd19;
	assign food10ysig = 10'd425;

	assign food11xsig = 10'd134;
	assign food11ysig = 10'd65;
	assign food12xsig = 10'd134;
	assign food12ysig = 10'd105;
	assign food13xsig = 10'd134;
	assign food13ysig = 10'd145;
	assign food14xsig = 10'd134;
	assign food14ysig = 10'd185;
	assign food15xsig = 10'd134;
	assign food15ysig = 10'd225;
	assign food16xsig = 10'd134;
	assign food16ysig = 10'd265;
	assign food17xsig = 10'd134;
	assign food17ysig = 10'd305;
	assign food18xsig = 10'd134;
	assign food18ysig = 10'd345;
	assign food19xsig = 10'd134;
	assign food19ysig = 10'd385;
	assign food20xsig = 10'd134;
	assign food20ysig = 10'd425;
	
	assign food21xsig = 10'd478;
	assign food21ysig = 10'd65;
	assign food22xsig = 10'd478;
	assign food22ysig = 10'd105;
	assign food23xsig = 10'd478;
	assign food23ysig = 10'd145;
	assign food24xsig = 10'd478;
	assign food24ysig = 10'd185;
	assign food25xsig = 10'd478;
	assign food25ysig = 10'd225;
	assign food26xsig = 10'd478;
	assign food26ysig = 10'd265;
	assign food27xsig = 10'd478;
	assign food27ysig = 10'd305;
	assign food28xsig = 10'd478;
	assign food28ysig = 10'd345;
	assign food29xsig = 10'd478;
	assign food29ysig = 10'd385;
	assign food30xsig = 10'd478;
	assign food30ysig = 10'd425;

	assign food31xsig = 10'd593;
	assign food31ysig = 10'd65;
	assign food32xsig = 10'd593;
	assign food32ysig = 10'd105;
	assign food33xsig = 10'd593;
	assign food33ysig = 10'd145;
	assign food34xsig = 10'd593;
	assign food34ysig = 10'd185;
	assign food35xsig = 10'd593;
	assign food35ysig = 10'd225;
	assign food36xsig = 10'd593;
	assign food36ysig = 10'd265;
	assign food37xsig = 10'd593;
	assign food37ysig = 10'd305;
	assign food38xsig = 10'd593;
	assign food38ysig = 10'd345;
	assign food39xsig = 10'd593;
	assign food39ysig = 10'd385;
	assign food40xsig = 10'd593;
	assign food40ysig = 10'd425;

	assign food41xsig = 10'd177;
	assign food41ysig = 10'd65;
	assign food42xsig = 10'd220;
	assign food42ysig = 10'd65;
	assign food43xsig = 10'd263;
	assign food43ysig = 10'd65;
	assign food44xsig = 10'd306;
	assign food44ysig = 10'd65;
	assign food45xsig = 10'd349;
	assign food45ysig = 10'd65;
	assign food46xsig = 10'd392;
	assign food46ysig = 10'd65;
	assign food47xsig = 10'd435;
	assign food47ysig = 10'd65;

	assign food51xsig = 10'd177;
	assign food51ysig = 10'd87;
	assign food52xsig = 10'd220;
	assign food52ysig = 10'd87;
	assign food53xsig = 10'd263;
	assign food53ysig = 10'd87;
	assign food54xsig = 10'd306;
	assign food54ysig = 10'd87;
	assign food55xsig = 10'd349;
	assign food55ysig = 10'd87;
	assign food56xsig = 10'd392;
	assign food56ysig = 10'd87;
	assign food57xsig = 10'd435;
	assign food57ysig = 10'd87;

	assign food61xsig = 10'd177;
	assign food61ysig = 10'd109;
	assign food62xsig = 10'd220;
	assign food62ysig = 10'd109;
	assign food63xsig = 10'd263;
	assign food63ysig = 10'd109;
	assign food64xsig = 10'd306;
	assign food64ysig = 10'd109;
	assign food65xsig = 10'd349;
	assign food65ysig = 10'd109;
	assign food66xsig = 10'd392;
	assign food66ysig = 10'd109;
	assign food67xsig = 10'd435;
	assign food67ysig = 10'd109;

	assign food71xsig = 10'd177;
	assign food71ysig = 10'd232;
	assign food72xsig = 10'd220;
	assign food72ysig = 10'd232;
	assign food73xsig = 10'd263;
	assign food73ysig = 10'd232;
	assign food74xsig = 10'd306;
	assign food74ysig = 10'd232;
	assign food75xsig = 10'd349;
	assign food75ysig = 10'd232;
	assign food76xsig = 10'd392;
	assign food76ysig = 10'd232;
	assign food77xsig = 10'd435;
	assign food77ysig = 10'd232;

	assign food81xsig = 10'd177;
	assign food81ysig = 10'd276;
	assign food82xsig = 10'd220;
	assign food82ysig = 10'd276;
	assign food83xsig = 10'd263;
	assign food83ysig = 10'd276;
	assign food84xsig = 10'd306;
	assign food84ysig = 10'd276;
	assign food85xsig = 10'd349;
	assign food85ysig = 10'd276;
	assign food86xsig = 10'd392;
	assign food86ysig = 10'd276;
	assign food87xsig = 10'd435;
	assign food87ysig = 10'd276;

	assign food91xsig = 10'd177;
	assign food91ysig = 10'd399;
	assign food92xsig = 10'd220;
	assign food92ysig = 10'd399;
	assign food93xsig = 10'd263;
	assign food93ysig = 10'd399;
	assign food94xsig = 10'd306;
	assign food94ysig = 10'd399;
	assign food95xsig = 10'd349;
	assign food95ysig = 10'd399;
	assign food96xsig = 10'd392;
	assign food96ysig = 10'd399;
	assign food97xsig = 10'd435;
	assign food97ysig = 10'd399;

	assign food101xsig = 10'd177;
	assign food101ysig = 10'd421;
	assign food102xsig = 10'd220;
	assign food102ysig = 10'd421;
	assign food103xsig = 10'd263;
	assign food103ysig = 10'd421;
	assign food104xsig = 10'd306;
	assign food104ysig = 10'd421;
	assign food105xsig = 10'd349;
	assign food105ysig = 10'd421;
	assign food106xsig = 10'd392;
	assign food106ysig = 10'd421;
	assign food107xsig = 10'd435;
	assign food107ysig = 10'd421;

	assign food111xsig = 10'd177;
	assign food111ysig = 10'd443;
	assign food112xsig = 10'd220;
	assign food112ysig = 10'd443;
	assign food113xsig = 10'd263;
	assign food113ysig = 10'd443;
	assign food114xsig = 10'd306;
	assign food114ysig = 10'd443;
	assign food115xsig = 10'd349;
	assign food115ysig = 10'd443;
	assign food116xsig = 10'd392;
	assign food116ysig = 10'd443;
	assign food117xsig = 10'd435;
	assign food117ysig = 10'd443;

	assign food121xsig = 10'd112;
	assign food121ysig = 10'd65;
	assign food122xsig = 10'd112;
	assign food122ysig = 10'd105;
	assign food123xsig = 10'd112;
	assign food123ysig = 10'd145;
	assign food124xsig = 10'd112;
	assign food124ysig = 10'd185;
	assign food125xsig = 10'd112;
	assign food125ysig = 10'd225;

	assign food131xsig = 10'd500;
	assign food131ysig = 10'd65;
	assign food132xsig = 10'd500;
	assign food132ysig = 10'd105;
	assign food133xsig = 10'd500;
	assign food133ysig = 10'd145;
	assign food134xsig = 10'd500;
	assign food134ysig = 10'd185;
	assign food135xsig = 10'd500;
	assign food135ysig = 10'd225;

	assign food141xsig = 10'd112;
	assign food141ysig = 10'd305;
	assign food142xsig = 10'd112;
	assign food142ysig = 10'd345;
	assign food143xsig = 10'd112;
	assign food143ysig = 10'd385;
	assign food144xsig = 10'd112;
	assign food144ysig = 10'd425;

	assign food151xsig = 10'd500;
	assign food151ysig = 10'd305;
	assign food152xsig = 10'd500;
	assign food152ysig = 10'd345;
	assign food153xsig = 10'd500;
	assign food153ysig = 10'd385;
	assign food154xsig = 10'd500;
	assign food154ysig = 10'd425;
	
	
//	
//	logic MAX10_CLK1_25;
//	enum unsigned int {
//					change,
//					not_change
//	} state, next_state;
	
//======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (score[3:0], HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 ({4'b000}, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (keycode[7:4], HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (keycode[3:0], HEX0[6:0]);
	assign HEX0[7] = 1'b1;

	HexDriver hex_driver2 ({4'b000}, HEX2[6:0]);
	assign HEX2[7] = 1'b1;

	HexDriver hex_driver5 (score[7:4], HEX5[6:0]);
	assign HEX5[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	// assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	// assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[7:4];
	assign VGA_B = Blue[7:4];
	assign VGA_G = Green[7:4];
	
	
	lab62soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode)
		
	 );
	
//instantiate a vga_controller, ball, and color_mapper here with the ports.
	vga_controller vga_controller(
		.Clk 			(MAX10_CLK1_50),        // 50 MHz clock
		.Reset 		(Reset_h),     			// reset signal
      .hs 			(VGA_HS),        			// Horizontal sync pulse.  Active low
		.vs 			(VGA_VS),        			// Vertical sync pulse.  Active low
		.pixel_clk	(VGA_Clk), 					// 25 MHz pixel clock output
		.blank		(blank),     				// Blanking interval indicator.  Active low. blank = 0 means outside 640 x 480
		.sync			(sync),     				// Composite Sync signal.  Active low.  We don't use it in this lab,
												      // but the video DAC on the DE2 board requires an input for it.
		.DrawX		(drawxsig), 				// horizontal coordinate
		.DrawY		(drawysig)
		); 

	color_mapper color_mapper(
		.BallX		(ballxsig),
		.BallY		(ballysig),
		.PacmanX    (pacmanxsig),
		.PacmanY    (pacmanysig),
		.DrawX		(drawxsig),
		.DrawY		(drawysig),
		.Ball_size	(ballsizesig),
		.Red		(Red),
		.Green		(Green),
		.Blue		(Blue),
		.blank 		(blank),
		.pacman_type (pacman_type),
		.clydexsig   (clydexsig),
		.clydeysig   (clydeysig),
		.inkyxsig    (inkyxsig),
		.inkyysig    (inkyysig),
		.blinkyxsig  (blinkyxsig),
		.blinkyysig  (blinkyysig),
		.pinkyxsig   (pinkyxsig),
		.pinkyysig   (pinkyysig),
		.food1xsig   (food1xsig),
		.food1ysig   (food1ysig),
		.food1on     (food1on),
		.food2xsig   (food2xsig),
		.food2ysig   (food2ysig),
		.food2on     (food2on),
		.food3xsig   (food3xsig),
		.food3ysig   (food3ysig),
		.food3on     (food3on),
		.food4xsig   (food4xsig),
		.food4ysig   (food4ysig),
		.food4on     (food4on),
		.food5xsig   (food5xsig),
		.food5ysig   (food5ysig),
		.food5on     (food5on),
		.food6xsig   (food6xsig),
		.food6ysig   (food6ysig),
		.food6on     (food6on),
		.food7xsig   (food7xsig),
		.food7ysig   (food7ysig),
		.food7on     (food7on),
		.food8xsig   (food8xsig),
		.food8ysig   (food8ysig),
		.food8on     (food8on),
		.food9xsig   (food9xsig),
		.food9ysig   (food9ysig),
		.food9on     (food9on),
		.food10xsig   (food10xsig),
		.food10ysig   (food10ysig),
		.food10on     (food10on),
		.food11xsig   (food11xsig),
		.food11ysig   (food11ysig),
		.food11on     (food11on),
		.food12xsig   (food12xsig),
		.food12ysig   (food12ysig),
		.food12on     (food12on),
		.food13xsig   (food13xsig),
		.food13ysig   (food13ysig),
		.food13on     (food13on),
		.food14xsig   (food14xsig),
		.food14ysig   (food14ysig),
		.food14on     (food14on),
		.food15xsig   (food15xsig),
		.food15ysig   (food15ysig),
		.food15on     (food15on),
		.food16xsig   (food16xsig),
		.food16ysig   (food16ysig),
		.food16on     (food16on),
		.food17xsig   (food17xsig),
		.food17ysig   (food17ysig),
		.food17on     (food17on),
		.food18xsig   (food18xsig),
		.food18ysig   (food18ysig),
		.food18on     (food18on),
		.food19xsig   (food19xsig),
		.food19ysig   (food19ysig),
		.food19on     (food19on),
		.food20xsig   (food20xsig),
		.food20ysig   (food20ysig),
		.food20on     (food20on),
		.food21xsig   (food21xsig),
		.food21ysig   (food21ysig),
		.food21on     (food21on),
		.food22xsig   (food22xsig),
		.food22ysig   (food22ysig),
		.food22on     (food22on),
		.food23xsig   (food23xsig),
		.food23ysig   (food23ysig),
		.food23on     (food23on),
		.food24xsig   (food24xsig),
		.food24ysig   (food24ysig),
		.food24on     (food24on),
		.food25xsig   (food25xsig),
		.food25ysig   (food25ysig),
		.food25on     (food25on),
		.food26xsig   (food26xsig),
		.food26ysig   (food26ysig),
		.food26on     (food26on),
		.food27xsig   (food27xsig),
		.food27ysig   (food27ysig),
		.food27on     (food27on),
		.food28xsig   (food28xsig),
		.food28ysig   (food28ysig),
		.food28on     (food28on),
		.food29xsig   (food29xsig),
		.food29ysig   (food29ysig),
		.food29on     (food29on),
		.food30xsig   (food30xsig),
		.food30ysig   (food30ysig),
		.food30on     (food30on),
		.food31xsig   (food31xsig),
		.food31ysig   (food31ysig),
		.food31on     (food31on),
		.food32xsig   (food32xsig),
		.food32ysig   (food32ysig),
		.food32on     (food32on),
		.food33xsig   (food33xsig),
		.food33ysig   (food33ysig),
		.food33on     (food33on),
		.food34xsig   (food34xsig),
		.food34ysig   (food34ysig),
		.food34on     (food34on),
		.food35xsig   (food35xsig),
		.food35ysig   (food35ysig),
		.food35on     (food35on),
		.food36xsig   (food36xsig),
		.food36ysig   (food36ysig),
		.food36on     (food36on),
		.food37xsig   (food37xsig),
		.food37ysig   (food37ysig),
		.food37on     (food37on),
		.food38xsig   (food38xsig),
		.food38ysig   (food38ysig),
		.food38on     (food38on),
		.food39xsig   (food39xsig),
		.food39ysig   (food39ysig),
		.food39on     (food39on),
		.food40xsig   (food40xsig),
		.food40ysig   (food40ysig),
		.food40on     (food40on),
		.food41xsig   (food41xsig),
		.food41ysig   (food41ysig),
		.food41on     (food41on),
		.food42xsig   (food42xsig),
		.food42ysig   (food42ysig),
		.food42on     (food42on),
		.food43xsig   (food43xsig),
		.food43ysig   (food43ysig),
		.food43on     (food43on),
		.food44xsig   (food44xsig),
		.food44ysig   (food44ysig),
		.food44on     (food44on),
		.food45xsig   (food45xsig),
		.food45ysig   (food45ysig),
		.food45on     (food45on),
		.food46xsig   (food46xsig),
		.food46ysig   (food46ysig),
		.food46on     (food46on),
		.food47xsig   (food47xsig),
		.food47ysig   (food47ysig),
		.food47on     (food47on),
		.food51xsig   (food51xsig),
		.food51ysig   (food51ysig),
		.food51on     (food51on),
		.food52xsig   (food52xsig),
		.food52ysig   (food52ysig),
		.food52on     (food52on),
		.food53xsig   (food53xsig),
		.food53ysig   (food53ysig),
		.food53on     (food53on),
		.food54xsig   (food54xsig),
		.food54ysig   (food54ysig),
		.food54on     (food54on),
		.food55xsig   (food55xsig),
		.food55ysig   (food55ysig),
		.food55on     (food55on),
		.food56xsig   (food56xsig),
		.food56ysig   (food56ysig),
		.food56on     (food56on),
		.food57xsig   (food57xsig),
		.food57ysig   (food57ysig),
		.food57on     (food57on),
		.food61xsig   (food61xsig),
		.food61ysig   (food61ysig),
		.food61on     (food61on),
		.food62xsig   (food62xsig),
		.food62ysig   (food62ysig),
		.food62on     (food62on),
		.food63xsig   (food63xsig),
		.food63ysig   (food63ysig),
		.food63on     (food63on),
		.food64xsig   (food64xsig),
		.food64ysig   (food64ysig),
		.food64on     (food64on),
		.food65xsig   (food65xsig),
		.food65ysig   (food65ysig),
		.food65on     (food65on),
		.food66xsig   (food66xsig),
		.food66ysig   (food66ysig),
		.food66on     (food66on),
		.food67xsig   (food67xsig),
		.food67ysig   (food67ysig),
		.food67on     (food67on),
		.food71xsig   (food71xsig),
		.food71ysig   (food71ysig),
		.food71on     (food71on),
		.food72xsig   (food72xsig),
		.food72ysig   (food72ysig),
		.food72on     (food72on),
		.food73xsig   (food73xsig),
		.food73ysig   (food73ysig),
		.food73on     (food73on),
		.food74xsig   (food74xsig),
		.food74ysig   (food74ysig),
		.food74on     (food74on),
		.food75xsig   (food75xsig),
		.food75ysig   (food75ysig),
		.food75on     (food75on),
		.food76xsig   (food76xsig),
		.food76ysig   (food76ysig),
		.food76on     (food76on),
		.food77xsig   (food77xsig),
		.food77ysig   (food77ysig),
		.food77on     (food77on),
		.food81xsig   (food81xsig),
		.food81ysig   (food81ysig),
		.food81on     (food81on),
		.food82xsig   (food82xsig),
		.food82ysig   (food82ysig),
		.food82on     (food82on),
		.food83xsig   (food83xsig),
		.food83ysig   (food83ysig),
		.food83on     (food83on),
		.food84xsig   (food84xsig),
		.food84ysig   (food84ysig),
		.food84on     (food84on),
		.food85xsig   (food85xsig),
		.food85ysig   (food85ysig),
		.food85on     (food85on),
		.food86xsig   (food86xsig),
		.food86ysig   (food86ysig),
		.food86on     (food86on),
		.food87xsig   (food87xsig),
		.food87ysig   (food87ysig),
		.food87on     (food87on),
		.food91xsig   (food91xsig),
		.food91ysig   (food91ysig),
		.food91on     (food91on),
		.food92xsig   (food92xsig),
		.food92ysig   (food92ysig),
		.food92on     (food92on),
		.food93xsig   (food93xsig),
		.food93ysig   (food93ysig),
		.food93on     (food93on),
		.food94xsig   (food94xsig),
		.food94ysig   (food94ysig),
		.food94on     (food94on),
		.food95xsig   (food95xsig),
		.food95ysig   (food95ysig),
		.food95on     (food95on),
		.food96xsig   (food96xsig),
		.food96ysig   (food96ysig),
		.food96on     (food96on),
		.food97xsig   (food97xsig),
		.food97ysig   (food97ysig),
		.food97on     (food97on),
		.food101xsig   (food101xsig),
		.food101ysig   (food101ysig),
		.food101on     (food101on),
		.food102xsig   (food102xsig),
		.food102ysig   (food102ysig),
		.food102on     (food102on),
		.food103xsig   (food103xsig),
		.food103ysig   (food103ysig),
		.food103on     (food103on),
		.food104xsig   (food104xsig),
		.food104ysig   (food104ysig),
		.food104on     (food104on),
		.food105xsig   (food105xsig),
		.food105ysig   (food105ysig),
		.food105on     (food105on),
		.food106xsig   (food106xsig),
		.food106ysig   (food106ysig),
		.food106on     (food106on),
		.food107xsig   (food107xsig),
		.food107ysig   (food107ysig),
		.food107on     (food107on),
		.food111xsig   (food111xsig),
		.food111ysig   (food111ysig),
		.food111on     (food111on),
		.food112xsig   (food112xsig),
		.food112ysig   (food112ysig),
		.food112on     (food112on),
		.food113xsig   (food113xsig),
		.food113ysig   (food113ysig),
		.food113on     (food113on),
		.food114xsig   (food114xsig),
		.food114ysig   (food114ysig),
		.food114on     (food114on),
		.food115xsig   (food115xsig),
		.food115ysig   (food115ysig),
		.food115on     (food115on),
		.food116xsig   (food116xsig),
		.food116ysig   (food116ysig),
		.food116on     (food116on),
		.food117xsig   (food117xsig),
		.food117ysig   (food117ysig),
		.food117on     (food117on),
		.food121xsig   (food121xsig),
		.food121ysig   (food121ysig),
		.food121on     (food121on),
		.food122xsig   (food122xsig),
		.food122ysig   (food122ysig),
		.food122on     (food122on),
		.food123xsig   (food123xsig),
		.food123ysig   (food123ysig),
		.food123on     (food123on),
		.food124xsig   (food124xsig),
		.food124ysig   (food124ysig),
		.food124on     (food124on),
		.food125xsig   (food125xsig),
		.food125ysig   (food125ysig),
		.food125on     (food125on),
		.food131xsig   (food131xsig),
		.food131ysig   (food131ysig),
		.food131on     (food131on),
		.food132xsig   (food132xsig),
		.food132ysig   (food132ysig),
		.food132on     (food132on),
		.food133xsig   (food133xsig),
		.food133ysig   (food133ysig),
		.food133on     (food133on),
		.food134xsig   (food134xsig),
		.food134ysig   (food134ysig),
		.food134on     (food134on),
		.food135xsig   (food135xsig),
		.food135ysig   (food135ysig),
		.food135on     (food135on),
		.food141xsig   (food141xsig),
		.food141ysig   (food141ysig),
		.food141on     (food141on),
		.food142xsig   (food142xsig),
		.food142ysig   (food142ysig),
		.food142on     (food142on),
		.food143xsig   (food143xsig),
		.food143ysig   (food143ysig),
		.food143on     (food143on),
		.food144xsig   (food144xsig),
		.food144ysig   (food144ysig),
		.food144on     (food144on),
		.food151xsig   (food151xsig),
		.food151ysig   (food151ysig),
		.food151on     (food151on),
		.food152xsig   (food152xsig),
		.food152ysig   (food152ysig),
		.food152on     (food152on),
		.food153xsig   (food153xsig),
		.food153ysig   (food153ysig),
		.food153on     (food153on),
		.food154xsig   (food154xsig),
		.food154ysig   (food154ysig),
		.food154on     (food154on),
		.game_over     (game_over),
		.score			(score)
	);
	
	ball ball(
		.Reset 		(Reset_h),
		.frame_clk	(VGA_VS),
		.keycode	(keycode),
		.BallX		(ballxsig),
		.BallY		(ballysig),
		.BallS		(ballsizesig)
	);
	
	pacman pacman(
		.Reset     (Reset_h),
    	.frame_clk (VGA_VS),
    	.keycode   (keycode),
    	.PacmanX   (pacmanxsig),
		.PacmanY   (pacmanysig),
		.pacman_type (pacman_type),
		.test (test),
		.test_minus2 (test_minus2),
		.test_plus18 (test_plus18),
		.test_plus4 (test_plus4),
		.test_plus8 (test_plus8),
		.test_plus12 (test_plus12),
		.direction (direction),
		.Pacman_X_Motion (Pacman_X_Motion),
		.Pacman_Y_Motion (Pacman_Y_Motion),
		.counter (counter),
		.clydeX (clydexsig),
		.clydeY (clydeysig),
		.inkyX  (inkyxsig),
		.inkyY   (inkyysig),
		.blinkyX  (blinkyxsig), 
		.blinkyY  (blinkyysig),
		.pinkyX  (pinkyxsig),
		.pinkyY (pinkyysig),
		.game_over (game_over),
		.keycode_enter (keycode_enter),
		.start_game (start_game)
	);

	ghost_clyde ghost_clyde(
		.Reset     (Reset_h),
		.frame_clk (VGA_VS),
		.PosX      (clydexsig),
		.PosY      (clydeysig),
		.counter (counter),
		.game_over (game_over),
		.start_game (start_game)
	);

	ghost_inky ghost_inky(
		.Reset     (Reset_h),
		.frame_clk (VGA_VS),
		.PosX      (inkyxsig),
		.PosY      (inkyysig),
		.counter (counter),
		.game_over (game_over),
		.start_game (start_game)
	);

	ghost_pinky ghost_pinky(
		.Reset     (Reset_h),
		.frame_clk (VGA_VS),
		.PosX      (pinkyxsig),
		.PosY      (pinkyysig),
		.counter (counter),
		.game_over (game_over),
		.start_game (start_game)
	);

	ghost_blinky ghost_blinky(
		.Reset     (Reset_h),
		.frame_clk (VGA_VS),
		.PosX      (blinkyxsig),
		.PosY      (blinkyysig),
		.counter (counter),
		.game_over (game_over),
		.start_game (start_game)
	);

	//Food 
	food food1 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food1xsig),
		.FoodPosY (food1ysig),
		.FoodOn (food1on),
		.points(p1)
	);

	food food2 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food2xsig),
		.FoodPosY (food2ysig),
		.FoodOn (food2on),
		.points(p2)
	);

	food food3 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food3xsig),
		.FoodPosY (food3ysig),
		.FoodOn (food3on),
		.points(p3)
	);

	food food4 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food4xsig),
		.FoodPosY (food4ysig),
		.FoodOn (food4on),
		.points(p4)
	);

	food food5 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food5xsig),
		.FoodPosY (food5ysig),
		.FoodOn (food5on),
		.points(p5)
	);

	food food6 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food6xsig),
		.FoodPosY (food6ysig),
		.FoodOn (food6on),
		.points(p6)
	);

	food food7 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food7xsig),
		.FoodPosY (food7ysig),
		.FoodOn (food7on),
		.points(p7)
	);

	food food8 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food8xsig),
		.FoodPosY (food8ysig),
		.FoodOn (food8on),
		.points(p8)
	);

	food food9 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food9xsig),
		.FoodPosY (food9ysig),
		.FoodOn (food9on),
		.points(p9)
	);

	food food10 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food10xsig),
		.FoodPosY (food10ysig),
		.FoodOn (food10on),
		.points(p10)
	);

	food food11 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food11xsig),
		.FoodPosY (food11ysig),
		.FoodOn (food11on),
		.points(p11)
	);

	food food12 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food12xsig),
		.FoodPosY (food12ysig),
		.FoodOn (food12on),
		.points(p12)
	);

	food food13 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food13xsig),
		.FoodPosY (food13ysig),
		.FoodOn (food13on),
		.points(p13)
	);

	food food14 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food14xsig),
		.FoodPosY (food14ysig),
		.FoodOn (food14on),
		.points(p14)
	);

	food food15 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food15xsig),
		.FoodPosY (food15ysig),
		.FoodOn (food15on),
		.points(p15)
	);

	food food16 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food16xsig),
		.FoodPosY (food16ysig),
		.FoodOn (food16on),
		.points(p16)
	);

	food food17 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food17xsig),
		.FoodPosY (food17ysig),
		.FoodOn (food17on),
		.points(p17)
	);

	food food18 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food18xsig),
		.FoodPosY (food18ysig),
		.FoodOn (food18on),
		.points(p18)
	);

	food food19 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food19xsig),
		.FoodPosY (food19ysig),
		.FoodOn (food19on),
		.points(p19)
	);

	food food20 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food20xsig),
		.FoodPosY (food20ysig),
		.FoodOn (food20on),
		.points(p20)
	);

	food food21 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food21xsig),
		.FoodPosY (food21ysig),
		.FoodOn (food21on),
		.points(p21)
	);

	food food22 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food22xsig),
		.FoodPosY (food22ysig),
		.FoodOn (food22on),
		.points(p22)
	);

	food food23 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food23xsig),
		.FoodPosY (food23ysig),
		.FoodOn (food23on),
		.points(p23)
	);

	food food24 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food24xsig),
		.FoodPosY (food24ysig),
		.FoodOn (food24on),
		.points(p24)
	);

	food food25 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food25xsig),
		.FoodPosY (food25ysig),
		.FoodOn (food25on),
		.points(p25)
	);

	food food26 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food26xsig),
		.FoodPosY (food26ysig),
		.FoodOn (food26on),
		.points(p26)
	);

	food food27 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food27xsig),
		.FoodPosY (food27ysig),
		.FoodOn (food27on),
		.points(p27)
	);

	food food28 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food28xsig),
		.FoodPosY (food28ysig),
		.FoodOn (food28on),
		.points(p28)
	);

	food food29 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food29xsig),
		.FoodPosY (food29ysig),
		.FoodOn (food29on),
		.points(p29)
	);

	food food30 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food30xsig),
		.FoodPosY (food30ysig),
		.FoodOn (food30on),
		.points(p30)
	);

	food food31 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food31xsig),
		.FoodPosY (food31ysig),
		.FoodOn (food31on),
		.points(p31)
	);

	food food32 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food32xsig),
		.FoodPosY (food32ysig),
		.FoodOn (food32on),
		.points(p32)
	);

	food food33 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food33xsig),
		.FoodPosY (food33ysig),
		.FoodOn (food33on),
		.points(p33)
	);

	food food34 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food34xsig),
		.FoodPosY (food34ysig),
		.FoodOn (food34on),
		.points(p34)
	);

	food food35 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food35xsig),
		.FoodPosY (food35ysig),
		.FoodOn (food35on),
		.points(p35)
	);

	food food36 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food36xsig),
		.FoodPosY (food36ysig),
		.FoodOn (food36on),
		.points(p36)
	);

	food food37 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food37xsig),
		.FoodPosY (food37ysig),
		.FoodOn (food37on),
		.points(p37)
	);

	food food38 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food38xsig),
		.FoodPosY (food38ysig),
		.FoodOn (food38on),
		.points(p38)
	);

	food food39 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food39xsig),
		.FoodPosY (food39ysig),
		.FoodOn (food39on),
		.points(p39)
	);

	food food40 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food40xsig),
		.FoodPosY (food40ysig),
		.FoodOn (food40on),
		.points(p40)
	);

	food food41 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food41xsig),
		.FoodPosY (food41ysig),
		.FoodOn (food41on),
		.points(p41)
	);

	food food42 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food42xsig),
		.FoodPosY (food42ysig),
		.FoodOn (food42on),
		.points(p42)
	);

	food food43 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food43xsig),
		.FoodPosY (food43ysig),
		.FoodOn (food43on),
		.points(p43)
	);

	food food44 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food44xsig),
		.FoodPosY (food44ysig),
		.FoodOn (food44on),
		.points(p44)
	);

	food food45 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food45xsig),
		.FoodPosY (food45ysig),
		.FoodOn (food45on),
		.points(p45)
	);

	food food46 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food46xsig),
		.FoodPosY (food46ysig),
		.FoodOn (food46on),
		.points(p46)
	);

	food food47 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food47xsig),
		.FoodPosY (food47ysig),
		.FoodOn (food47on),
		.points(p47)
	);

	food food51 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food51xsig),
		.FoodPosY (food51ysig),
		.FoodOn (food51on),
		.points(p51)
	);

	food food52 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food52xsig),
		.FoodPosY (food52ysig),
		.FoodOn (food52on),
		.points(p52)
	);

	food food53 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food53xsig),
		.FoodPosY (food53ysig),
		.FoodOn (food53on),
		.points(p53)
	);

	food food54 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food54xsig),
		.FoodPosY (food54ysig),
		.FoodOn (food54on),
		.points(p54)
	);

	food food55 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food55xsig),
		.FoodPosY (food55ysig),
		.FoodOn (food55on),
		.points(p55)
	);

	food food56 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food56xsig),
		.FoodPosY (food56ysig),
		.FoodOn (food56on),
		.points(p56)
	);

	food food57 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food57xsig),
		.FoodPosY (food57ysig),
		.FoodOn (food57on),
		.points(p57)
	);

	food food61 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food61xsig),
		.FoodPosY (food61ysig),
		.FoodOn (food61on),
		.points(p61)
	);

	food food62 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food62xsig),
		.FoodPosY (food62ysig),
		.FoodOn (food62on),
		.points(p62)
	);

	food food63 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food63xsig),
		.FoodPosY (food63ysig),
		.FoodOn (food63on),
		.points(p63)
	);

	food food64 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food64xsig),
		.FoodPosY (food64ysig),
		.FoodOn (food64on),
		.points(p64)
	);

	food food65 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food65xsig),
		.FoodPosY (food65ysig),
		.FoodOn (food65on),
		.points(p65)
	);

	food food66 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food66xsig),
		.FoodPosY (food66ysig),
		.FoodOn (food66on),
		.points(p66)
	);

	food food67 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food67xsig),
		.FoodPosY (food67ysig),
		.FoodOn (food67on),
		.points(p67)
	);

	food food71 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food71xsig),
		.FoodPosY (food71ysig),
		.FoodOn (food71on),
		.points(p71)
	);

	food food72 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food72xsig),
		.FoodPosY (food72ysig),
		.FoodOn (food72on),
		.points(p72)
	);

	food food73 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food73xsig),
		.FoodPosY (food73ysig),
		.FoodOn (food73on),
		.points(p73)
	);

	food food74 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food74xsig),
		.FoodPosY (food74ysig),
		.FoodOn (food74on),
		.points(p74)
	);

	food food75 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food75xsig),
		.FoodPosY (food75ysig),
		.FoodOn (food75on),
		.points(p75)
	);

	food food76 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food76xsig),
		.FoodPosY (food76ysig),
		.FoodOn (food76on),
		.points(p76)
	);

	food food77 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food77xsig),
		.FoodPosY (food77ysig),
		.FoodOn (food77on),
		.points(p77)
	);

	food food81 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food81xsig),
		.FoodPosY (food81ysig),
		.FoodOn (food81on),
		.points(p81)
	);

	food food82 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food82xsig),
		.FoodPosY (food82ysig),
		.FoodOn (food82on),
		.points(p82)
	);

	food food83 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food83xsig),
		.FoodPosY (food83ysig),
		.FoodOn (food83on),
		.points(p83)
	);

	food food84 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food84xsig),
		.FoodPosY (food84ysig),
		.FoodOn (food84on),
		.points(p84)
	);

	food food85 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food85xsig),
		.FoodPosY (food85ysig),
		.FoodOn (food85on),
		.points(p85)
	);

	food food86 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food86xsig),
		.FoodPosY (food86ysig),
		.FoodOn (food86on),
		.points(p86)
	);

	food food87 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food87xsig),
		.FoodPosY (food87ysig),
		.FoodOn (food87on),
		.points(p87)
	);

	food food91 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food91xsig),
		.FoodPosY (food91ysig),
		.FoodOn (food91on),
		.points(p91)
	);

	food food92 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food92xsig),
		.FoodPosY (food92ysig),
		.FoodOn (food92on),
		.points(p92)
	);

	food food93 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food93xsig),
		.FoodPosY (food93ysig),
		.FoodOn (food93on),
		.points(p93)
	);

	food food94 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food94xsig),
		.FoodPosY (food94ysig),
		.FoodOn (food94on),
		.points(p94)
	);

	food food95 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food95xsig),
		.FoodPosY (food95ysig),
		.FoodOn (food95on),
		.points(p95)
	);

	food food96 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food96xsig),
		.FoodPosY (food96ysig),
		.FoodOn (food96on),
		.points(p96)
	);

	food food97 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food97xsig),
		.FoodPosY (food97ysig),
		.FoodOn (food97on),
		.points(p97)
	);

	food food101 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food101xsig),
		.FoodPosY (food101ysig),
		.FoodOn (food101on),
		.points(p101)
	);

	food food102 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food102xsig),
		.FoodPosY (food102ysig),
		.FoodOn (food102on),
		.points(p102)
	);

	food food103 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food103xsig),
		.FoodPosY (food103ysig),
		.FoodOn (food103on),
		.points(p103)
	);

	food food104 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food104xsig),
		.FoodPosY (food104ysig),
		.FoodOn (food104on),
		.points(p104)
	);

	food food105 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food105xsig),
		.FoodPosY (food105ysig),
		.FoodOn (food105on),
		.points(p105)
	);

	food food106 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food106xsig),
		.FoodPosY (food106ysig),
		.FoodOn (food106on),
		.points(p106)
	);

	food food107 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food107xsig),
		.FoodPosY (food107ysig),
		.FoodOn (food107on),
		.points(p107)
	);

	food food111 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food111xsig),
		.FoodPosY (food111ysig),
		.FoodOn (food111on),
		.points(p111)
	);

	food food112 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food112xsig),
		.FoodPosY (food112ysig),
		.FoodOn (food112on),
		.points(p112)
	);

	food food113 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food113xsig),
		.FoodPosY (food113ysig),
		.FoodOn (food113on),
		.points(p113)
	);

	food food114 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food114xsig),
		.FoodPosY (food114ysig),
		.FoodOn (food114on),
		.points(p114)
	);

	food food115 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food115xsig),
		.FoodPosY (food115ysig),
		.FoodOn (food115on),
		.points(p115)
	);

	food food116 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food116xsig),
		.FoodPosY (food116ysig),
		.FoodOn (food116on),
		.points(p116)
	);

	food food117 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food117xsig),
		.FoodPosY (food117ysig),
		.FoodOn (food117on),
		.points(p117)
	);

	food food121 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food121xsig),
		.FoodPosY (food121ysig),
		.FoodOn (food121on),
		.points(p121)
	);

	food food122 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food122xsig),
		.FoodPosY (food122ysig),
		.FoodOn (food122on),
		.points(p122)
	);

	food food123 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food123xsig),
		.FoodPosY (food123ysig),
		.FoodOn (food123on),
		.points(p123)
	);

	food food124 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food124xsig),
		.FoodPosY (food124ysig),
		.FoodOn (food124on),
		.points(p124)
	);

	food food125 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food125xsig),
		.FoodPosY (food125ysig),
		.FoodOn (food125on),
		.points(p125)
	);

	food food131 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food131xsig),
		.FoodPosY (food131ysig),
		.FoodOn (food131on),
		.points(p131)
	);

	food food132 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food132xsig),
		.FoodPosY (food132ysig),
		.FoodOn (food132on),
		.points(p132)
	);

	food food133 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food133xsig),
		.FoodPosY (food133ysig),
		.FoodOn (food133on),
		.points(p133)
	);

	food food134 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food134xsig),
		.FoodPosY (food134ysig),
		.FoodOn (food134on),
		.points(p134)
	);

	food food135 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food135xsig),
		.FoodPosY (food135ysig),
		.FoodOn (food135on),
		.points(p135)
	);

	food food141 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food141xsig),
		.FoodPosY (food141ysig),
		.FoodOn (food141on),
		.points(p141)
	);

	food food142 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food142xsig),
		.FoodPosY (food142ysig),
		.FoodOn (food142on),
		.points(p142)
	);

	food food143 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food143xsig),
		.FoodPosY (food143ysig),
		.FoodOn (food143on),
		.points(p143)
	);

	food food144 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food144xsig),
		.FoodPosY (food144ysig),
		.FoodOn (food144on),
		.points(p144)
	);

	food food151 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food151xsig),
		.FoodPosY (food151ysig),
		.FoodOn (food151on),
		.points(p151)
	);

	food food152 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food152xsig),
		.FoodPosY (food152ysig),
		.FoodOn (food152on),
		.points(p152)
	);

	food food153 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food153xsig),
		.FoodPosY (food153ysig),
		.FoodOn (food153on),
		.points(p153)
	);

	food food154 (
		.Reset (Reset_h),
		.frame_clk (VGA_VS),
		.PacmanX (pacmanxsig),
		.PacmanY (pacmanysig),
		.FoodPosX (food154xsig),
		.FoodPosY (food154ysig),
		.FoodOn (food154on),
		.points(p154)
	);

endmodule
