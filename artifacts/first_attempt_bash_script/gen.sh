#!/bin/bash

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
X=3
Y=2
s=4
p=4
r=4
P=4
u=20
o=4

# GENERATION PROCESS
# activates the conda environment that includes the instance generator.
source $CONDA_PATH
conda activate $env

# generates an instance with two robots, two shelves, two products and two robots. the two products are forced on different shelves using "--prsmax 1".
gen -x $x -y $y -X $X -Y $Y -s $s -p $p -r $r -H -P $P -u $u -o $o --prsmax 1 --oap

# deactivates the conda environment
conda deactivate

