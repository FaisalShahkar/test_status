// Code your design here
module test_status(
  input wire [7:0] sect1_grade,
  input wire [7:0] sect2_grade,
  input wire [7:0] sect3_grade,
  input wire [7:0] sect4_grade,
  output wire failed,
  output wire passed,
  output wire award_scholarship);
  
  reg temp_failed;
  reg temp_passed;
  reg temp_award_scholarship;
  reg [15:0] total;
  always @(*)
    begin
      total = sect1_grade + sect2_grade + sect3_grade + sect4_grade;
      if(total < 100)
    begin
      temp_failed = 1;
      temp_passed = 0;
      temp_award_scholarship = 0;
    end
      else if (total >=200)
        begin
          temp_failed = 0;
          temp_passed = 1;
          temp_award_scholarship = 1;
        end
      else if (total >=100)
        begin
          temp_failed = 0;
          temp_passed = 1;
          temp_award_scholarship = 0;
        end
    
  end
  assign failed  = temp_failed;
  assign passed = temp_passed;
  assign award_scholarship = temp_award_scholarship;
 
  /*assign failed = (sect1_grade + sect2_grade +sect3_grade +sect4_grade) < 100;
  assign passed = (sect1_grade + sect2_grade +sect3_grade +sect4_grade) >= 100;
  assign award_scholarship = (sect1_grade + sect2_grade +sect3_grade +sect4_grade) >= 200;*/
  
endmodule
