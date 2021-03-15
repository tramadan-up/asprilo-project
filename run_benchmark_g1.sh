#!/bin/bash
# CLEAR OLD FILES
rm lab/individual_plans/*
rm lab/merged_plan1.lp
rm lab/merged_plan2.lp
rm lab/merged_plan3.lp
rm lab/merged_plan4.lp

clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=4 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_1_1/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp} | head -n1 > lab/merged_plan_1_1.lp


clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=16 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_1_2/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_1_2.lp


clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=6 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_1_3/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp} | head -n1 > lab/merged_plan_1_3.lp


clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=8 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_1_4/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_1_4.lp




viz -t shared/renamed/benchmark_1_1/instance.lp lab/merged_plan_1_1.lp


viz -t shared/renamed/benchmark_1_2/instance.lp lab/merged_plan_1_2.lp


viz -t shared/renamed/benchmark_1_3/instance.lp lab/merged_plan_1_3.lp


viz -t shared/renamed/benchmark_1_4/instance.lp lab/merged_plan_1_4.lp

