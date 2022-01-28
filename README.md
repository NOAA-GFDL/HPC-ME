# HPC-ME: HPC Portable Containers for Model Environments

## Contents
- [What is HPC-ME](#what-is-hpc-me)
- [List of current compilers/MPI/OS](#list-of-current-compilers)
- [List of current libraries](#list-of-current-libraries)
- [How to build](#how-to-build)
- [How to use](#how-to-use)
- [Planned improvements](#planned-improvements)

## What is HPC-ME
HPC Portable Container - Model Environments is a set of Dockerfiles, Singularity Definition files, and containers to provide portable model environments for scientific applications that require the same set of libraries.  The ultimate goal is to have a community-based list of libraries that are needed for compiling, executing, and post-processing earth science models.  We all use many of the same underlying libraries, and by working together we can agree upon a community-based approach to making container usage as standardized as possible. 

## List of current compilers/MPI/OS
For each container, there is a full version that contains the programming environment and a smaller runtime environment that can be used to run compiled executables. (The runtime container definition files will be added soon.)
#- [gcc 8/mpich/ubuntu 20.04](Dockerfile_gnu_ubuntu20.04)
- [gcc 8/mpich/RHEL8](Dockerfile_gnu_rhel8)
- [intel oneAPI 2022.1/mpich(impi)/ubuntu 18.04](Dockerfile_intel_ubuntu18.04)
#- [intel oneAPI 2021.4/mpich(impi)/centos 8](Dockerfile_intel_centos8)


## List of current libraries
This is the current list of most of the libraries used in the HPC-ME containers (We are trying to keep this up-to-date).
The complete lit should be found in the respective YAML file.
- [automake@1.16.3](https://spack.readthedocs.io/en/latest/package_list.html#automake)
- [bacio@2.4.1](https://spack.readthedocs.io/en/latest/package_list.html#bacio)
- [berkeley-db@18.1.40](https://spack.readthedocs.io/en/latest/package_list.html#berkeley-db)
- [bison@3.7.6](https://spack.readthedocs.io/en/latest/package_list.html#bison)
- [bzip2@1.0.8](https://spack.readthedocs.io/en/latest/package_list.html#bzip2)
- [cmake@3.21.2](https://spack.readthedocs.io/en/latest/package_list.html#cmake)
- [crtm@2.3.0](https://spack.readthedocs.io/en/latest/package_list.html#crtm)
- [curl@7.78.0](https://spack.readthedocs.io/en/latest/package_list.html#curl)
- [diffutils@3.7](https://spack.readthedocs.io/en/latest/package_list.html#diffutils)
- [esmf@8.1.1](https://spack.readthedocs.io/en/latest/package_list.html#esmf)
- [expat@2.4.1](https://spack.readthedocs.io/en/latest/package_list.html#expat)
- [g2@3.4.3](https://spack.readthedocs.io/en/latest/package_list.html#g2)
- [g2tmpl@1.10.0](https://spack.readthedocs.io/en/latest/package_list.html#g2tmpl)
- [gdbm@1.19](https://spack.readthedocs.io/en/latest/package_list.html#gdbm)
- [gsl@2.7](https://spack.readthedocs.io/en/latest/package_list.html#gsl)
- [hdf5@1.10.7](https://spack.readthedocs.io/en/latest/package_list.html#hdf5)
- [intel-mpi@2019.10.317](https://spack.readthedocs.io/en/latest/package_list.html#intel-mpi)
- [ip@3.3.3](https://spack.readthedocs.io/en/latest/package_list.html#ip)
- [ip2@1.1.2](https://spack.readthedocs.io/en/latest/package_list.html#ip2)
- [jasper@2.0.32](https://spack.readthedocs.io/en/latest/package_list.html#jasper)
- [libbsd@0.11.3](https://spack.readthedocs.io/en/latest/package_list.html#libbsd)
- [libiconv@1.16](https://spack.readthedocs.io/en/latest/package_list.html#libiconv)
- [libjpeg-turbo@2.1.0](https://spack.readthedocs.io/en/latest/package_list.html#libjpeg-turbo)
- [libmd@1.0.3](https://spack.readthedocs.io/en/latest/package_list.html#libmd)
- [libpng@1.6.37](https://spack.readthedocs.io/en/latest/package_list.html#libpng)
- [libsigsegv@2.13](https://spack.readthedocs.io/en/latest/package_list.html#libsigsegv)
- [libxml2@2.9.12](https://spack.readthedocs.io/en/latest/package_list.html#libxml2)
- [libyaml@0.2.5](https://spack.readthedocs.io/en/latest/package_list.html#libyaml)
- [m4@1.4.19](https://spack.readthedocs.io/en/latest/package_list.html#m4)
- [nasm@2.15.05](https://spack.readthedocs.io/en/latest/package_list.html#nasm)
- [ncurses@6.2](https://spack.readthedocs.io/en/latest/package_list.html#ncurses)
- [nemsio@2.5.2](https://spack.readthedocs.io/en/latest/package_list.html#nemsio)
- [netcdf-c@4.8.0](https://spack.readthedocs.io/en/latest/package_list.html#netcdf-c)
- [netcdf-fortran@4.5.3](https://spack.readthedocs.io/en/latest/package_list.html#netcdf-fortran)
- [numactl@2.0.14](https://spack.readthedocs.io/en/latest/package_list.html#numactl)
- [openssl@1.1.1l](https://spack.readthedocs.io/en/latest/package_list.html#openssl)
- [parallel-netcdf@1.12.2](https://spack.readthedocs.io/en/latest/package_list.html#parallel-netcdf)
- [perl@5.34.0](https://spack.readthedocs.io/en/latest/package_list.html#perl)
- [pkgconf@1.8.0](https://spack.readthedocs.io/en/latest/package_list.html#pkgconf)
- [readline@8.1](https://spack.readthedocs.io/en/latest/package_list.html#readline)
- [sfcio@1.4.1](https://spack.readthedocs.io/en/latest/package_list.html#sfcio)
- [sigio@2.3.2](https://spack.readthedocs.io/en/latest/package_list.html#sigio)
- [sp@2.3.3](https://spack.readthedocs.io/en/latest/package_list.html#sp)
- [udunits@2.2.28](https://spack.readthedocs.io/en/latest/package_list.html#udunits)
- [w3emc@2.9.0](https://spack.readthedocs.io/en/latest/package_list.html#w3emc)
- [w3nco@2.4.1](https://spack.readthedocs.io/en/latest/package_list.html#w3nco)
- [wrf-io@1.2.0](https://spack.readthedocs.io/en/latest/package_list.html#wrf-io)
- [xerces-c@3.2.3](https://spack.readthedocs.io/en/latest/package_list.html#xerces-c)
- [xz@5.2.5](https://spack.readthedocs.io/en/latest/package_list.html#xz)
- [zlib@1.2.11](https://spack.readthedocs.io/en/latest/package_list.html#zlib)
- [lmod@8.5.6](https://spack.readthedocs.io/en/latest/package_list.html#lmod)
- [nccmp@1.8.6.5](https://spack.readthedocs.io/en/latest/package_list.html#nccmp)
- [nco@4.7.9](https://spack.readthedocs.io/en/latest/package_list.html#nco)
- [cray-netcdf@4.6.3.2](https://spack.readthedocs.io/en/latest/package_list.html#cray-netcdf)
- [cray-hdf5@1.10.5.2](https://spack.readthedocs.io/en/latest/package_list.html#cray-hdf5)
- [uberftp](https://spack.readthedocs.io/en/latest/package_list.html#uberftp)
## How to build
**We plan to make this step optional soon.** In order to build the Docker images, you will need access to a computer with root-like access, and either docker or singularity installed. If you do not have root-like access to a suitable machine, you can still run images that were already created (e.g. on Docker hub), and we plan on hosting runnable Docker images along with the Dockerfiles in this repository soon. If you have root-like access and docker, start by choosing one of the currently supported model environments from the list above. Then build the Docker container from the Dockerfile using docker build; for example, to build the gcc8/mpich/ubuntu18 container:

```
docker build --file Dockerfile_gnu_ubuntu20.04 . --tag hpc-me.ubuntu.gnu
```

The build process takes approximately 2-3 hours, as the packages are downloaded and compiled using Spack. After a successful build, you will see that the image was built and tagged successfully:

```
Successfully built 90a878af77b4
Successfully tagged hpc-me.rhel8.gnu:latest
```

Then, you may run the container using docker or singularity on the same host. To run the image on a different machine, pushing the image to Docker Hub is recommended. Note that you will need a DockerHub account to do this (replace USER with your Docker user ID in the examples below). For example:

```
docker tag hpc-me.rhel8.gnu USER/hpc-me.rhel8.gnu
docker login
docker push USER/hpc-me.rhel8.gnu:latest
```

## How to use
We plan to make improvements on this process. Also, while we plan on making Docker images available on the GitHub container registry, currently you must build the images yourself. Please start with the [Build instructions](#how-to-build) to generate a Docker image with your desired OS/compiler HPC-ME environment. Then you may run the container using docker or singularity; singularity is more likely than docker to be available on HPC environments.

The usage documentation consists of some general notes on serial/parallel usage, files inside and outside the container, downloading the containers, and then specific usage scenarios:
- [Serial applications using docker](#serial-applications-using-docker)
- [Serial applications using singularity](#serial-applications-using-singularity)
- [Parallel applications using singularity](#parallel-applications-using-singularity)

### Serial and parallel usage

HPC-ME containers are intended for both serial and parallel applications. Serial applications include compiling model executables, generating input grids, and post-processing model output. Earth system, climate, and weather models require parallelism to run efficiently, and use one of the Message Passage Interface (MPI) implementations OpenMPI, Intel MPI, or mpich. GCC-based HPC-ME containers use the mpich-based MPI library, which is widely available on most HPC sites, and the Intel-based containers contain both mpich and Intel MPI.

### Notes on filesystems and writing files

We recommend not saving or modifying files within the environment container, and instead create and modify files on your regular filesystem. To do this, you will need to connect your filesystem to your container using bind mounts.

### Downloading containers and managing images on the filesystem

Once you have pushed your images to DockerHub, you will need to download them before using. In the examples below, replace USER with your Docker Hub ID. If using docker,

```
docker pull USER/hpc-me.rhel8.gnu:latest
```

If using singularity,

```
singularity pull docker://USER/hpc-me.rhel8.gnu:latest
```

If using singularity, the image file (SIF format) is saved to the current working directory

```
> ls *.sif
-rwxr-xr-x 532M Dec 10 16:09 hpc-me.rhel8.gnu_latest.sif*
```

If using docker, the downloaded image is handled by the central docker service.

### Serial applications using docker

You may activate an interactive shell within the desired HPC-ME container using docker. After running the container, the compilers and tools available within the container will be accessible in your PATH; e.g.

```
> docker run -it hpc-me.rhel8.gnu:latest

[root@0d2cf64e1175 /]# which nf-config
/opt/view/bin/nf-config

[root@0d2cf64e1175 /]# nf-config --version
netCDF-Fortran 4.5.3

[root@0d2cf64e1175 /]# nf-config --cflags
-I/opt/software/linux-rhel8-x86_64/gcc-8.4.1/netcdf-fortran-4.5.3-g5qfkdlp36unt2s4j4wyrc6heh2sa64n/include
```

### Serial applications using singularity

Singularity can run Docker images and is more likely to be available on HPC environments. As with docker run, the HPC-ME tools and compilers are available in the shell, somewhat similar to loading a set of Environment Modules prepared by site administrators.

```
>singularity run hpc-me.rhel8.gnu_latest.sif

Singularity> which nf-config
/opt/view/bin/nf-config

Singularity> nf-config --version
netCDF-Fortran 4.5.3
```

### Parallel applications using singularity

HPC-ME containers can provide the runtime environment for MPI applications. For instance, one could compile an MPI application using the instructions above using one of the HPC-ME development containers; and then run the application using the corresponding runtime HPC-ME container.

Please note that we are continuing to improve the usability of HPC-ME containers as well as provide more usage examples.

Usually, GFDL climate models are run on gaea by submitting a runscript to the Slurm scheduler. The runscript loads needed runtime Environment Modules, prepares input directories and files, and executes the MPI executable using srun. The HPC-ME containers provide the necessary runtime environment, obviating the need for loading Environment Modules. Currently, our approach for using the HPC-ME containers is as follows:

1. Create a new container, starting with the desired HPC-ME runtime container
1. Add the MPI-compiled executable to the container filesystem
1. Set the MPI-compiled executable to as the container's command (so that when the container is run the MPI executable within the container runs)
1. Run the singularity container SIF file using srun within the runscript, replacing the traditional MPI executable.
  - Replace "srun executable.x" with "srun singularity run container.SIF"
  - Add --mpi=pmi2 to the srun call, which connects the system MPI to the container MPI to the singularity run call
  - Bind the working directory so that the container has access to the input files and can write output files (singularity run -B=/path/to/workdir)
5. Submit the modified runscript to the scheduler

We plan to provide more examples and usage scenarios, such as using the HPC-ME containers as-is (i.e. not creating a new container as described above)

## Planned improvements
HPC-ME is a work in progress under active development, so please check back or follow the repository for more updates.

### Build cache
We are working to create a build cache for the libraries listed so that building the containers is quick and easy.

### Github container registry
We are working to add CI capability to this repository, so that the containers will be automatically built and stored in the github container registry. This will make building unnecessary for most cases, though users may build the containers themselves if they wish (e.g. for custom modifications).

### More usage examples and documentation, especially for MPI applications
We are still learning how to best use the HPC-ME containers with MPI appliations, so please check back.
