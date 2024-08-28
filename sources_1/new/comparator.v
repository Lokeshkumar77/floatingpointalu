`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2024 20:06:57
// Design Name: 
// Module Name: comparator
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


module comparator(a,b,gr,ls,eq,clk);
input clk;
input [31:0]a,b;
output reg gr,ls,eq;
reg r;
reg [31:0]c;

always@(posedge clk)
begin
gr=0;ls=0;eq=0;
r=a[31]^b[31];
if(r==0)
begin
 c=a[30:0]-b[30:0];
  if(c==0)
  eq=1'b1;
  else
   begin
   if(c[31]==1)
    begin
     if(a[31]==0)
     ls=1'b1;
     else 
     gr=1'b1;
    end  
   else
     begin
     if(a[31]==0)
     gr=1'b1;
     else 
     ls=1'b1;
     end
   end
 end
else
begin
if(a[31]==1)
ls=1'b1;
else
gr=1'b1;   
end
end
endmodule
