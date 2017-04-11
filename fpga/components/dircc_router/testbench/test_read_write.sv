`timescale 1ns/100ps
module test_read_write(dircc_router_if router);
parameter TRACE_ON = 1;
event reset_assert, reset_done, write_start, write_done, read_ready;
logic[7:0] write_data, read_data;

always @(write_done) begin : READ_DELAY
  repeat(1) @(router.cb);
  -> read_ready;
end : READ_DELAY

task test_reset();
  if(TRACE_ON) $display("[RESET_TASK_TRACE] %t %m", $realtime);
  router.cb.reset_n <= 1'b0;
  router.address <= 0;
  router.cb.in_valid <= 1'b0;
  -> reset_assert;
  repeat(2) @(router.cb);
  router.cb.reset_n <= 1'b1;
  -> reset_done;
endtask : test_reset

task start_checker();
  if(TRACE_ON) $display("[START_CHECKER_TASK_TRACE] %t %m", $realtime);
  wait(reset_assert.triggered);
  if(TRACE_ON) $display("Found Reset Asserted @ %t\n", $realtime);
  
  if(router.cb.in_ready != 0) begin : IN_READY
    $display("[ERROR] : Reset Check Failed @ %t\n", $realtime);
    $display("in_ready Not resetted\n");
  end : IN_READY
  if(router.cb.out_valid != 0) begin : OUT_VALID
    $display("[ERROR] : Reset Check Failed @ %t\n", $realtime);
    $display("out_valid Not resetted\n");
  end : OUT_VALID 
  if(router.cb.out_data != 0) begin : OUT_DATA
    $display("[ERROR] : Reset Check Failed @ %t\n", $realtime);
    $display("out_data Not resetted\n");
  end : OUT_DATA 
  if(router.cb.out_startofpacket != 0) begin : OUT_CHANNEL
    $display("[ERROR] : Reset Check Failed @ %t\n", $realtime);
    $display("out_startofpacket Not resetted\n");
  end : OUT_CHANNEL 
  if(router.cb.out_startofpacket != 0) begin : OUT_STARTOFPACKET
    $display("[ERROR] : Reset Check Failed @ %t\n", $realtime);
    $display("out_startofpacket Not resetted\n");
  end : OUT_STARTOFPACKET 
  if(router.cb.out_endofpacket != 0) begin : OUT_ENDOFPACKET
    $display("[ERROR] : Reset Check Failed @ %t\n", $realtime);
    $display("out_endofpacket Not resetted\n");
  end : OUT_ENDOFPACKET
  
  wait(reset_done.triggered);
  if(TRACE_ON) $display("Found Reset Done @ %t\n", $realtime);
  repeat(2) @(router.cb);
  if(router.cb.in_ready != 1) begin : IN_READY_2
    $display("[ERROR] : Reset Check Failed @ %t\n", $realtime);
    $display("in_ready Not set after reset deassert\n");
  end : IN_READY_2
  
endtask : start_checker

task check_data();
  compare_data();
endtask : check_data

task test_write();
  write_data = 'b1010;
  if(TRACE_ON) $display("[WRITE_TASK_TRACE] %t %m", $realtime);
  wait(reset_done.triggered);
  router.cb.out_ready <= 1;
  @(posedge router.cb.in_ready);
  router.cb.in_valid <= 1;
  router.cb.in_data <= write_data;
  router.cb.in_startofpacket <= 1'b1;
  router.cb.in_endofpacket <= 1'b1;
  router.cb.in_empty <= 1'b0;
  -> write_start;
  repeat(1) @(router.cb);
  router.cb.in_valid <= 0;
  -> write_done;
endtask : test_write
  
task write_checker();
  if(TRACE_ON) $display("[WRITE_CHECKER_TASK_TRACE] %t %m", $realtime);
  wait(write_start.triggered);
  
  if(router.cb.out_valid != 0) begin : OUT_VALID
    $display("[ERROR] : Write Check Failed @ %t\n", $realtime);
    $display("out_valid Too Early\n");
  end : OUT_VALID
  
  wait(read_ready.triggered);
  
  if(router.cb.out_valid != 1) begin : OUT_VALID_2
    $display("[ERROR] : Write Check Failed @ %t\n", $realtime);
    $display("out_valid Not asserted\n");
  end : OUT_VALID_2
  if(router.cb.out_startofpacket != 1) begin : OUT_STARTOPACKET
    $display("[ERROR] : Write Check Failed @ %t\n", $realtime);
    $display("out_startofpacket Not asserted\n");
  end : OUT_STARTOPACKET
  if(router.cb.out_endofpacket != 1) begin : OUT_ENDOFPACKET
    $display("[ERROR] : Write Check Failed @ %t\n", $realtime);
    $display("out_endofpacket Not asserted\n");
  end : OUT_ENDOFPACKET
  
  check_data();
  
endtask : write_checker

task test_write_packet();
  write_data = 'b1010;
  if(TRACE_ON) $display("[WRITE_PACKET_TASK_TRACE] %t %m", $realtime);
  wait(reset_done.triggered);
  router.cb.out_ready <= 1'b1;
  @(posedge router.cb.in_ready);
  router.cb.in_valid <= 1'b1;
  router.cb.in_data <= write_data;
  router.cb.in_startofpacket <= 1'b1;
  router.cb.in_endofpacket <= 1'b0;
  -> write_start;
  repeat(1) @(router.cb);
  router.cb.in_valid <= 1'b1;
  router.cb.in_data <= 1'b0;
  router.cb.in_startofpacket <= 1'b0;
  router.cb.in_endofpacket <= 1'b1;
  -> write_done;
  repeat(1) @(router.cb);
  router.cb.in_valid <= 1'b0;
  -> write_done;
endtask : test_write_packet
  
task write_packet_checker();
  if(TRACE_ON) $display("[WRITE_PACKET_CHECKER_TASK_TRACE] %t %m", $realtime);
  wait(write_start.triggered);
  
  if(router.cb.out_valid != 0) begin : OUT_VALID
    $display("[ERROR] : Write_packet Check Failed @ %t\n", $realtime);
    $display("out_valid Too Early\n");
  end : OUT_VALID
  
  wait(read_ready.triggered);
  
  if(router.cb.out_valid != 1) begin : OUT_VALID_2
    $display("[ERROR] : Write_packet Check Failed @ %t\n", $realtime);
    $display("out_valid Not asserted\n");
  end : OUT_VALID_2
  if(router.cb.out_startofpacket != 1) begin : OUT_STARTOPACKET
    $display("[ERROR] : Write_packet Check Failed @ %t\n", $realtime);
    $display("out_startofpacket Not asserted\n");
  end : OUT_STARTOPACKET
  if(router.cb.out_endofpacket != 0) begin : OUT_ENDOFPACKET
    $display("[ERROR] : Write_packet Check Failed @ %t\n", $realtime);
    $display("out_endofpacket Not deasserted\n");
  end : OUT_ENDOFPACKET
  
  check_data();
  
  repeat(1) @(router.cb);
  
  if(router.cb.out_valid != 1) begin : OUT_VALID_3
    $display("[ERROR] : Write_packet Check Failed @ %t\n", $realtime);
    $display("out_valid Not asserted\n");
  end : OUT_VALID_3
  if(router.cb.out_startofpacket != 0) begin : OUT_STARTOPACKET_2
    $display("[ERROR] : Write_packet Check Failed @ %t\n", $realtime);
    $display("out_startofpacket Not deasserted\n");
  end : OUT_STARTOPACKET_2
  if(router.cb.out_endofpacket != 1) begin : OUT_ENDOFPACKET_2
    $display("[ERROR] : Write_packet Check Failed @ %t\n", $realtime);
    $display("out_endofpacket Not asserted\n");
  end : OUT_ENDOFPACKET_2
  
endtask : write_packet_checker

task compare_data();
  begin
    if (write_data != read_data)
      $display("[ERROR] : Compare Failed @ %t\n", $realtime);
    else
      $display("[SUCCESS] : Compare Succeeded @ %t\n", $realtime);
  end
endtask : compare_data

initial begin : TESTS
  $display("\n $$$ Starting Reset Test\n\n");
  
  fork
    begin : RESET_ASSERT
      if(TRACE_ON) $display ("Entering test_reset task @ %t\n", $realtime);
      test_reset();
      if(TRACE_ON) $display("Exited test_reset task @ %t\n", $realtime);
    end : RESET_ASSERT
    begin : START_CHECKER
      if(TRACE_ON) $display ("Entering start_checker task @ %t\n", $realtime);
      start_checker();
      if(TRACE_ON) $display("Exited start_checker task @ %t\n", $realtime);
    end : START_CHECKER
  join
    
  $display("\n\n $$$ RESET TEST SUCCESSFULLY COMPLETED\n");
  
  $display("\n $$$ Starting Write Test\n\n");
  
  fork
    begin : RESET_ASSERT_2
      if(TRACE_ON) $display ("Entering test_reset task @ %t\n", $realtime);
      test_reset();
      if(TRACE_ON) $display("Exited test_reset task @ %t\n", $realtime);
    end : RESET_ASSERT_2
    begin : WRITE_ASSERT
      if(TRACE_ON) $display ("Entering test_write task @ %t\n", $realtime);
      test_write();
      if(TRACE_ON) $display("Exited test_write task @ %t\n", $realtime);
    end : WRITE_ASSERT
    begin : WRITE_CHECKER
      if(TRACE_ON) $display ("Entering write_checker task @ %t\n", $realtime);
      write_checker();
      if(TRACE_ON) $display("Exited write_checker task @ %t\n", $realtime);
    end : WRITE_CHECKER
  join
    
  $display("\n\n $$$ WRITE TEST SUCCESSFULLY COMPLETED\n");
  
  $display("\n $$$ Starting Write Packet Test\n\n");
  
  fork
    begin : RESET_ASSERT_3
      if(TRACE_ON) $display ("Entering test_reset task @ %t\n", $realtime);
      test_reset();
      if(TRACE_ON) $display("Exited test_reset task @ %t\n", $realtime);
    end : RESET_ASSERT_3
    begin : WRITE_PACKET_ASSERT
      if(TRACE_ON) $display ("Entering test_write_packet task @ %t\n", $realtime);
      test_write_packet();
      if(TRACE_ON) $display("Exited test_write_packet task @ %t\n", $realtime);
    end : WRITE_PACKET_ASSERT
    begin : WRITE_PACKET_CHECKER
      if(TRACE_ON) $display ("Entering write_packet_checker task @ %t\n", $realtime);
      write_packet_checker();
      if(TRACE_ON) $display("Exited write_packet_checker task @ %t\n", $realtime);
    end : WRITE_PACKET_CHECKER
  join
    
  $display("\n\n $$$ WRITE PACKET TEST SUCCESSFULLY COMPLETED\n");
end : TESTS

endmodule
  
      