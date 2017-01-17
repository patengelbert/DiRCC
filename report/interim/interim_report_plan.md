# Interim Report

## Project Specification

## Background

## Implementation Plan

1.  Create single node NIOS
    -   Due to NIOS supporting only a single thread on a cpu, this requires rewriting the POETS software
    -   Skipping this stage as the hardware is not custom made (cpied from tutorials) and will not be helpful later only
2.  Create multi node NIOS  
    -   Seperate software into multiple threads (try 2 to start with) and an overseer
    -   Run each thread on a seprate NIOS as a seperate node
    -   Some local storage within each node for code and shared memory
    -   Global memory difficult to estimate for scaling
    -   Routing done by hand
3.  Expand to multi node FPGA  
    -   Extract IO buffers for each node to dedicated hardware
    -   Extract pipe data as fixed values
    -   Investigate HLS for event handlers (OpenCL may be interesting)
4.  Attach Network Intefaces (verilog)  
    -   Depends on hardware (most likely ethernet with custom layer on top)
    -   DE1 has ethernet h/w built in and Qsys has ethernet adapter available (might not be compatible)
    -   Alternatively use UART connection between boards
5.  Combine multiple multi node FPGAs  
    -   Should be relatively simple provided everything else works correctly
6.  Create simple tool to convert programs

## Evaluation
