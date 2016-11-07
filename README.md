# DiRCC

## Specification

FPGAs are becoming widely deployed in the cloud,
with Microsoft rolling out FPGAs across their
cloud infrastructure:
https://www.wired.com/2016/09/microsoft-bets-future-chip-reprogram-fly/
While the initial purpose of these FPGAs is to
provide local fixed-function acceleration for a small
number of applications (search, NNs, etc.), they
have the potential to support much more general
applications. The FPGAs are also directly connected
to thousands of other FPGAs via a fast, low-latency
network, which suggests that large numbers of
FPGAs can be brought together to accelerate
wide-area compute tasks.

The goal of this project is to take an existing
language and set of applications designed for
asynchronous event-based CPU systems, and adapt
it to run directly in the FPGAs. The existing
system is designed to use small fixed-size
packets to represent and deliver events between
nodes. Each event then causes the execution of a handler
which transforms some local node state, and potentially
causes more events to be sent to other nodes. Due
to the light-weight and finite nature of the
events and handlers, it should be possible to
compile these directly into data-paths. The goals
of the project are to:
- Manually adapt a software event-based application to
  a pure hardware (no CPU) data-path.
- Determine the limits of performance for the
  data-path oriented system.
- Investigate optimisations for the event delivery
  and event handlers when translated to hardware.
- Provide frameworks or automation to allow more
  applications to be translated to direct data-paths.

The project is hardware oriented, but the majority
of the work can be performed in C-based High-Level
Synthesis (HLS). VHDL/Verilog is useful, but not
required. The existing event-based applications are
described as fragments of C, and are accessible to
any undergraduate. Knowledge of networking is
useful. Experience with compilers is also useful,
but the project can be steered towards or away
from the automation/compilation goals depending
on the student. 

## Objectives

- Create simple NIOS based system with a single node
- Create NIOS based system with multiple nodes
- Create hardware to replace NIOS (writen by hand)
- Measure performance of this approach
- Create + optimise network interfaces between FPGAs
- Attach multiple FPGAs with a single node on each
- Expand each FPGA to have multiple nodes
- Measure performance of this approach




