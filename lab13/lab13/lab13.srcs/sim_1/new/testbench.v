module testbench;
 
  reg CLK, BTN; 
  reg [15:0] SW;
  wire [4:0] CNT; 
    
 SERIAL_PARITY_GEN PAR ( 
  .CLK    (CLK), 
  .SW  (SW), 
  .CNT (CNT) 
  );
    
  initial begin
    CLK = 0; 
    SW = 16'b0000000001001010; 
    BTN = 1; 
  end 
    
  always  
    #5 CLK = !CLK; 
    
  initial  begin
    $dumpfile ("log.vcd"); 
    $dumpvars; 
  end 
    
  initial  begin
    $display("\t\ttime,\tCLK, \tBTN,\tSW,\tCNT"); 
    $monitor("%d,\t%b,\t%b,\t%b,\t%d",$time, CLK,BTN,SW,CNT); 
  end 
    
  initial 
  #100 $finish; 
    
  //Rest of testbench code after this line 
    
endmodule