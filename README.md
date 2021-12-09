 Portable Containers for Model Environments

## Contents
What is HPC-ME
How to build
Usage
Build cache (PLANNED)
List of current compilers/MPI/OS
List of current libraries

## What is HPC-ME
HPC Portable Container - Model Environments is a set of Dockerfiles, Singularity Definition files, and containers to provide portable model environments for models that require the same set of libraries.  The ultimate goal is to have a community based list of libraries that are needed for compiling, executing, and post-processing earth science models.  We all use many of the same underlying libraries, and by working together we can agree upon a community-based approach to making container usage as standardized as possible. 

## List of current compilers/MPI/OS
gcc 8/mpich/ubuntu 18.
gcc 8/mpich/RHEL8
intel oneAPI 2021.4/mpich(impi)/ubuntu 18.
intel oneAPI 2021.4/mpich(impi)/centos 7

## List of current libraries
This is the current list of libraries used in the HPC-ME containers.

## How to build
You will build the desi

## Usage
We hope to make improvements on this process as time goes on.
Dockerfiles are 

## Build cache (PLANNED)
We are working to create a build cache for the libraries listed so that building the containers is quick and easy.  Follow our repository to see more about this when it happens.


To pull images:
singularity pull docker://gitlab.gfdl.noaa.gov:5050/fre/containers/rhel8-(intel|gcc):YYYY-MM-DD 


