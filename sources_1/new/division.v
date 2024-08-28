`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 09:27:17
// Design Name: 
// Module Name: division
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


module division(a,b,z,clk);
input clk;
input [31:0]a,b;
output reg [31:0]z;
wire [24:0]diff1,diff2,diff3;
reg [7:0]m;
reg [22:0]count;
assign diff1={1'b1,a[22:0]}-{{1'b1,b[22:0]}*0};
assign diff2={1'b1,a[22:0]}-{{1'b1,b[22:0]}*1};
assign diff3={1'b1,a[22:0]}-{{1'b1,b[22:0]}*2};
always@(posedge clk)
begin
z[31]=a[31]^b[31];
m=a[30:23]-b[30:23];
z[30:23]=m+8'd127;
   if(diff2[24]==1)
    count=diff1;
    else
    begin
    if(diff3[24]==1)
    count=diff2;
    else
    count=0;
    end
   z[22:0]=count; 
end
endmodule
