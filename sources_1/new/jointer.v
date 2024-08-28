`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 12:40:01
// Design Name: 
// Module Name: jointer
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


module jointer(clk,op,r1,r2,r3,r4,cg,cl,ce,gr,ls,eq,z);
input [2:0]op;
input clk;
input [31:0]r1,r2,r3,r4;
input cg,cl,ce;
output reg [31:0]z;
output reg gr,ls,eq;
always@(r1,r2,r3,r4,cg,cl,ce)
begin
gr=0;ls=0;eq=0;z=0;
if(op==3'b000)
z=r1;
else if(op==3'b001)
z=r2;
else if(op==3'b010)
z=r3;
else if(op==3'b011)
z=r4;
else if(op==3'b100)
begin
gr=cg;
ls=cl;
eq=ce;
end
//else
//z=0;
//gr=0;
//eq=0;
//ls=0;
end
endmodule
