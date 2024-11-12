###########################################
# Post-Processing Container

The goal of containerzing post-processing at GFDL ..........

## BUILDING

In order to build the container, the user needs to have podman access on gaea. If needed, put in a helpdesk ticket.                                                                                                                   The Dockerfile-ppp can be used to build the container, along with the cylc-flow-tools environment yaml and runscript. Using podman and apptainer to build, follow these steps:

```
## Clone the HPC-ME repository
git clone git@gitlab.gfdl.noaa.gov:fre/HPC-ME.git

## Navigate into the ppp folder
cd ppp

## Build a container image
podman build -f Dockerfile-ppp -t canopy

## Save the image to a local tar file
# It is recommended to name the container after the model name
podman save -o [name of container].tar localhost/canopy

## Create the singularity image file (sif) from the tar file
####### why disable-cache?, what id docker-archive?
apptainer build --disable-cache [name of container].sif docker-archive://[name of container].tar
```

####################################################  UPDATE SECTION
## SETUP
(##### list necessary files too: yamls,data? - I think we should bind in data)

Two directories are needed for container running: A postprocessing directory and a directory specifically for container setup and output.

1. For testing purposes please copy this post processing directory that is ready for use: /ncrc/home1/Ciheim.Brown/canopycontainer-pp (NOTE: Do not copy this directory inside of HPC-ME/ppp)

2. The setup/output directory consists of a few subdirectories: history, pp, ptmp, and temp. It also holds a PP_Gridspec file and the container’s runscript. This directory can be copied from /lustre/f2/dev/Ciheim.Brown/container .

A history file is already in this directory in the history subdirectory. This file can be replaced. Additional configuration may be required in the newly copied postprocessing directory.

(NOTE: Do not copy this directory inside of HPC-ME/ppp. Recommended copy location is /lustre/f2/dev/$USER)
######################################################

## RUNNING 

To run the container, follow these steps:

```
## Navigate to the set-up folder created in SETUP
cd ppp-setup

## Use apptainer or singularity to run
# Make sure directories are writable
# Bind in necessary locations 
apptainer exec --writable-tmpfs --bind [Path/to/setup]:/mnt --bind [Path/to/fre-workflows]/:mnt2 [path/to/created/container] [path/to/runscript.sh]
```

At this point, the container’s runscript will begin to run. User input is required, listing the experiment, platform, target, and post-processing yaml file.

The experiment will be installed, configuration files will be validated, and the experiment should kick off.

## REVIEW

The setup-output directory created earlier will hold pp output for review. It will also hold a newly created cylc-run directory.
