## Container Building

1. Git clone https://gitlab.gfdl.noaa.gov/fre/HPC-ME/-/tree/TripleP
2. Change directories into ppp
3. podman build -f Dockerfile2 -t canopy
4. podman save -o tripP.tar localhost/canopy (NOTE: You must delete old tarfile when rebuilding with the same name)
5. apptainer build --disable-cache tripP.sif docker-archive://tripP.tar

## SETUP

Two directories are needed for container running: A postprocessing directory and a directory specifically for container setup and output.

1. For testing purposes please copy this post processing directory that is ready for use: /ncrc/home1/Ciheim.Brown/canopycontainer-pp (NOTE: Do not copy this directory inside of HPC-ME/ppp)

2. The setup/output directory consists of a few subdirectories: history, pp, ptmp, and temp. It also holds a PP_Gridspec file and the container’s runscript. This directory can be copied from /lustre/f2/dev/Ciheim.Brown/container .

A history file is already in this directory in the history subdirectory. This file can be replaced. Additional configuration may be required in the newly copied postprocessing directory. 

(NOTE: Do not copy this directory inside of HPC-ME/ppp. Recommended copy location is /lustre/f2/dev/$USER)

## RUNNING

1. cd HPC-ME/ppp

2. apptainer run --writable-tmpfs --bind (PATH TO COPIED SETUP/OUTPUT DIR):/mnt -B (PATH TO COPIED POST PROCESSING DIR):/mnt2 tripP.sif

3. At this point, the container’s runscript will begin to run. The first step will list all available experiments. Copy/paste or type one of the listed experiments and press enter.

4. Check for/correct relevant errors.

5. Experiment should install and automatically be cylc played.

## REVIEW

The setup-output directory created earlier will hold pp output for review. It will also hold a newly created cylc-run directory.

