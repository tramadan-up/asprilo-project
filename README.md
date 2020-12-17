# asprilo-project

This is a repository for a project with [asprilo](https://asprilo.github.io/) at the University of Potsdam.
It is currently under development and will grow dynamically as part of the project.

In it's current state it contains a simple script that aims at merging two individually planed paths for two different robots.
This is done by collision detection and replaning before the collision would occur. 
This strategy will be further explored in the future with the goal of minimizing the part of the merged plan that has to be replaned.

## Installation

After cloning/downloading you'll need to install a variety of tools and programs if you haven't already. Use the given links to learn more about these tools, such as installation and usage.

### clingo
[https://potassco.org/clingo/](https://potassco.org/clingo/)

### asprilo Generator
[https://asprilo.github.io/generator/](https://asprilo.github.io/generator/)

### asprilo Visualizer
[https://asprilo.github.io/visualizer/](https://asprilo.github.io/visualizer/)

### Anaconda
[https://www.anaconda.com/](https://www.anaconda.com/)


## Usage

Load the benchmark you want to test into the lab folder and rename it to `instance.lp`.
Adjust the horizon variable in the `run_benchmark.sh` script and run it using `bash run_benchmark.sh`.
It will plan two individual plans for two robots, try to merge them by detecting collisions and replan accordingly.
Upon completion it will open the asprilo Visualizer with the benchmark and the newly generated plan.

You can use `bash clear_lab.sh` to delete all generated files.

## Contact

If you experience any issues feel free to contact me via [e-mail](mailto:tramadan.up@gmail.com>).

## License
See `LICENSE` and `asprilo-encodings/LICENSE`respectively.
