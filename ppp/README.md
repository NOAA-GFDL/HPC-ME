# Post-Processing Container

Previously, many GFDL workflows and configurations have only been accessible on gitlab. This is disadvantageous for outside collaboration, flexibility, community development. While the FRE workflow can now be conda installed, another deployment method of containerization has been developed. Containerzation of the FRE workflow at GFDL bolsters portability while also simplifying the environment set-up for the user. With the environment set-up done through the container build and runscript, this post-processing container work allows for more effective sharing of the workflow.

## BUILDING

**In order to build the container, the user needs to have podman access on gaea. If needed, put in a helpdesk ticket.**

Files used to build container:

- Dockerfile-ppp
- cylc-flow-tools environment yaml
- runscript.sh
    
The container will house the fre-cli tools and subtools, and any necessary packages needed for those tools.

Using podman and apptainer to build, follow these steps:

```
## Clone the HPC-ME repository
git clone git@gitlab.gfdl.noaa.gov:fre/HPC-ME.git

## Navigate into the ppp folder
cd HPC-ME/ppp

## Build a container image
podman build -f Dockerfile-ppp -t 2025

## Save the image to a local tar file
# It is recommended to name the container after the post-processing experiment name
podman save -o [name of container].tar localhost/2024.01

## Create the singularity image file (sif) from the tar file
apptainer build --disable-cache [name of container].sif docker-archive://[name of container].tar
```

## SETUP
Now that the FRE workflows container is created, certain files and directories must be made accessible.

#### <ins>Repos and Configuration files

In order to run the post-processing workflow, certain repositories and files are needed: 

1. `fre-workflows` cloned repository
    - Can be found here: https://github.com/NOAA-GFDL/fre-workflows 

2. Directory that will include folders and files for container set-up and running (could be named `ppp-setup` for example)
    - The setup/output directory consists of a few subdirectories: pp, ptmp, and temp (these are created through the runscript.sh in this repository for the container)
    - ***Ensure you create the empty `ppp-setup` folder in an area with enough space as this is where the post-processing run output will be populated.***

3. Yaml configuration files are also needed. 
    - Publicly available example yaml configuration files can be found here: https://github.com/NOAA-GFDL/fre-examples 

#### <ins>Data files

Additionally, history files and grid spec files are needed.

**If on Gaea**, history files and grid spec files are usually available in a certain location; retrieve their locations
    
- Paths to the history folder and grid spec file will be mounted into the container as read only folders/files 

**If not on Gaea**, history file and grid spec data should be transferred to the `ppp-setup` location in:

- `ppp-setup/history/`
- `ppp-setup/[experiment]_grid/`

#### <ins>Configuration Edits

Regarding the yaml configurations, some paths need to be edited to reference the file location mounted inside the container. These include: 

- `&GRID_SPEC96` "/mnt/[experimentname]_grid/[gridSpec file]
- `history_dir`: "/mnt/history"
- `pp_dir`: "/mnt/pp" 
- `ptmp_dir`: "/mnt/ptmp"

## RUNNING 

To run the container, follow these steps:

```
## Use apptainer or singularity to run
# Make sure directories are writable
# Bind in necessary locations (setup folder, workflow folder, data locations)
apptainer exec --writable-tmpfs --bind [Path/to/setup/folder]:/mnt --bind [Path/to/fre-worflows]:/mnt2 --bind [Path/to/gridspec location]:/mnt/[experiment-name]_grid:ro --bind [Path/to/history/files]:/mnt/history:ro [Path/to/created/container] /exec/runscript.sh
```

Here,
- `--writable-tmpfs` allows files in the container to be editable, but temporarily (as long as the container is running)
- `--bind` mounts that  
- `ro` refers to `read-only`, so that data files are not corrupted in any way. 

At this point, the container’s runscript will begin to run. User input is required, listing the experiment, platform, target, and post-processing yaml file.

The experiment will be installed, configuration files will be validated, and the experiment should kick off.

## REVIEW

The setup-output directory created earlier will hold pp output for review. It will also hold a newly created cylc-run directory.
