#!/bin/bash
# CLEAR OLD FILES
rm lab/individual_plans/*
rm lab/merged_plan1.lp
rm lab/merged_plan2.lp
rm lab/merged_plan3.lp

# VARIABLES
H_R1=8
H_R2=6
H_R3=8
H_R4=8
H_R5=6
H_R6=8
H_R7=1
H_R8=1

# generating plan for robot/order with id = 1
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R1} -c rid=1 -c oid=1 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r1.lp

# generating plan for robot/order with id = 2
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R2} -c rid=2 -c oid=2 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r2.lp

# generating plan for robot/order with id = 3
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R3} -c rid=3 -c oid=3 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r3.lp

# generating plan for robot/order with id = 4
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R4} -c rid=4 -c oid=4 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r4.lp

# generating plan for robot/order with id = 5
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R5} -c rid=5 -c oid=5 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r5.lp

# generating plan for robot/order with id = 6
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R6} -c rid=6 -c oid=6 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r6.lp

# generating plan for robot/order with id = 7
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R7} -c rid=7 -c oid=7 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r7.lp

# generating plan for robot/order with id = 8
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R8} -c rid=8 -c oid=8 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r8.lp

# merging individual plans
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge.lp lab/individual_plans/{plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp,plan_r7.lp,plan_r8.lp} | head -n1 > lab/merged_plan1.lp

# visualization
#viz -t lab/instance.lp lab/merged_plan1.lp

# merging individual plans
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge_v2.lp lab/individual_plans/{plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp,plan_r7.lp,plan_r8.lp} | head -n1 > lab/merged_plan2.lp

# visualization
#viz -t lab/instance.lp lab/merged_plan2.lp

# merging individual plans
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge_v3.lp lab/individual_plans/{plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp,plan_r7.lp,plan_r8.lp} | head -n1 > lab/merged_plan3.lp

# visualization
#viz -t lab/instance.lp lab/merged_plan3.lp
