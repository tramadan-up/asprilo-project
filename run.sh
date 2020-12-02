#!/bin/bash

# this script generates an instance (with two robots/shelves/orders) using the instance generator of asprilo, prepares the instance such that two plans can be learned using the asprilo encodings and merges the two individually learned plans after checking if they would collide. collision is rectified with letting the second robot plan again without conflicting positions. if there is no conflict the asprilo visualizer is called with the original instance and the merged plan.

# CLEARING
# deleting all files generated by previous usage of the script.
rm result/instance.lp
rm result/merged_plan.lp
rm byproduct/instance_r1.lp
rm byproduct/instance_r2.lp
rm byproduct/plan_r1.lp
rm byproduct/plan_r2.lp
rm byproduct/checked.lp



# VARIABLES
# conda environment variables
# you may need to adjust the path of your anaconda installation.
CONDA_PATH='/opt/anaconda3/etc/profile.d/conda.sh'
# replace "asprilo_env" with the name of your environment.
env='asprilo_env'

# variables used for the generation process
# adjust variables to try out different sizes. see https://asprilo.github.io/generator/ to learn about the usage.
x=9
y=6
let z=x*y
X=3
Y=2
s=2
p=1
r=2
P=2
u=20
o=2

# variables for randomization
R1=$(( ( RANDOM % 2 )  + 1 ))
R2=0

# variables for planning
HZN=15

# variable for while loop
i=0


# GENERATION PROCESS
# activates the conda environment that includes the instance generator.
source $CONDA_PATH
conda activate $env

# generates an instance with two robots, two shelves, two products and two robots. the two products are forced on different shelves using "--prsmax 1".
gen -x $x -y $y -X $X -Y $Y -s $s -p $p -r $r -H -P $P -u $u -o $o --prsmax 1 --oap

# deactivates the conda environment
conda deactivate

# copies the generated instance for simpler usage of the instance. the original will be removed further down.
cp generatedInstances/x${x}_y${y}_n${z}_r${r}_s${s}_ps${p}_pr${P}_u${u}_o${o}_l2_N001.lp result/instance.lp


# RANDOMIZATION
# generates a random number between 1 and 2 and assigns it to the variable R1. the other number is asssigned to the variable R2 respectively.
# this assures that its not predetermined which order gets assigned to which robot.
if [[ $R1 -eq 2 ]]
then
  R2=1
else
  R2=2
fi


# PREPERATION
# preparation of the instance such that two independent plans can be learned.
# this is done in a not so elegant way with two programs that copy all the atoms leaving the unwanted atoms out.
# removes robot 2 and order R1
# first copy using prep_one.lp with rid=2 and oid=R1
clingo --out-atomf='%s.' -V0 -c rid=2 -c oid=${R1} utility/prep_one.lp result/instance.lp > byproduct/instance_r1_temp.lp
# removes last line of the file - "SATISFIABLE"
sed -i '$d' byproduct/instance_r1_temp.lp
clingo --out-atomf='%s.' -V0 utility/prep_two.lp byproduct/instance_r1_temp.lp > byproduct/instance_r1.lp
# removes last line of the file 
sed -i '$d' byproduct/instance_r1.lp

# removes robot 1 and order R2
# first copy using prep_one.lp with rid=1 and oid=R2
clingo --out-atomf='%s.' -V0 -c rid=1 -c oid=${R2} utility/prep_one.lp result/instance.lp > byproduct/instance_r2_temp.lp
# removes last line of the file
sed -i '$d' byproduct/instance_r2_temp.lp
# second copy using prep_two.lp
clingo --out-atomf='%s.' -V0 utility/prep_two.lp byproduct/instance_r2_temp.lp > byproduct/instance_r2.lp
# removes last line of the file
sed -i '$d' byproduct/instance_r2.lp


# PLANNING
# generates a plan with max. HZN steps for each of the prepared instances
# first plan
clingo --out-atomf='%s.' -V0 -c horizon=${HZN} asprilo-encodings/m/encoding-mod.lp byproduct/instance_r1.lp > byproduct/plan_r1_temp.lp
# removes the last line of the file
sed -i '$d' byproduct/plan_r1_temp.lp
clingo --out-atomf='%s.' -V0 utility/prep_plan.lp byproduct/plan_r1_temp.lp > byproduct/plan_r1.lp
# removes the last line of the file
sed -i '$d' byproduct/plan_r1.lp

