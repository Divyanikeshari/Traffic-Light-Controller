`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module traffic_signal_tb;
//declaring input and output ports as reg and wire data type respectively
reg clk,clr, X;
wire [1:0] hwy,contry; 

signal_controller uut(hwy,contry,X,clk,clr);//instantiate signal_controller module
//clk generator
initial
begin
clk=0;
forever #10 clk=~clk;
end
//declaring initial conditions
initial
begin
X=0;
clr=0;
#10 clr=1;
#10 clr=0;
end
//proving  value to x
initial 
begin 
  #50 X=0;//no car detected on countryside road
  #100 X=1;//car detected on country side road
  #100 X=0;//all car passed
  #100 X=1;//again car detected
  #100 X=0;//all car passed
  #100 clr=1;//clearing data
  #10 clr=0;
  #20
  $finish ;
end
endmodule
