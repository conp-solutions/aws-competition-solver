# SATComp Sample Solver

This repository contains two Dockerfiles that build the Mallob distributed solver using the SAT-Comp 2022 infrastructure.  It is intended to be used for teams to understand how to build solvers for SAT-Comp.

**N.B.:** Although this repository is released under the MIT-0 license, the Mallob solver that is built by these Docker files is under the [LGPL 3.0](https://opensource.org/licenses/lgpl-3.0.html) license, and that any use/extensions of Mallob will be governed by that license.

## Prerequisites

First, this build process has been tested only on linux.  Builds on other platforms have not been tested.
 
Second, the build process requires that Docker is installed on the machine.

## How to Build

Both containers depend on the joint common container. As this container creates
the SSH secrets, make sure both the leader and the worker docker image are
build bsaed on this image, using the below tag.

1. Run `docker build -t conp-solutions-satcomp-solver:base -f DockerfileBase .`

To build the Mallob leader container: 

1. Run `docker build -t conp-solutions-satcomp-solver:leader -f DockerfileLeader .`

To build the Mallob worker container:

1. Run `docker build -t conp-solutions-satcomp-solver:worker -f DockerfileWorker .`

After building both images, run `docker image ls` and make sure you see both `conp-solutions-satcomp-solver:leader` and `conp-solutions-satcomp-solver:worker` in the list of images.
