`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/19/2024 01:32:41 AM
// Design Name: 
// Module Name: fft_4
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


module fft_4(
input [15:0] Op2,
output reg [15:0] X
);
wire [3:0] x [0:3];
wire [3:0] S [0:3];
wire [3:0] Xr [0:3];
wire [3:0] Xi [0:3];

assign x[0]  = Op2[3:0];
assign x[1]  = Op2[7:4];
assign x[2] = Op2[11:8];
assign x[3]  = Op2[15:12];

assign S[0]  = x[0]+x[2];
assign S[1]  = x[0]-x[2];
assign S[2]  = x[1]+x[3];
assign S[3]  = x[1]-x[3];

assign Xr[0]  = S[0]+S[2];
assign Xr[1]  = S[1];
assign Xr[2] = S[0]-S[2];
assign Xr[3]  = S[1];

assign Xi[0]  = 0;
assign Xi[1]  = -S[3];
assign Xi[2] = 0;
assign Xi[3]  = S[3];

always@(*) begin
X[3:0]  = $sqrt(((Xr[0]*Xr[0])+(Xi[0]*Xi[0])));
X[7:4]  = $sqrt(((Xr[1]*Xr[1])+(Xi[1]*Xi[1])));
X[11:8] = $sqrt(((Xr[2]*Xr[2])+(Xi[2]*Xi[2])));
X[15:12]  = $sqrt(((Xr[3]*Xr[3])+(Xi[3]*Xi[3])));
end

//assign X[3:0]  = $sqrt(((Xr[0]*Xr[0])+(Xi[0]*Xi[0])));
//assign X[7:4]  = $sqrt(((Xr[1]*Xr[1])+(Xi[1]*Xi[1])));
//assign X[11:8] = $sqrt(((Xr[2]*Xr[2])+(Xi[2]*Xi[2])));
//assign X[15:12]  = $sqrt(((Xr[3]*Xr[3])+(Xi[3]*Xi[3])));

always@(*) begin
$display("x[0] = %d",x[0]);
$display("x[1] = %d",x[1]);
$display("x[2] = %d",x[2]);
$display("x[3] = %d",x[3]);
//$display("S[0] = %d",S[0]);
//$display("S[1] = %d",S[1]);
//$display("S[2] = %d",S[2]);
//$display("S[3] = %d",S[3]);
$display("X[0] = %d + %di",$signed(Xr[0]),$signed(Xi[0]));
$display("X[1] = %d + %di",$signed(Xr[1]),$signed(Xi[1]));
$display("X[2] = %d + %di",$signed(Xr[2]),$signed(Xi[2]));
$display("X[3] = %d + %di",$signed(Xr[3]),$signed(Xi[3]));
//$display("abs X[0] = %d",X[0]);
//$display("abs X[1] = %d",X[1]);
//$display("abs X[2] = %d",X[2]);
//$display("abs X[3] = %d",X[3]);
end

endmodule
