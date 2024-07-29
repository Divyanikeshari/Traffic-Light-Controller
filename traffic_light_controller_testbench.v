`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module traffic_signal_tb;
reg clk,clr, X;
wire [1:0] hwy,contry; 

signal_controller uut(hwy,contry,X,clk,clr);
//clk generator
initial
begin
clk=0;
forever #10 clk=~clk;
end

initial
begin
X=0;
clr=0;
#10
clr=1;
#10
clr=0;
end

initial 
begin 
#50 
X=0;
#100
X=1;
#100
X=0;
#100
X=1;
#100
X=0;
#100
clr=1;
#10
clr=0;
#20
$finish ;
end
endmodule
