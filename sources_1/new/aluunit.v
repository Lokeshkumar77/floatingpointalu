`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 11:57:08
// Design Name: 
// Module Name: aluunit
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



 
module aluunit(clk,op,a,b,z,gr,ls,eq);
input clk;
input[2:0]op;
input [31:0]a,b;
output  [31:0]z;
output gr,ls,eq;
wire [31:0]p1,p2,p3,p4,zr;
wire cg,cl,ce;
wire cgr,clr,cer;
wire clk1,clk2,clk3,clk4,clk5;
assign clk1=(op==3'd0)?clk:0;
assign clk2=(op==3'd1)?clk:0;
assign clk3=(op==3'd2)?clk:0;
assign clk4=(op==3'd3)?clk:0;
assign clk5=(op==3'd4)?clk:0;

iee754mod c1(1'b0,a,b,p1,clk1);
iee754mod c2(1'b1,a,b,p2,clk2);
multiplier c3(clk3,a,b,p3);
division c4(a,b,p4,clk4);
comparator c5(a,b,cg,cl,ce,clk5);
jointer c6(clk,op,p1,p2,p3,p4,cg,cl,ce,cgr,clr,cer,zr);
assign z=zr;
assign gr=cgr;
assign ls=clr;
assign eq=cer;
endmodule
