module wall_rom (
    input [1:0] addr,
    output [599:0] data
);

parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH =  600;

logic [ADDR_WIDTH-1:0] addr_reg;

parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
    -600'd1,
    -600'd1,
    -600'd1,
    -600'd1
};

assign data = ROM[addr];

endmodule