# second plan
clingo --out-atomf='%s.' -V0 -c horizon=${HZN} asprilo-encodings/m/encoding-mod.lp byproduct/instance_r2.lp > byproduct/plan_r2_temp.lp
# removes the last line of the file
sed -i '$d' byproduct/plan_r2_temp.lp
clingo --out-atomf='%s.' -V0 utility/prep_plan.lp byproduct/plan_r2_temp.lp > byproduct/plan_r2.lp
# removes the last line of the file
sed -i '$d' byproduct/plan_r2.lp


# GARBAGE REMOVAL
# removes temporary files
rm generatedInstances/x${x}_y${y}_n${z}_r${r}_s${s}_ps${p}_pr${P}_u${u}_o${o}_l2_N001.lp
rm byproduct/instance_r1_temp.lp
rm byproduct/instance_r2_temp.lp
rm byproduct/plan_r1_temp.lp
rm byproduct/plan_r2_temp.lp



# CHECKING
# checks if robots meet on one node at the same time.
clingo --out-atomf='%s.' -V0 utility/check.lp byproduct/{plan_r1.lp,plan_r2.lp} > byproduct/checked_temp.lp
# removes the last line of the file
sed -i '$d' byproduct/checked_temp.lp

# renames atoms if checked_temp.lp is not empty
j=$(stat --format=%s "byproduct/checked_temp.lp")
if [ "$j" -gt 2 ]
then
	clingo --out-atomf='%s.' -V0 utility/rename.lp byproduct/checked_temp.lp > byproduct/checked.lp
	# removes the last line of the file
	sed -i '$d' byproduct/checked.lp
else
  	touch byproduct/checked.lp
fi


# EVALUATION
# evaluates the result of the checking process
# if failed, the instance of robot 2 is planed again with negative atoms regarding its flawed positions.
while [ $i -lt 1 ]
do
k=$(stat --format=%s "byproduct/checked.lp")
if [ "$k" -gt 2 ]
then
	rm byproduct/plan_r2.lp
  	# second plan
	clingo --out-atomf='%s.' -V0 -c horizon=${HZN} asprilo-encodings/m/encoding-mod.lp byproduct/{instance_r2.lp,checked.lp} > byproduct/plan_r2_temp.lp
	# removes the last line of the file
	sed -i '$d' byproduct/plan_r2_temp.lp

	clingo --out-atomf='%s.' -V0 utility/prep_plan.lp byproduct/plan_r2_temp.lp > byproduct/plan_r2.lp
	# removes the last line of the file
	sed -i '$d' byproduct/plan_r2.lp
	# removes temporary files
	rm byproduct/plan_r2_temp.lp
	rm byproduct/checked_temp.lp
	
	# checks if robots meet at one node at the same time.
	clingo --out-atomf='%s.' -V0 utility/check.lp byproduct/{plan_r1.lp,plan_r2.lp} > byproduct/checked_temp.lp
	# removes the last line of the file
	sed -i '$d' byproduct/checked_temp.lp
	
	rm byproduct/checked.lp
	# renames atoms if checked_temp.lp is not empty
	j=$(stat --format=%s "byproduct/checked_temp.lp")
	if [ "$j" -gt 2 ]
	then
		clingo --out-atomf='%s.' -V0 utility/rename.lp byproduct/checked_temp.lp > byproduct/checked.lp
		# removes the last line of the file
		sed -i '$d' byproduct/checked.lp
	else
  		touch byproduct/checked.lp
	fi
else
  	# MERGING
	# merges the two plans
	clingo --out-atomf='%s.' -V0 utility/merge.lp byproduct/{plan_r1.lp,plan_r2.lp} > result/merged_plan.lp
	# removes the last line of the file
	sed -i '$d' result/merged_plan.lp
  	i=$[$i+1]

fi
done

# removes temporary files
rm byproduct/checked_temp.lp


# VISUALIZATION
# visualizes the instance with the merged plan
viz -t result/instance.lp result/merged_plan.lp


# MISC
# block comment template
#if [ ]; then
#fi

# inserts a new line after each atom for better readability
#sed -i 's/ /\n/g' byproduct/plan_r1.lp