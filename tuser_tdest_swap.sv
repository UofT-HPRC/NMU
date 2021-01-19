`timescale 1ns / 1ps
`default_nettype none


module tuser_tdest_swap
#(
    //AXI Stream Params
    parameter AXIS_BUS_WIDTH = 64,
    parameter AXIS_ID_WIDTH = 4,
    parameter AXIS_DEST_WIDTH = 4
)
(
    //Input AXI stream
    input wire [AXIS_BUS_WIDTH-1:0]       axis_in_tdata,
    input wire [((AXIS_ID_WIDTH<1)?1:AXIS_ID_WIDTH)-1:0]
                                          axis_in_tid,
    input wire [((AXIS_DEST_WIDTH<1)?1:AXIS_DEST_WIDTH)-1:0]
                                          axis_in_tuser,
    input wire [(AXIS_BUS_WIDTH/8)-1:0]   axis_in_tkeep,
    input wire                            axis_in_tlast,
    input wire                            axis_in_tvalid,
    output wire                           axis_in_tready,
    
    //Output AXI stream
    output wire [AXIS_BUS_WIDTH-1:0]      axis_out_tdata,
    output wire [((AXIS_ID_WIDTH<1)?1:AXIS_ID_WIDTH)-1:0]
                                          axis_out_tid,
    output wire [((AXIS_DEST_WIDTH<1)?1:AXIS_DEST_WIDTH)-1:0]
                                          axis_out_tdest,
    output wire [(AXIS_BUS_WIDTH/8)-1:0]  axis_out_tkeep,
    output wire                           axis_out_tlast,
    output wire                           axis_out_tvalid,
    input wire                            axis_out_tready,

    //Clocking (unused)
    input wire  aclk,
    input wire  aresetn
);

    //--------------------------------------------------------//
    //   Connect signals, swap tuser and tdest                //
    //--------------------------------------------------------//

    assign axis_out_tdata = axis_in_tdata;
    assign axis_out_tid = axis_in_tid;
    assign axis_out_tdest = axis_in_tuser; //SWAP
    assign axis_out_tkeep = axis_in_tkeep;
    assign axis_out_tlast = axis_in_tlast;
    assign axis_out_tvalid = axis_in_tvalid;
    assign axis_in_tready = axis_out_tready;



endmodule

`default_nettype wire