// Code your testbench here
// or browse Examples
module test_status_tb;
  
  // inputs and outputs
  reg [7:0] sect1_grade;
  reg [7:0] sect2_grade;
  reg [7:0] sect3_grade;
  reg [7:0] sect4_grade;
  wire failed;
  wire passed;
  wire award_scholarship;
  
  // instantiation
  test_status DUT(
    .sect1_grade(sect1_grade), 
    .sect2_grade(sect2_grade), 
    .sect3_grade(sect3_grade), 
    .sect4_grade(sect4_grade), 
    .failed(failed), 
    .passed(passed), 
    .award_scholarship(award_scholarship));
  
  // initialization
  initial
    begin
     sect1_grade = 0; sect2_grade = 0;
     sect3_grade = 0; sect4_grade = 0;  
    end
  
  // test
  initial
    begin
      sect1_grade = 10; sect2_grade = 20; sect3_grade = 30; sect4_grade = 30;
      #10 sect1_grade = 40; sect2_grade = 50; sect3_grade = 60; sect4_grade = 10;
      #10 sect1_grade = 70; sect2_grade = 80; sect3_grade = 90; sect4_grade = 100;
      #10 sect1_grade = 30; sect2_grade = 40; sect3_grade = 50; sect4_grade = 60;
    end
  
  //display
  initial 
    begin
      $monitor("Time=%0t: Sect1=%d, Sect2=%d, Sect3=%d, Sect4=%d, Failed=%b, Passed=%b,   Scholarship=%b",
  $time, sect1_grade, sect2_grade, sect3_grade, sect4_grade, failed, passed, award_scholarship);
      $dumpfile("dump.vcd");
      $dumpvars(0);
      #50;
      $finish();
      
    end
  
  
endmodule
  
  
  
