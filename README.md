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
You will build the desi

## Usage
We hope to make improvements on this process as time goes on.
Dockerfiles are 

## Build cache (PLANNED)
We are working to create a build cache for the libraries listed so that building the containers is quick and easy.  Follow our repository to see more about this when it happens.


To pull images:
singularity pull docker://gitlab.gfdl.noaa.gov:5050/fre/containers/rhel8-(intel|gcc):YYYY-MM-DD 


