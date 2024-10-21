# The GFDL software stack container

## How to build
Here is a recommended method for building the container with podman and
converting it to .sif with singularity
```
podman build -t gfdlsoftware:2024.01-gcc13 -f Dockerfile-spack202401-rocky8-gcc13.2 | & tee log.log  
podman save -o gfdlsoftware_2024.01-gcc13.tar gfdlsoftware:2024.01-gcc13 
singularity pull gfdlsoftware_2024.01-gcc13.sif docker-archive:gfdlsoftware_2024.01-gcc13.tar
```
Here are instructions for using Docker and building a singularity
container from the docker daemon
```
sudo systemctl start docker
sudo docker build -t gfdlsoftware:2024.01-gcc13 -f Dockerfile-spack202401-rocky8-gcc13.2 .
sudo singularity build  gfdlsoftware_2024.01-gcc13.sif docker-daemon:gfdlsoftware:2024.01-gcc13
```
## How to run
Using `apptainer exec` requires the user to pass in a PATH and execute
the shell.  Here is an example run command
```
apptainer exec --env PATH=/opt/views/view/bin:/opt/views/view/grace/bin:/opt/spack/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin gfdlsoftware_2024.01-gcc13.sif bash -c 'mpicc --version'
```
Here is an example that worked on the gaea supercomputer to execute a MPI hello world program
```
srun -n 256 --mpi=pmi2 apptainer exec -B $PWD --env PATH=/opt/views/view/bin:/opt/views/view/grace/bin:/opt/spack/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin gfdlsoftware_2024.01-gcc13.sif bash -c './mpi_hello.x'
```
We did not bind MPI, so we needed to use `--mpi=pmi2`
