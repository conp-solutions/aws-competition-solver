# SATComp Sample Solver

This repository contains two Dockerfiles that build the Mallob distributed solver using the SAT-Comp 2022 infrastructure.  It is intended to be used for teams to understand how to build solvers for SAT-Comp.

**N.B.:** Although this repository is released under the MIT-0 license, the Mallob solver that is built by these Docker files is under the [LGPL 3.0](https://opensource.org/licenses/lgpl-3.0.html) license, and that any use/extensions of Mallob will be governed by that license.

## Prerequisites

First, this build process has been tested only on linux.  Builds on other platforms have not been tested.
 
Second, the build process requires that Docker is installed on the machine.

## Prepare Source

This package uses other packages as dependencies. They are maintained via git submodules. To get the correct version of dependencies, get the submodules first:

```
git submodule update --init --recursive
```

## How to Build

To build the Mallob leader container: 

1. Run `docker build -t mallob-mergecadling:leader -f DockerfileLeader .`

To build the Mallob worker container:

1. Run `docker build -t mallob-mergecadling:worker -f DockerfileWorker .`

After building both images, run `docker image ls` and make sure you see both `mallob-mergecadling:leader` and `mallob-mergecadling:worker` in the list of images.

## Test the Solver

To test whether the solver works, you can setup a local CNF and hostfile, and next see whether mallob can be started as expected. The below two commands show how this can be achieved:

Prepare a hostfile with localhost as the only available host.

```
echo "127.0.0.1" > ~/cnf/localhost.txt
```

Start the docker container, but directly execute mallob instead of the default entry point. Furthermore, you need to mount in the directory with the CNFs and the host file. Then, you can tell mallob to consume the hostfile, as well as the CNF, and start solving the formula.

```
docker run -it --rm -v ~/cnf:/cnf:ro --entrypoint /bin/sh mallob-mergecadling:leader -c "/competition/run_mallob.sh /cnf/localhost.txt /cnf/rook-20-0-0.cnf"
```
