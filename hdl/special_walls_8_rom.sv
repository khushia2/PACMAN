module special_walls_8_rom (
    input [1:0] addr,
    output [88:0] data
);

parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH = 89;

logic [ADDR_WIDTH-1:0] addr_reg;

parameter [0:3][DATA_WIDTH-1:0] ROM = {
    //Top 
    -89'd1,
    -89'd1,
    -89'd1,
    -89'd1
};

assign data = ROM[addr];

endmodule