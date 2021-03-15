# Disclaimer
The merger can solve every benchmark except benchmark 3 and 4 from group 2 (Tom S., Julian B. and Hannes W., [B_R1_15x15_50_Robots and B_R2_40x40_30_Robots]), benchmark 4 from group 3 (Marcus F. and Max W., [bench_test_17, not solvable in the M-Domain]) and benchmark 2 and 4 from group 5 (Adrian S., [Instance 5 and Instance 7, regarding Instance 7: one robot behaves strangely]).

# How to use
To get the best possible time the merger can achieve it has to be given a certain constant named rm.
I will list those for each benchmark in the following.

* Group 1
  * benchmark 1: -c rm=4
  * benchmark 2: -c rm=16
  * benchmark 3: -c rm=6
  * benchmark 4: -c rm=8
  
* Group 2
  * benchmark 1: -c rm=4
  * benchmark 2: -c rm=3

* Group 3
  * benchmark 1: -c rm=2
  * benchmark 2: -c rm=3
  * benchmark 3: -c rm=4

* Group 4
  * benchmark 1: -c rm=7
  * benchmark 2: -c rm=5
  * benchmark 3: -c rm=2
  * benchmark 4: -c rm=3

* Group 5
  * benchmark 1: -c rm=4
  * benchmark 3: -c rm=9


Basic usage:
`clingo -c rm=4 merge.lp ../renamed/benchmark_1_1/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp}`

You can run the scripts `run_benchmark_gX.sh` for merging and visualizing all benchmarks that are solved by the merger.
