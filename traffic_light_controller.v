`timescale 1ns / 1ps

module signal_controller( hwy, contry, X, clk, clr );
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

parameter S0= 3'b000;
parameter S1 =3'b001;
parameter S2 =3'b010;
parameter S3 =3'b011;
parameter S4 =3'b100;

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
begin

case(state)
S0: begin 
        hwy=GREEN;
        contry= RED;
        if(X)
        next_state=S1;
    else
        next_state=S0;
        end 
S1: begin 
        hwy=YELLOW;
        contry= RED;
        //@(posedge clk);
        next_state=S2;
        end 
S2: begin 
        hwy=RED;
        contry= RED;
        //@(posedge clk);
        next_state = S3;
        end 
S3: begin 
        hwy=RED;
        contry= GREEN;
        if(X)
        next_state=S3;
     else
        next_state= S4;
        end 
S4: begin 
        hwy=RED;
        contry= YELLOW;
       // @(posedge clk);
        next_state=S0;
        end 



default: next_state=S0;
endcase
end 

                

endmodule
