###########################################
# Post-Processing Container

Previously, many GFDL workflows and configurations have only been accessible on gitlab. This is disadvantageous for outside collaboration, flexibility, community development. While the FRE workflow can now be conda installed, another deployment method of containerization has been developed. Containerzation of the FRE workflow at GFDL bolsters portability while also simplifying the environment set-up for the user. With the environment set-up done through the container build and runscript, this post-processing container work allows for more effective sharing of the workflow.

## BUILDING

**In order to build the container, the user needs to have podman access on gaea. If needed, put in a helpdesk ticket.**

The Dockerfile-ppp in this repository, along with the cylc-flow-tools environment yaml and runscript.sh, can be used to build the container. The container will house the fre-cli tools and subtools, and any necessary packages needed for those tools.

Using podman and apptainer to build, follow these steps:

```
## Clone the HPC-ME repository
git clone git@gitlab.gfdl.noaa.gov:fre/HPC-ME.git

## Navigate into the ppp folder
cd ppp

## Build a container image
podman build -f Dockerfile-ppp -t 2024.01

## Save the image to a local tar file
# It is recommended to name the container after the model name
podman save -o [name of container].tar localhost/2024.01

## Create the singularity image file (sif) from the tar file
apptainer build --disable-cache [name of container].sif docker-archive://[name of container].tar
```

## SETUP
Now that the FRE workflows container is created, certain files and directories must be made accessible.

FOR CLOUD USERS: Preparing for cloud usage requires history files and container image/runscript to be transferred to the cloud resource. The recommended method of file transfer is with Globus in which files should be transferred to the cloud resource’s lustre folder. 

In order to run the post-processing workflow, two directories are needed: fre-workflows cloned repository and directory including folders for container set-up and running (`ppp-setup` for example). Additionally, yaml configurations for the experiment run are needed. 

Ensure you create the empty `ppp-setup` folder in an area with enough space as this is where the post-processing run output will be populated. 

1. The fre-workflows repository can be found here: https://github.com/NOAA-GFDL/fre-workflows
2. The setup/output directory consists of a few subdirectories: pp, ptmp, and temp (these are created through the runscript.sh) ############CHECK WE DONT HAVE TO EXPLICITLY MAKE THEM
3. Publicly available example yaml configuration files can be found here: https://github.com/NOAA-GFDL/fre-examples 


## RUNNING 

To run the container, follow these steps:

```
## Use apptainer or singularity to run
# Make sure directories are writable
# Bind in necessary locations (setup folder, workflow folder, data locations)
apptainer exec --writable-tmpfs --bind [Path/to/setup/folder]:/mnt --bind [Path/to/fre-worflows]:/mnt2 --bind [Path/to/gridspec location]:/mnt/[experiment-name]_grid:ro --bind [Path/to/history/files]:/mnt/history:ro [Path/to/created/container] [Path/to/runscript]
```
NOTE: It is essential that binding is done correctly as the container’s runscript relies heavily on these paths.

Here,
- `--writable-tmpfs` allows files in the container to be editable, but temporarily (as long as the container is running); once the container stops running, changes are reverted (????)
- `--bind` mounts that  
- `ro` refers to `read-only`, so that data files are not corrupted in any way. 

At this point, the container’s runscript will begin to run. User input is required, listing the experiment, platform, target, and post-processing yaml file.

The experiment will be installed, configuration files will be validated, and the experiment should kick off.

## REVIEW

The setup-output directory created earlier will hold pp output for review. It will also hold a newly created cylc-run directory.
