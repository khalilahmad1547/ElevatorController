`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 07:41:40 PM
// Design Name: 
// Module Name: Elevater
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


module Elevater(
    input clk,
    // All input buttons which will be at each floor
    // ground floor up button
    input ground_flr_up_btn,
    // 1st floor up button
    input first_flr_up_btn,
    // 1st floor down button
    input first_flr_dwn_btn,
    // 2nd floor down button
    input second_flr_dwn_btn,
    
    // All inputs from insode Elevater
    // Button to go to ground floor
    input go_to_ground_flr,
    // Button to go to 1st floor
    input go_to_first_flr,
    // Button to go to 2nd floor
    input go_to_second_flr,
    
    // All Outputs
    // it will show lift is moving or not
    output reg is_moving,
    // this will show the UP direction of the lift
    output reg is_moving_up,
    // this will show the down direction of the lift
    output reg is_moving_dwn,
    // status of the door weather it is open or not
    output reg is_door_close,
    // it will show the current floor on which lift is
    output reg [1:0] current_flr
    );

    parameter Yes = 1'b1;
    parameter No = 1'b0;

    parameter Ground_Floor = 2'b00;
    parameter First_Floor = 2'b01;
    parameter Second_Floor = 2'b10;

    reg G1, G2, G3, G4, G5, G6, G7;
    reg Wait;
    reg [1:0] Next_Floor;

    // initializing
    initial begin
        current_flr <= Ground_Floor;
        Next_Floor <= Ground_Floor;
        G1 <= No;
        G2 <= No;
        G3 <= No;
        G4 <= No;
        G5 <= No;
        G6 <= No;
        G7 <= No;
        Wait <= No;
        is_door_close <= No;
        is_moving <= No;
        is_moving_up <= No;
        is_moving_dwn <= No;
    end


    // main logic
    always @(posedge clk) begin
        // not waiting for internal input
        if (Wait == No) begin
        // Group 1
            if (second_flr_dwn_btn == Yes || go_to_second_flr == Yes ) begin
                G1 <= Yes;
            end
            else begin
                G1 <= No;
            end
            // Group 2
            if (first_flr_up_btn == Yes || first_flr_dwn_btn == Yes || ground_flr_up_btn == Yes || go_to_first_flr == Yes || go_to_ground_flr == Yes) begin
                G2 <= Yes;
            end
            else begin
                G2 <= No;
            end
            // Group 3
            if (ground_flr_up_btn == Yes || go_to_ground_flr == Yes ) begin
                G3 <= Yes;
            end
            else begin
                G3 <= No;
            end
            // Group 4
            if (ground_flr_up_btn == Yes || go_to_ground_flr == Yes ) begin
                G4 <= Yes;
            end
            else begin
                G4 <= No;
            end
            // Group 5
            if (first_flr_up_btn == Yes || first_flr_dwn_btn == Yes || second_flr_dwn_btn == Yes || go_to_first_flr == Yes || go_to_second_flr == Yes) begin
                G5 <= Yes;
            end
            else begin
                G5 <= No;
            end
            // Group 6
            if (first_flr_up_btn == Yes || first_flr_dwn_btn == Yes || go_to_first_flr == Yes ) begin
                G6 <= Yes;
            end
            else begin
                G6 <= No;
            end
            // Group 7
            if (second_flr_dwn_btn == Yes || go_to_second_flr == Yes ) begin
                G7 <= Yes;
            end
            else begin
                G7 <= No;
            end

            case (current_flr)
                    Ground_Floor:
                        if (G4 == Yes) begin
                            // Open the door
                            is_door_close <= No;
                            // clear signls
                            G4 <= No;
                            // Wait for the Input
                            Wait <= Yes;
                            // Update Status Signals
                            is_moving <= No;
                            is_moving_up <= No;
                            is_moving_dwn <= No;
                        end
                        else if (G5 == Yes) begin
                            // close door
                            is_door_close <= Yes;
                            // Next Floor to go
                            Next_Floor <= First_Floor;
                            // Update Status Signals
                            is_moving <= Yes;
                            is_moving_up <= Yes;
                            is_moving_dwn <= No;
                        end
                    First_Floor:
                        if (G6 == Yes) begin
                            // Open the door
                            is_door_close <= No;
                            // clear signls
                            G6 <= No;
                            // Wait for the Input
                            Wait <= Yes;
                            // Update Status Signals
                            is_moving <= No;
                            is_moving_up <= No;
                            is_moving_dwn <= No;
                        end
                        else if (G3 == Yes) begin
                            // close door
                            is_door_close <= Yes;
                            // Next Floor to go
                            Next_Floor <= Ground_Floor;
                            // Update Status Signals
                            is_moving <= Yes;
                            is_moving_up <= No;
                            is_moving_dwn <= Yes;
                        end
                        else if (G7 == Yes) begin
                            // close door
                            is_door_close <= Yes;
                            // Next Floor to go
                            Next_Floor <= Second_Floor;
                            // Update Status Signals
                            is_moving <= Yes;
                            is_moving_up <= Yes;
                            is_moving_dwn <= No;
                        end
                    Second_Floor:
                        if (G1 == Yes) begin
                            // Open the door
                            is_door_close <= No;
                            // clear signls
                            G1 <= No;
                            // Wait for the Input
                            Wait <= Yes;
                            // Update Status Signals
                            is_moving <= No;
                            is_moving_up <= No;
                            is_moving_dwn <= No;
                        end
                        else if (G2 == Yes) begin
                            // close door
                            is_door_close <= Yes;
                            // Next Floor to go
                            Next_Floor <= First_Floor;
                            // Update Status Signals
                            is_moving <= No;
                            is_moving_up <= No;
                            is_moving_dwn <= Yes;
                        end
                    default:
                        Next_Floor <= Ground_Floor;
                endcase

            end
    end

    // always @(posedge clk) begin
    //     if(go_to_ground_flr || go_to_first_flr || go_to_second_flr)
    //         Wait <= No;
    // end
    always @(posedge Wait ) begin
        #5 Wait = ~Wait;
    end

    always @(posedge clk ) begin
        current_flr <= Next_Floor;
    end
endmodule
