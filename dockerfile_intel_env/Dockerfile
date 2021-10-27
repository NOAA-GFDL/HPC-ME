# Build stage with Spack pre-installed and ready to be used
FROM intel/oneapi-hpckit as builder

# What we want to install and how we want to install it
# is specified in a manifest file (spack.yaml)
RUN mkdir /opt/spack-environment \
&&  (echo "spack:" \
&&   echo "  specs:" \
&&   echo "  - automake@1.16.3 %intel@2021.4.0" \
&&   echo "  - bacio@2.4.1 %intel@2021.4.0" \
&&   echo "  - berkeley-db@18.1.40%intel@2021.4.0 " \
&&   echo "  - bison@3.7.6 %intel@2021.4.0" \
&&   echo "  - bzip2@1.0.8 %intel@2021.4.0" \
&&   echo "  - cmake@3.21.2 %intel@2021.4.0" \
&&   echo "  - crtm@2.3.0 %intel@2021.4.0" \
&&   echo "  - curl@7.78.0 %intel@2021.4.0" \
&&   echo "  - diffutils@3.7 %intel@2021.4.0" \
&&   echo "  - esmf@8.1.1 ^intel-mpi@2019.10.317 %intel@2021.4.0" \
&&   echo "  - expat@2.4.1 %intel@2021.4.0" \
&&   echo "  - g2@3.4.3 %intel@2021.4.0" \
&&   echo "  - g2tmpl@1.10.0 %intel@2021.4.0" \
&&   echo "  - gdbm@1.19 %intel@2021.4.0" \
&&   echo "  - gsl@2.7 %intel@2021.4.0" \
&&   echo "  - hdf5@1.10.7 ^intel-mpi@2019.10.317 %intel@2021.4.0" \
&&   echo "  - intel-mpi@2019.10.317 %intel@2021.4.0" \
&&   echo "  - ip@3.3.3 %intel@2021.4.0" \
&&   echo "  - ip2@1.1.2 %intel@2021.4.0" \
&&   echo "  - jasper@2.0.32 %intel@2021.4.0" \
&&   echo "  - libbsd@0.11.3 %intel@2021.4.0" \
&&   echo "  - libiconv@1.16 %intel@2021.4.0" \
&&   echo "  - libjpeg-turbo@2.1.0 %intel@2021.4.0" \
&&   echo "  - libmd@1.0.3 %intel@2021.4.0" \
&&   echo "  - libpng@1.6.37 %intel@2021.4.0" \
&&   echo "  - libsigsegv@2.13 %intel@2021.4.0" \
&&   echo "  - libxml2@2.9.12 %intel@2021.4.0" \
&&   echo "  - libyaml@0.2.5 %intel@2021.4.0" \
&&   echo "  - m4@1.4.19 %intel@2021.4.0" \
&&   echo "  - nasm@2.15.05 %intel@2021.4.0" \
&&   echo "  - ncurses@6.2 %intel@2021.4.0" \
&&   echo "  - nemsio@2.5.2 ^intel-mpi@2019.10.317 %intel@2021.4.0" \
&&   echo "  - netcdf-c@4.8.0 ^hdf5+fortran+hl ^intel-mpi@2019.10.317 %intel@2021.4.0" \
&&   echo "  - netcdf-fortran@4.5.3 ^netcdf-c ^intel-mpi@2019.10.317 %intel@2021.4.0" \
&&   echo "  - numactl@2.0.14 %intel@2021.4.0" \
&&   echo "  - openssl@1.1.1l %intel@2021.4.0" \
&&   echo "  - parallel-netcdf@1.12.2 ^intel-mpi@2019.10.317 %intel@2021.4.0" \            
&&   echo "  - perl@5.34.0 %intel@2021.4.0" \
&&   echo "  - pkgconf@1.8.0 %intel@2021.4.0" \
&&   echo "  - readline@8.1 %intel@2021.4.0" \
&&   echo "  - sfcio@1.4.1 %intel@2021.4.0" \
&&   echo "  - sigio@2.3.2 %intel@2021.4.0" \
&&   echo "  - sp@2.3.3 %intel@2021.4.0" \
&&   echo "  - udunits@2.2.28 %intel@2021.4.0" \
&&   echo "  - w3emc@2.9.0 %intel@2021.4.0" \
&&   echo "  - w3nco@2.4.1 %intel@2021.4.0" \
&&   echo "  - wrf-io@1.2.0 %intel@2021.4.0" \
&&   echo "  - xerces-c@3.2.3 %intel@2021.4.0" \
&&   echo "  - xz@5.2.5 %intel@2021.4.0" \
&&   echo "  - zlib@1.2.11 %intel@2021.4.0" \
&&   echo "  view: /opt/view" \
#&&   echo "  compilers:" \
#&&   echo "  - compiler:" \
#&&   echo "      spec: intel@2021.4.0" \
#&&   echo "      paths:" \
#&&   echo "        cc: /opt/intel/oneapi/mpi/2021.4.0/bin/mpiicc" \
#&&   echo "        cxx: /opt/intel/oneapi/mpi/2021.4.0/bin/mpiicpc" \
#&&   echo "        f77: /opt/intel/oneapi/mpi/2021.4.0/bin/mpiifort" \
#&&   echo "        fc: /opt/intel/oneapi/mpi/2021.4.0/bin/mpiifort" \
#&&   echo "      flags: {}" \
#&&   echo "      operating_system: ubuntu18.04" \
#&&   echo "      target: x86_64" \
#&&   echo "      modules: []" \
#&&   echo "      environment: {}" \
#&&   echo "      extra_rpaths: []" \
#&&   echo "  - compiler:" \
#&&   echo "      spec: oneapi@2021.4.0" \
#&&   echo "      paths:" \
#&&   echo "        cc: /opt/intel/oneapi/compiler/2021.4.0/linux/bin/icx" \
#&&   echo "        cxx: /opt/intel/oneapi/compiler/2021.4.0/linux/bin/icpx" \
#&&   echo "        f77: /opt/intel/oneapi/compiler/2021.4.0/linux/bin/ifx" \
#&&   echo "        fc: /opt/intel/oneapi/compiler/2021.4.0/linux/bin/ifx" \
#&&   echo "      flags: {}" \
#&&   echo "      operating_system: ubuntu18.04" \
#&&   echo "      target: x86_64" \
#&&   echo "      modules: []" \
#&&   echo "      environment: {}" \
#&&   echo "      extra_rpaths: []" \
&&   echo "  mirrors:" \
&&   echo "    e4s: https://cache.e4s.io" \
&&   echo "  concretization: together" \
&&   echo "  config:" \
&&   echo "    install_tree: /opt/intel") > /opt/spack-environment/spack.yaml

