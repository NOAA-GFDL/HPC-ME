# HPC-ME: HPC Portable Containers for Model Environments

## Contents
- [What is HPC-ME](main#what-is-hpc-me)
- [How to build](main#how-to-buid)
- [Usage](main#usage)
- [Build cache (PLANNED)](main#build-cache-planned)
- [List of current compilers/MPI/OS](main#list-of-current-compilersmpios)
- [List of current libraries](main#list-of-current-libraries)

## What is HPC-ME
HPC Portable Container - Model Environments is a set of Dockerfiles, Singularity Definition files, and containers to provide portable model environments for models that require the same set of libraries.  The ultimate goal is to have a community based list of libraries that are needed for compiling, executing, and post-processing earth science models.  We all use many of the same underlying libraries, and by working together we can agree upon a community-based approach to making container usage as standardized as possible. 

## List of current compilers/MPI/OS
- [gcc 8/mpich/ubuntu 20.04](Dockerfile_gnu_ubuntu20.04)
- [gcc 8/mpich/RHEL8](Dockerfile_gnu_rhel8)
- [intel oneAPI 2021.4/mpich(impi)/ubuntu 20.04](Dockerfile_intel_ubuntu18.04)
- [intel oneAPI 2021.4/mpich(impi)/centos 8](Dockerfile_intel_centos8)

## List of current libraries
This is the current list of libraries used in the HPC-ME containers.
- automake@1.16.3
- bacio@2.4.1
- berkeley-db@18.1.40
- bison@3.7.6
- bzip2@1.0.8
- cmake@3.21.2
- crtm@2.3.0
- curl@7.78.0
- diffutils@3.7
- esmf@8.1.1
- expat@2.4.1
- g2@3.4.3
- g2tmpl@1.10.0
- gdbm@1.19
- gsl@2.7
- hdf5@1.10.7
- intel-mpi@2019.10.317
- ip@3.3.3
- ip2@1.1.2
- jasper@2.0.32
- libbsd@0.11.3
- libiconv@1.16
- libjpeg-turbo@2.1.0
- libmd@1.0.3
- libpng@1.6.37
- libsigsegv@2.13
- libxml2@2.9.12
- libyaml@0.2.5
- m4@1.4.19
- nasm@2.15.05
- ncurses@6.2
- nemsio@2.5.2
- netcdf-c@4.8.0
- netcdf-fortran@4.5.3
- numactl@2.0.14
- openssl@1.1.1l
- parallel-netcdf@1.12.2
- perl@5.34.0
- pkgconf@1.8.0
- readline@8.1
- sfcio@1.4.1
- sigio@2.3.2
- sp@2.3.3
- udunits@2.2.28
- w3emc@2.9.0
- w3nco@2.4.1
- wrf-io@1.2.0
- xerces-c@3.2.3
- xz@5.2.5
- zlib@1.2.11
- lmod@8.5.6
- nccmp@1.8.6.5 
- nco@4.7.9 
- cray-netcdf@4.6.3.2
- cray-hdf5@1.10.5.2
- uberftp
## How to build
You will build the desi

## Usage
We hope to make improvements on this process as time goes on.
Dockerfiles are 

## Build cache (PLANNED)
We are working to create a build cache for the libraries listed so that building the containers is quick and easy.  Follow our repository to see more about this when it happens.


To pull images:
singularity pull docker://gitlab.gfdl.noaa.gov:5050/fre/containers/rhel8-(intel|gcc):YYYY-MM-DD 


