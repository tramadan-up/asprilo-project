# asprilo-project

This is a repository for a project with [asprilo](https://asprilo.github.io/) at the University of Potsdam.

At this stage it contains a script in the main folder, some simple clingo programs in the folder `utility` and the [asprilo-encodings](https://github.com/potassco/asprilo-encodings). The script `run.sh` aims at merging two individually planned paths for two robots, detecting collision and re-planning to solve that conflict. This is done with a very simple strategy. If a collision is detected (the two robots visit a node at the same time) one of the robots is forced to re-plan without using that particular position that caused the problem. The end result in form of the original instance and a merged plan can be found in the folder `result`. The individual instances and plans can be found in the folder `byproducts`.

`run.sh` will attempt to delete all files that may have been created by running the script before. A function to store results is planned for the future.


## Installation

After cloning/downloading you need to install a variety of tools and programs to use the scripts. Use the given links to learn more about these tools, such as installation and usage.

### clingo
[https://potassco.org/clingo/](https://potassco.org/clingo/)

### asprilo Generator
[https://asprilo.github.io/generator/](https://asprilo.github.io/generator/)

### asprilo Visualizer
[https://asprilo.github.io/visualizer/](https://asprilo.github.io/visualizer/)

### Anaconda
[https://www.anaconda.com/](https://www.anaconda.com/)


## Usage

Before you attempt to use the scripts you need to adjust two variables regarding your Anaconda installation and the name of your asprilo-Generator environment in the script `run.sh`.

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

## Contact

If you experience any issues feel free to contact me via [e-mail](mailto:tramadan.up@gmail.com>).

## License
See LICENSE.
