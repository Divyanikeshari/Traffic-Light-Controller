`timescale 1ns / 1ps

module signal_controller( hwy, contry, X, clk, clr );
//declaring input and output ports
input clk,clr;
input X;
output [1:0] hwy,contry; 
reg [1:0] hwy,contry;
//traffic signals
parameter RED= 2'b00;
parameter YELLOW =2'b01;
parameter GREEN =2'b10;

reg [2:0] state;
reg [2:0] next_state;
//state declaration
parameter S0= 3'b000;
parameter S1 =3'b001;
parameter S2 =3'b010;
parameter S3 =3'b011;
parameter S4 =3'b100;
//state logic
always @ (posedge clk or posedge clr) 
begin
        if (clr)
            state <= S0;
        else
            state <= next_state;
end
always @ (*)
state=next_state;
always @(*)
begi
case(state)
S0: begin //initial state where no car is sensed in countryside road
        hwy=GREEN;
        contry= RED;
        if(X)
        next_state=S1;
    else
        next_state=S0;
        end 
S1: begin //car detected in country side road and now traffic signal is changing from green to yellow of highway road
        #20
        hwy=YELLOW;
        contry= RED;
        next_state=S2;
        end 
S2: begin //traffic signal changes from yellow to red for highway road
        #20
        hwy=RED;
        contry= RED;
        next_state = S3;
        end 
S3: begin //the traffic signal of countryside road give green signal and highway road give red signal stays in this state untill all cars from countryside road gone
        #20
        hwy=RED;
        contry= GREEN;
        if(X)
        next_state=S3;
     else
        next_state= S4;
        end 
S4: begin //now no car is left in country side road so signal is change from green to yellow then red
        #20
        hwy=RED;
        contry= YELLOW;
        next_state=S0;
        end 
default: next_state=S0;
endcase
end 
endmodule
