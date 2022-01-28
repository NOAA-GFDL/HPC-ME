# GFDL Singularity example
This example will walk you through several different ways to utilize containers for building a 
model at GFDL using containers.  The first method can be used by anyone who has access to 
singularity.  The second method can be used by anyone who has access to build containers with
singularity using the --fakeroot option (or sudo privleges).
## CONTENTS
- [Building your container](#building-your-container)
- [Building the model in a container at GFDL](#building-the-model-in-a-container-at-gfdl)
- [Running the model with the container](#running-the-model-with-the-container)
## Building your container
If you can build a container, you can do by cloning HPC-ME and building with
```
singularity build -f HPC-ME.sif Singularity.intel2022.1.1_ubuntu18.04
￼
```

## Building the model in a container at GFDL
We will call your container *HPC-ME.sif* and your compile script *compile.csh*.

### Prerequisite steps for model building at GFDL using FRE
If you normally use FRE to build your model, you should run fremake as usual without submitting
or running the compile script.  Once you have your compile script, you can go to the next step

### Building using your compile script
After you have your HPC-ME container (we will assume it is called HPC-ME.sif) and compile script
(compile.csh), you can now set up the build.  You will need to edit compile.csh, copy the intel.mk
file to the bld_dir, and edit that as well.  
#### 1. Copy and edit intel.mk
The location of intel.mk is given in the compile.csh.  Get the location and copy the file to your 
build directory.  Open it and edit the following lines near the top
```
FC = mpiifort -fc=ifx
CC = mpiicc -cc=icx
LD = mpiifort -fc=ifx $(MAIN_PROGRAM)
```
and further down you have to change the shell to bash.  You can search for `SHELL`
```
SHELL = /bin/sh -f
```
This will compile with the new intel compilers **ifx** and **icx**.  If you want to use the legacy 
**ifort** and **icc**, you can leave off the `-fc=ifx` and `-cc=icx` options.
#### 2. Edit compile.csh
Your compile script will need to be updated to reflect the changes to intel.mk.  You can change 
this by changing the `/path/to/intel.mk` to `${bld_dir}/intel.mk`. It should look like this now
```
set mkmf_template = ${bld_dir}/intel.mk
```
Next you need to update the `make` line.  Search for `make` and edit to add singularity
```
singularity exec -B ${bld_dir},${src_dir} HPC-ME.sif make  OPENMP=on NETCDF=3 <YOUR EXECUTABLE>
```
Where `<YOUR EXECUTABLE>` is the name of the executable you are trying to execute and `HPC-ME.sif`
is the name of your HPC-ME container file. The *-B* option is the bind option.  This will bind the
comma-separated list of directories that you specify on the host to the container.  In this case, 
you need to bind the build directory and the source directory so that the container has access to
them.  
#### 3. Build the model
You can execute your compile script, and compile the model executable.
```
./compile.csh |& tee log.compile
```

## Running the model with the container
This is the way to run your executable in the container using `frerun`.  After you run frerun, you
will do the unthinkable and edit your runscript.  You will search for `runCom` and edit it to look
like this
```
alias runCommand time `which srun` --mpi=pmi2 --export=ALL --ntasks=$tot_atm_ranks --cpus-per-task=$scheduler_atm_threads singularity exec -B ${workDir} ${container} ./$executable:t
```
where `${container}` is the path to the `HPC-ME.sif` file you used to compile your executable.
Then you can submit your runscript using the `sbatch` command that frerun gave you.

## Disclaimer

The United States Department of Commerce (DOC) GitHub project code is provided
on an 'as is' basis and the user assumes responsibility for its use. DOC has
relinquished control of the information and no longer has responsibility to
protect the integrity, confidentiality, or availability of the information. Any
claims against the Department of Commerce stemming from the use of its GitHub
project will be governed by all applicable Federal law. Any reference to
specific commercial products, processes, or services by service mark,
trademark, manufacturer, or otherwise, does not constitute or imply their
endorsement, recommendation or favoring by the Department of Commerce. The
Department of Commerce seal and logo, or the seal and logo of a DOC bureau,
shall not be used in any manner to imply endorsement of any commercial product
or activity by DOC or the United States Government.

This project code is made available through GitHub but is managed by NOAA-GFDL
at https://gitlab.gfdl.noaa.gov.
