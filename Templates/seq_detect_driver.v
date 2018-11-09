`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 11/04/2018 09:56:49 AM
// Design Name: 
// Module Name: seq_detect_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:   Driver for sequence detector experiment
// 
// Dependencies: This module requires the following modules:
//
//   cntr_udclr_nb
//   clk_divder_nbit
//   mux_8t1_nb
//   mux_2t1_nb
//   stand_dcdr_2t4_1cold
// 
// Revision:
// Revision 1.00 - File Created (11-04-2018)
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seq_detect_driver(
    input [7:0] switches,
    input clk,
    output [7:0] segs,
    output [3:0] an,
    output reg [7:0] leds
    );
    
    wire clk_slow; 
    wire [2:0] mux_sel; 
    wire switch_bit; 
    wire clk_mux_disp; 
    wire [1:0] multiplex_sel; 
    
    reg [7:0] cool_seg_data; 
    reg [7:0] crud_seg_data; 
    
    wire fsm_Z; 
        
    // dummy FSM module
    fsm_module  my_fsm (
        .clk (clk_slow),
        .X (switch_bit),
        .Z (fsm_Z)
        );
    
    //- driver for LEDs
        always @ (mux_sel)
        begin
           case (mux_sel)
              0: leds  = 'h01;  // 
              1: leds  = 'h02;  // 
              2: leds  = 'h04;  // 
              3: leds  = 'h08;  // 
              4: leds  = 'h10;  // 
              5: leds  = 'h20;  // 
              6: leds  = 'h40;  // 
              7: leds  = 'h80;  // 
              default leds = 0; 
           endcase 
        end     
    
    //- clock divider ~2Hz
    clk_divder_nbit #(.n(26)) MY_DIV (
              .clockin (clk), 
              .clockout (clk_slow) 
              );     
    
    // MUX to decider FSM data input
    mux_8t1_nb  #(.n(1)) my_8t1_mux  (
                  .SEL   (mux_sel), 
                  .D0    (switches[0]), 
                  .D1    (switches[1]), 
                  .D2    (switches[2]), 
                  .D3    (switches[3]),
                  .D4    (switches[4]),
                  .D5    (switches[5]),
                  .D6    (switches[6]),
                  .D7    (switches[7]),
                  .D_OUT (switch_bit) );  


     // counter to drive switch input MUX sel
     cntr_udclr_nb #(3) my_led_clk (
        .clk   (clk_slow), 
        .clr   (0), 
        .up    (1), 
        .ld    (0), 
        .D     (0), 
        .count (mux_sel), 
        .rco   ()   );     
    
     // counter to drive switch input MUX sel
     cntr_udclr_nb #(2) my_disp_multiplex_cntr (
        .clk   (clk_mux_disp), 
        .clr   (0), 
        .up    (1), 
        .ld    (0), 
        .D     (0), 
        .count (multiplex_sel), 
        .rco   ()   ); 

    //- clock divider for muliplexed displayz
    clk_divder_nbit #(.n(13)) mux_display_clk (
              .clockin (clk), 
              .clockout (clk_mux_disp) 
              );     
    
    //- standard decoder to drive anodes
    stand_dcdr_2t4_1cold  my_stand_dcdr  (
                    .SEL    (multiplex_sel), 
                    .D_OUT  (an)  );    
    
   
    //- 7 seg decoder for good message 
    always @ (multiplex_sel)
    begin
       case (multiplex_sel)
          0: cool_seg_data  = 'h63; 
          1: cool_seg_data  = 'hC5;  
          2: cool_seg_data  = 'hC5;  
          3: cool_seg_data  = 'hE3;
          default cool_seg_data = 0; 
       endcase 
    end 

    //- 7 seg decoder for bad message
    always @ (multiplex_sel)
    begin
       case (multiplex_sel)
          0: crud_seg_data  = 'h63; 
          1: crud_seg_data  = 'hF5;  
          2: crud_seg_data  = 'hC7;  
          3: crud_seg_data  = 'h85;
          default crud_seg_data = 0; 
       endcase 
    end 
    
   //- Selects either good/bad message based on FSM output 
   mux_2t1_nb  #(.n(8)) my_2t1_mux  (
           .SEL   (fsm_Z), 
           .D0    (cool_seg_data), 
           .D1    (crud_seg_data), 
           .D_OUT (segs) );  
         
endmodule