#!/bin/bash
# CLEAR OLD FILES
rm lab/individual_plans/*
rm lab/*
#rm lab/merged_plan1.lp
#rm lab/merged_plan2.lp
#rm lab/merged_plan3.lp
#rm lab/merged_plan4.lp

clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=4 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_2_1/{instance.lp,plan.lp} | head -n1 > lab/merged_plan_2_1.lp


clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=3 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_2_2/{instance.lp,plan.lp} | head -n1 > lab/merged_plan_2_2.lp


#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_2_3/{instance.lp,plan.lp} | head -n1 > lab/merged_plan_2_3.lp


#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_2_4/{instance.lp,plan.lp} | head -n1 > lab/merged_plan_2_4.lp




viz -t shared/renamed/benchmark_2_1/instance.lp lab/merged_plan_2_1.lp


viz -t shared/renamed/benchmark_2_2/instance.lp lab/merged_plan_2_2.lp


#viz -t shared/renamed/benchmark_2_3/instance.lp lab/merged_plan_2_3.lp


#viz -t shared/renamed/benchmark_2_4/instance.lp lab/merged_plan_2_4.lp

