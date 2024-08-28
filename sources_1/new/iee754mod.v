`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2024 13:12:41
// Design Name: 
// Module Name: iee754mod
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


module iee754mod(op,a,b,z,clk);
input clk;
input op;
input  [31:0] a,b;
output reg [31:0] z;

reg [24:0]s;
reg [23:0]p,q,m;
reg [7:0]t,k;
reg h;
reg count=0;
reg [4:0]cap;
reg [4:0]i;

always@(posedge clk)
begin
p[23]=1;
q[23]=1;
p[22:0]=a[22:0];
q[22:0]=b[22:0];
if(op==0)
begin
if(a[31]==b[31])
begin
 z[31]=a[31];
    if(a[30:23]==b[30:23])
      begin
      s[24:0]= p[23:0]+q[23:0];
      z[22:0]= s[23:1];
      z[30:23]= a[30:23]+1'b1;
      end
    else
    begin
       if(a[30:0]>b[30:0])
         begin
           k=a[30:23]-b[30:23];
           q[23:0]={1'b1,b[22:0]}>>k;
           s[24:0]= p[23:0]+q[23:0];
         if(s[24]==1)
         begin
         z[22:0]=s[22:0];
         z[30:23]=a[30:23]+1'b1;
         end
         else
         begin
         z[22:0]=s[22:0];
         z[30:23]=a[30:23];
         end
         end
       else
         begin
         k=b[30:23]-a[30:23];
         p[23:0]={1'b1,b[22:0]}>>k;
         s[24:0]= p[23:0]+q[23:0];
         
         if(s[24]==1)
           begin
           z[22:0]=s[22:0];
           z[30:23]=b[30:23]+1'b1;
           end
         else
           begin
           z[22:0]=s[22:0];
           z[30:23]=b[30:23];
           end
        end
end  
end
else
begin  
    if(a[30:0]>b[30:0])
       begin
        z[31]=a[31];
       z[30:23]=a[30:23];
       if(a[30:23]==b[30:23])
       begin
       
        s[24:0]= p[23:0]-q[23:0];
        end
       else
         begin
         k=a[30:23]-b[30:23];
         q[23:0]={1'b1,b[22:0]}>>k;
         s[24:0]= p[23:0]-q[23:0];
         end 
       end
    else
       begin
        z[31]=b[31];
        z[30:23]=b[30:23];
          if(a[30:23]==b[30:23])
            s[24:0]= q[23:0]-p[23:0];
          else
           begin
           k=a[30:23]-b[30:23];
           p[23:0]={1'b1,a[22:0]}>>k;
           s[24:0]= q[23:0]-p[23:0];
           end 
       end 
        count=0;
        cap=23;
    for(i=23;i>0;i=i-1)
     begin
       if(s[i]==1 && count==0)
          begin
           cap=i;
           count=count+1;
          end
      end
      m[23:0]=s[23:0]<<(23-cap);
      z[22:0]=m[22:0];
      z[30:23]=z[30:23]-(23-cap);
      //z[30:23]=b[30:23]-(23-cap);
 end
 end
 
 else
 begin
 h=~b[31];
 if(a[31]==h)
begin
 z[31]=a[31];
    if(a[30:23]==b[30:23])
      begin
      s[24:0]= p[23:0]+q[23:0];
      z[22:0]= s[23:1];
      z[30:23]= a[30:23]+1'b1;
      end
    else
    begin
       if(a[30:0]>b[30:0])
         begin
           k=a[30:23]-b[30:23];
           q[23:0]={1'b1,b[22:0]}>>k;
           s[24:0]= p[23:0]+q[23:0];
         if(s[24]==1)
         begin
         z[22:0]=s[23:0];
         z[30:23]=a[30:23]+1'b1;
         end
         else
         begin
         z[22:0]=s[22:0];
         z[30:23]=a[30:23];
         end
         end
       else
         begin
         k=b[30:23]-a[30:23];
         p[23:0]={1'b1,b[22:0]}>>k;
         s[24:0]= p[23:0]+q[23:0];
         
         if(s[24]==1)
           begin
           z[22:0]=s[23:0];
           z[30:23]=b[30:23]+1'b1;
           end
         else
           begin
           z[22:0]=s[22:0];
           z[30:23]=b[30:23];
           end
        end
end  
end
else
begin  
    if(a[30:0]>b[30:0])
       begin
        z[31]=a[31];
        z[30:23]=a[30:23];
       if(a[30:23]==b[30:23])
        s[24:0]= p[23:0]-q[23:0];
       else
         begin
         k=a[30:23]-b[30:23];
         q[23:0]={1'b1,b[22:0]}>>k;
         s[24:0]= p[23:0]-q[23:0];
         end 
       end
    else
       begin
        z[31]=h;
        z[30:23]=b[30:23];
          if(a[30:23]==b[30:23])
            s[24:0]= q[23:0]-p[23:0];
          else
           begin
           k=a[30:23]-b[30:23];
           p[23:0]={1'b1,a[22:0]}>>k;
           s[24:0]= q[23:0]-p[23:0];
           end 
       end 
        count=0;
        cap=23;
    for(i=23;i>0;i=i-1)
     begin
       if(s[i]==1 && count==0)
          begin
           cap=i;
           count=count+1;
          end
      end
      s[23:0]=s[23:0]<<(23-cap);
      z[22:0]=s[22:0];
      z[30:23]=z[30:23]-(23-cap);
 end
 end
 end      
endmodule
