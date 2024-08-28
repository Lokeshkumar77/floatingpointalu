`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 12:36:38
// Design Name: 
// Module Name: multiplier
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


module multiplier(clk,A,B,out);
input clk;
input [31:0]A,B;
output reg [31:0]out;
reg s1,s2,s_out;
reg [7:0]e1,e2,e_out;
reg [22:0]m1,m2,m_out;
reg zero_out;
reg [47:0]mul; 
reg x;  

always@(posedge clk)
begin
    {s1,e1,m1}={A[31],A[30:23],A[22:0]};
    {s2,e2,m2}={B[31],B[30:23],B[22:0]};
    zero_out = ({e1,m1}==0)|({e2,m2}==0); 
    s_out = s1 ^ s2;
    mul = {1'b1,m1} * {1'b1,m2};
    m_out = (mul[47]==1)?mul[46:24]:mul[45:23];
    x = (mul[47]==1)?1'b1:1'b0;
    e_out = e1 + e2 + x - 127;

    out = (zero_out==1)?0:{s_out,e_out,m_out};
end
endmodule

