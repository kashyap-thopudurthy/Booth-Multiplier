module booth_multiplier(
    input [3:0] q,
    input [3:0] M,
    output reg [7:0] out
    );
    reg Q_1;
    reg [3:0] A,Q;
    initial begin
    A=4'b0000;
    Q_1=1'b0; 
    Q[3:0]=q[3:0];
    end
    integer i;
    reg [8:0] t1;
    reg [8:0] t2;
    always@(*)begin
    for(i=0;i<4;i=i+1)begin
    case ({Q[0],Q_1})
    2'b00:begin t2[8:0] = { A[3:0] , Q[3:0],Q_1};t1= t2>>>1;t1[8]=t2[8];{A[3:0],Q[3:0],Q_1}=t1[8:0];out[7:0]={A[3:0], Q[3:0]}; end
    2'b11:begin  t2[8:0] = { A[3:0] , Q[3:0],Q_1};t1= t2>>>1;t1[8]=t2[8];{A[3:0],Q[3:0],Q_1}=t1[9:1];out[7:0]={A[3:0], Q[3:0]}; end
    2'b10:begin A=A-M ; t2[8:0] = { A[3:0] , Q[3:0],Q_1};t1= t2>>>1;t1[8]=t2[8];{A[3:0],Q[3:0],Q_1}=t1[8:0];out[7:0]={A[3:0], Q[3:0]}; end
    2'b01:begin A=A+M ; t2[8:0] = { A[3:0] , Q[3:0],Q_1};t1= t2>>>1;t1[8]=t2[8];{A[3:0],Q[3:0],Q_1}=t1[8:0];out[7:0]={A[3:0], Q[3:0]}; end
    endcase 
    end
    end   
endmodule