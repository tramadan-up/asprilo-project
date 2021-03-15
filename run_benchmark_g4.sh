#!/bin/bash
# CLEAR OLD FILES
rm lab/individual_plans/*
rm lab/*
#rm lab/merged_plan1.lp
#rm lab/merged_plan2.lp
#rm lab/merged_plan3.lp
#rm lab/merged_plan4.lp

clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=7 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_4_1/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp} | head -n1 > lab/merged_plan_4_1.lp


clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=5 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_4_2/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp,plan_r7.lp,plan_r8.lp} | head -n1 > lab/merged_plan_4_2.lp


clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=2 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_4_3/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp} | head -n1 > lab/merged_plan_4_3.lp


clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 -c rm=3 asprilo-encodings/m/merge/merge.lp shared/renamed/benchmark_4_4/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp} | head -n1 > lab/merged_plan_4_4.lp




viz -t shared/renamed/benchmark_4_1/instance.lp lab/merged_plan_4_1.lp


viz -t shared/renamed/benchmark_4_2/instance.lp lab/merged_plan_4_2.lp


viz -t shared/renamed/benchmark_4_3/instance.lp lab/merged_plan_4_3.lp


viz -t shared/renamed/benchmark_4_4/instance.lp lab/merged_plan_4_4.lp

