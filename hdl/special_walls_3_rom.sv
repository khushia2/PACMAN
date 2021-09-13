module special_walls_3_rom (
    input [1:0] addr,
    output [325:0] data
);

parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH = 326;

logic [ADDR_WIDTH-1:0] addr_reg;

parameter [0:3][DATA_WIDTH-1:0] ROM = {
    //Top 
    -326'd1,
    -326'd1,
    -326'd1,
    -326'd1
};

assign data = ROM[addr];

endmodule