module game_over_rom ( input [6:0]	addr,
						output [7:0]	data
					 );

parameter ADDR_WIDTH = 7;
parameter DATA_WIDTH =  8;
logic [ADDR_WIDTH-1:0] addr_reg;
			
// ROM definition				
parameter [0:111][DATA_WIDTH-1:0] ROM = {
    //G
    8'b00000000, // 0
    8'b00000000, // 1
    8'b00111100, // 2   ****
    8'b01100110, // 3  **  **
    8'b11000010, // 4 **    *
    8'b11000000, // 5 **
    8'b11000000, // 6 **
    8'b11011110, // 7 ** ****
    8'b11000110, // 8 **   **
    8'b11000110, // 9 **   **
    8'b01100110, // a  **  **
    8'b00111010, // b   *** *
    8'b00000000, // c
    8'b00000000, // d
    8'b00000000, // e
    8'b00000000, // f
    // A
    8'b00000000, // 0
    8'b00000000, // 1
    8'b00010000, // 2    *
    8'b00111000, // 3   ***
    8'b01101100, // 4  ** **
    8'b11000110, // 5 **   **
    8'b11000110, // 6 **   **
    8'b11111110, // 7 *******
    8'b11000110, // 8 **   **
    8'b11000110, // 9 **   **
    8'b11000110, // a **   **
    8'b11000110, // b **   **
    8'b00000000, // c
    8'b00000000, // d
    8'b00000000, // e
    8'b00000000, // f
    //M
    8'b00000000, // 0
    8'b00000000, // 1
    8'b11000011, // 2 **    **
    8'b11100111, // 3 ***  ***
    8'b11111111, // 4 ********
    8'b11111111, // 5 ********
    8'b11011011, // 6 ** ** **
    8'b11000011, // 7 **    **
    8'b11000011, // 8 **    **
    8'b11000011, // 9 **    **
    8'b11000011, // a **    **
    8'b11000011, // b **    **
    8'b00000000, // c
    8'b00000000, // d
    8'b00000000, // e
    8'b00000000, // f
    //E
    8'b00000000, // 0
    8'b00000000, // 1
    8'b11111110, // 2 *******
    8'b01100110, // 3  **  **
    8'b01100010, // 4  **   *
    8'b01101000, // 5  ** *
    8'b01111000, // 6  ****
    8'b01101000, // 7  ** *
    8'b01100000, // 8  **
    8'b01100010, // 9  **   *
    8'b01100110, // a  **  **
    8'b11111110, // b *******
    8'b00000000, // c
    8'b00000000, // d
    8'b00000000, // e
    8'b00000000, // f
    //O
    8'b00000000, // 0
    8'b00000000, // 1
    8'b01111100, // 2  *****
    8'b11000110, // 3 **   **
    8'b11000110, // 4 **   **
    8'b11000110, // 5 **   **
    8'b11000110, // 6 **   **
    8'b11000110, // 7 **   **
    8'b11000110, // 8 **   **
    8'b11000110, // 9 **   **
    8'b11000110, // a **   **
    8'b01111100, // b  *****
    8'b00000000, // c
    8'b00000000, // d
    8'b00000000, // e
    8'b00000000, // f
    //
    8'b00000000, // 0
    8'b00000000, // 1
    8'b11000011, // 2 **    **
    8'b11000011, // 3 **    **
    8'b11000011, // 4 **    **
    8'b11000011, // 5 **    **
    8'b11000011, // 6 **    **
    8'b11000011, // 7 **    **
    8'b11000011, // 8 **    **
    8'b01100110, // 9  **  **
    8'b00111100, // a   ****
    8'b00011000, // b    **
    8'b00000000, // c
    8'b00000000, // d
    8'b00000000, // e
    8'b00000000, // f
    //R
    8'b00000000, // 0
    8'b00000000, // 1
    8'b11111100, // 2 ******
    8'b01100110, // 3  **  **
    8'b01100110, // 4  **  **
    8'b01100110, // 5  **  **
    8'b01111100, // 6  *****
    8'b01101100, // 7  ** **
    8'b01100110, // 8  **  **
    8'b01100110, // 9  **  **
    8'b01100110, // a  **  **
    8'b11100110, // b ***  **
    8'b00000000, // c
    8'b00000000, // d
    8'b00000000, // e
    8'b00000000, // f
    };

assign data = ROM[addr];

endmodule  