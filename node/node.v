//module description
//rx tx CAN module 
//
//Timing:
//____SS____PS____PBS1____PBS2____
//
//TQ - 1 clock 
//SS = 1TQ
//PS = 1 - 8 TQ
//PBS1(2) = 1 - 8 TQ
//
//made by Pogotovskii Pavel
//2020

module can_rx_tx(
    input rst,
    input wire clk,
    input wire tx,

    input wire [7 : 0] data,                //data from high level
    input wire  data_val,

    output reg rx
);

reg [3 : 0] cnt;
reg [3 : 0] state;
reg [7 : 0] data_buf;

assign data_buf = data;

always@(posedge clk)
begin
    if(rst)
    begin
        cnt <= 0;
    end
    else
        if(cnt != 24)
        begin
            cnt <= cnt + 1;
        end
        else 
        begin
            cnt <= 0;
        end 
    end
end

always@(posedge clk)
begin
    if(rst)
    begin
        state <= 0;
    end
    else 
    begin
        if(cnt == 1)
        begin
            state <= 1;
        end
        else 
        if(cnt >= 1 & cnt <= 8)
        begin
            state <= 2;
        end
        else 
        if(cnt >= 9 & cnt <= 16)
        begin
            state <= 3; 
        end
        else 
        if(cnt >= 17 & cnt <= 24)
        begin
            state <= 3; 
        end
    end
end


always@(posedge clk)
begin
    if(rst)
    begin
        rx <= 0;
    end
    else 
    begin
        
    end
end
