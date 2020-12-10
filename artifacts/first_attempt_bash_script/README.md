# bash script for planning two individual plans and merging them

The script `run.sh` aims at merging two individually planned paths for two robots, detecting collision and re-planning to solve that conflict. This is done with a very simple strategy. If a collision is detected (the two robots visit a node at the same time) one of the robots is forced to re-plan without using that particular position that caused the problem. The end result in form of the original instance and a merged plan can be found in the folder `result`. The individual instances and plans can be found in the folder `byproducts`.

`run.sh` will attempt to delete all files that may have been created by running the script before. A function to store results is planned for the future.

## Usage

Before you attempt to use the script you need to adjust two variables regarding your Anaconda installation and the name of your asprilo-Generator environment in the script `run.sh`. You will also need to move the files to the main folder or change the dependencies.

The lines you may need to change:
```bash
CONDA_PATH='/opt/anaconda3/etc/profile.d/conda.sh'

env='asprilo_env'
```
To run the script simply use this command:
```bash
bash run.sh
```

`run.sh` will open the asprilo-Visualizer with the original instance and the merged plan on completion. 
