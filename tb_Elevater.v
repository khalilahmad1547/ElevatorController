`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 07:43:14 PM
// Design Name: 
// Module Name: tb_Elevater
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_Elevater;
    // Inouts for UUT
    reg clk;
    reg ground_flr_up_btn;
    reg first_flr_up_btn;
    reg first_flr_dwn_btn;
    reg second_flr_dwn_btn;
    reg go_to_ground_flr;
    reg go_to_first_flr;
    reg go_to_second_flr;

    // Outputs for UUT
    wire is_moving;
    wire is_moving_up;
    wire is_moving_dwn;
    wire is_door_close;
    wire [1:0] current_flr;

    // UUT
    Elevater E(
    .clk(clk),
    .ground_flr_up_btn(ground_flr_up_btn),
    .first_flr_up_btn(first_flr_up_btn),
    .first_flr_dwn_btn(first_flr_dwn_btn),
    .second_flr_dwn_btn(second_flr_dwn_btn),
    
    .go_to_ground_flr(go_to_ground_flr),
    .go_to_first_flr(go_to_first_flr),
    .go_to_second_flr(go_to_second_flr),
    
    .is_moving(is_moving),
    .is_moving_up(is_moving_up),
    .is_moving_dwn(is_moving_dwn),
    .is_door_close(is_door_close),
    .current_flr(current_flr)
    );

    initial begin
    ///////////////////////////////////////
    // picking test
    // // Single Signal Test
    // // some one on 2nd floor
    // ground_flr_up_btn = 1'b0;
    // first_flr_up_btn = 1'b0;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b1;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20
    // // some one on ground floor
    // ground_flr_up_btn = 1'b1;
    // first_flr_up_btn = 1'b0;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b0;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20
    // // some one on 1st floor
    // ground_flr_up_btn = 1'b0;
    // first_flr_up_btn = 1'b1;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b0;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20
    // // No Signals
    // ground_flr_up_btn = 1'b0;
    // first_flr_up_btn = 1'b0;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b0;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20
    // // some one on ground floor
    // ground_flr_up_btn = 1'b1;
    // first_flr_up_btn = 1'b0;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b0;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20
    // // some one on 1st floor
    // ground_flr_up_btn = 1'b0;
    // first_flr_up_btn = 1'b1;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b0;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20

    ///////////////////////////////////////
    // Droping Test
    // Some one on ground Floor
    ground_flr_up_btn = 1'b1;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    // go to 2nd floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b1;
    #20
    // Some one Ground floor
    ground_flr_up_btn = 1'b1;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    // go to 1st floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b1;
    go_to_second_flr = 1'b0;
    #20
    // // Some one on 1st Floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b1;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    // go to 2nd floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b1;
    #20
    // Some one 1st floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b1;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    // go to ground floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b1;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    // Some one on 2nd floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b1;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    // Go to Ground floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b1;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    // Some one on 2nd floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b1;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    // Go to 1st floor
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b1;
    go_to_second_flr = 1'b0;
    #20
    //////////////////////////////////////////
    // // go to 1st floor
    // ground_flr_up_btn = 1'b0;
    // first_flr_up_btn = 1'b1;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b0;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20
    // go to 2nd floor
    // ground_flr_up_btn = 1'b0;
    // first_flr_up_btn = 1'b0;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b1;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20
    // // go to 1st floor
    // ground_flr_up_btn = 1'b0;
    // first_flr_up_btn = 1'b0;
    // first_flr_dwn_btn = 1'b0;
    // second_flr_dwn_btn = 1'b0;
    // go_to_ground_flr = 1'b0;
    // go_to_first_flr = 1'b0;
    // go_to_second_flr = 1'b0;
    // #20

    ///////////////////////////////////////
    // All clear
    ground_flr_up_btn = 1'b0;
    first_flr_up_btn = 1'b0;
    first_flr_dwn_btn = 1'b0;
    second_flr_dwn_btn = 1'b0;
    go_to_ground_flr = 1'b0;
    go_to_first_flr = 1'b0;
    go_to_second_flr = 1'b0;
    #20
    $finish;
    end

    // clock
 initial 
     clk = 0;
 always 
     #1 clk = ~clk;
endmodule
