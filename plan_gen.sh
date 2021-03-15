#!/bin/bash
# CLEAR OLD FILES
rm lab/individual_plans/*
rm lab/merged_plan1.lp
rm lab/merged_plan2.lp
rm lab/merged_plan3.lp

# VARIABLES
H_R1=3
H_R2=3
H_R3=3
#H_R4=14
#H_R5=14
#H_R6=16
#H_R7=14
#H_R8=16
#H_R9=14
#H_R10=14
#H_R11=14
#H_R12=14
#H_R13=16
#H_R14=14
#H_R15=16
#H_R16=14
#H_R17=14
#H_R18=14
#H_R19=14
#H_R20=24
# generating plan for robot/order with id = 1
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R1} -c rid=1 -c oid=1 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r1.lp

# generating plan for robot/order with id = 2
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R2} -c rid=2 -c oid=2 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r2.lp

# generating plan for robot/order with id = 3
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R3} -c rid=3 -c oid=3 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r3.lp

# generating plan for robot/order with id = 4
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R4} -c rid=4 -c oid=4 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r4.lp

# generating plan for robot/order with id = 5
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R5} -c rid=5 -c oid=5 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r5.lp

# generating plan for robot/order with id = 6
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R6} -c rid=6 -c oid=6 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r6.lp

# generating plan for robot/order with id = 7
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R7} -c rid=7 -c oid=7 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r7.lp

# generating plan for robot/order with id = 8
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R8} -c rid=8 -c oid=8 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r8.lp

# generating plan for robot/order with id = 9
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R9} -c rid=9 -c oid=9 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r9.lp

# generating plan for robot/order with id = 10
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R10} -c rid=10 -c oid=10 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r10.lp

# generating plan for robot/order with id = 11
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R11} -c rid=11 -c oid=11 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r11.lp

# generating plan for robot/order with id = 12
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R12} -c rid=12 -c oid=12 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r12.lp

# generating plan for robot/order with id = 13
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R13} -c rid=13 -c oid=13 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r13.lp

# generating plan for robot/order with id = 14
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R14} -c rid=14 -c oid=14 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r14.lp

# generating plan for robot/order with id = 15
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R15} -c rid=15 -c oid=15 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r15.lp

# generating plan for robot/order with id = 16
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R16} -c rid=16 -c oid=16 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r16.lp

# generating plan for robot/order with id = 17
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R17} -c rid=17 -c oid=17 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r17.lp

# generating plan for robot/order with id = 18
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R18} -c rid=18 -c oid=18 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r18.lp

# generating plan for robot/order with id = 19
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R19} -c rid=19 -c oid=19 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r19.lp

# generating plan for robot/order with id = 20
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${H_R20} -c rid=20 -c oid=20 asprilo-encodings/m/merge/encoding/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r20.lp


#clingo asprilo-encodings/m/merge/merge_v0_5.lp lab/individual_plans/{plan_r1.lp,plan_r2.lp,plan_r3.lp}


#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge.lp shared/benchmark_1/{plan_r1.lp,plan_r2.lp,plan_r3.lp} | head -n1 > lab/merged_plan1.lp

#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge.lp lab/individual_plans/{plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp,plan_r7.lp,plan_r8.lp} | head -n1 > lab/merged_plan1.lp

#viz -t shared/benchmark_1/instance.lp lab/merged_plan1.lp
