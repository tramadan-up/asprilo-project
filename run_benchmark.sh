#!/bin/bash

# Variables
HRZN=16

clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${HRZN} -c rid=1 -c oid=1 asprilo-encodings/m/merge/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r1.lp

clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c horizon=${HRZN} -c rid=2 -c oid=2 asprilo-encodings/m/merge/encoding-m.lp lab/instance.lp | head -n1 > lab/individual_plans/plan_r2.lp

# working prototype for benchmark forced_waiting.lp
clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge.lp lab/individual_plans/{plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan.lp
# working prototype for benchmark forced_waiting_v2.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge_p.lp lab/individual_plans/{plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan.lp

viz -t lab/instance.lp lab/merged_plan.lp


