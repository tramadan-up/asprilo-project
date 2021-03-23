#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_1_1/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp} | head -n1 > lab/merged_plan_1_1.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_1_2/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_1_2.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_1_3/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp} | head -n1 > lab/merged_plan_1_3.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_1_4/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_1_4.lp

clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_2_1/{instance.lp,plan.lp} | head -n1 > lab/merged_plan_2_1.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_2_2/{instance.lp,plan.lp} | head -n1 > lab/merged_plan_2_2.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_2_3/{instance.lp,plan.lp} | head -n1 > lab/merged_plan_2_3.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_2_4/{instance.lp,plan.lp} | head -n1 > lab/merged_plan_2_4.lp

#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_3_1/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_3_1.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_3_2/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_3_2.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_3_3/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp} | head -n1 > lab/merged_plan_3_3.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_3_4/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_3_4.lp

#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_4_1/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp} | head -n1 > lab/merged_plan_4_1.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_4_2/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp,plan_r7.lp,plan_r8.lp} | head -n1 > lab/merged_plan_4_2.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_4_3/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp} | head -n1 > lab/merged_plan_4_3.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_4_4/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp} | head -n1 > lab/merged_plan_4_4.lp

#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_5_1/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_5_1.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_5_2/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp} | head -n1 > lab/merged_plan_5_2.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_5_3/{instance.lp,plan_r1.lp,plan_r2.lp} | head -n1 > lab/merged_plan_5_3.lp
#clingo $@ --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 merger.lp benchmark_5_4/{instance.lp,plan_r1.lp,plan_r2.lp,plan_r3.lp,plan_r4.lp,plan_r5.lp,plan_r6.lp,plan_r7.lp,plan_r8.lp} | head -n1 > lab/merged_plan_5_4.lp

#viz -t benchmark_1_1/instance.lp lab/merged_plan_1_1.lp
#viz -t benchmark_1_2/instance.lp lab/merged_plan_1_2.lp
#viz -t benchmark_1_3/instance.lp lab/merged_plan_1_3.lp
#viz -t benchmark_1_4/instance.lp lab/merged_plan_1_4.lp

viz -t benchmark_2_1/instance.lp lab/merged_plan_2_1.lp
#viz -t benchmark_2_2/instance.lp lab/merged_plan_2_2.lp
#viz -t benchmark_2_3/instance.lp lab/merged_plan_2_3.lp
#viz -t benchmark_2_4/instance.lp lab/merged_plan_2_4.lp

#viz -t benchmark_3_1/instance.lp lab/merged_plan_3_1.lp
#viz -t benchmark_3_2/instance.lp lab/merged_plan_3_2.lp
#viz -t benchmark_3_3/instance.lp lab/merged_plan_3_3.lp
#viz -t benchmark_3_4/instance.lp lab/merged_plan_3_4.lp

#viz -t benchmark_4_1/instance.lp lab/merged_plan_4_1.lp
#viz -t benchmark_4_2/instance.lp lab/merged_plan_4_2.lp
#viz -t benchmark_4_3/instance.lp lab/merged_plan_4_3.lp
#viz -t benchmark_4_4/instance.lp lab/merged_plan_4_4.lp

#viz -t benchmark_5_1/instance.lp lab/merged_plan_5_1.lp
#viz -t benchmark_5_2/instance.lp lab/merged_plan_5_2.lp
#viz -t benchmark_5_3/instance.lp lab/merged_plan_5_3.lp
#viz -t benchmark_5_4/instance.lp lab/merged_plan_5_4.lp