RUN apt-get update -y
RUN apt-get install -y git

# Setup spack
# these instructions are from one of the current non-runner ecpe4s dockerhub images
RUN git clone https://github.com/spack/spack.git \
    && cd spack \
    && git checkout c24413a530ee4cddc630d79aa67fada7d82a86e5 

# Install the software, remove unnecessary deps --fail-fast
RUN . /opt/intel/oneapi/setvars.sh && \
    cd /opt/spack-environment && \
    . /spack/share/spack/setup-env.sh && \
    spack compiler find && \
    spack env activate . && \
    apt-get update && \
    apt-get install -y cpio && \ 
    spack install --fail-fast --dirty && \
    spack gc -y 

# Strip all the binaries
RUN find -L /opt/view/* -type f -exec readlink -f '{}' \; | \
    xargs file -i | \
    grep 'charset=binary' | \
    grep 'x-executable\|x-archive\|x-sharedlib' | \
    awk -F: '{print $1}' | xargs strip -s

# Modifications to the environment that are necessary to run
RUN . /opt/intel/oneapi/setvars.sh && \
    cd /opt/spack-environment && \
    spack env activate --sh -d . >> /etc/profile.d/z10_spack_environment.sh


# Bare OS image to run the installed executables
FROM intel/oneapi-hpckit 

COPY --from=builder /opt/spack-environment /opt/spack-environment
COPY --from=builder /opt/software /opt/software
COPY --from=builder /opt/view /opt/view
COPY --from=builder /etc/profile.d/z10_spack_environment.sh /etc/profile.d/z10_spack_environment.sh

RUN apt-get update
RUN apt-get install -y git

ENTRYPOINT ["/bin/bash", "--rcfile", "/etc/profile", "-l"]

