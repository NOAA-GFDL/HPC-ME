# Build stage with Spack pre-installed and ready to be used
FROM ecpe4s/rhel8-runner-x86_64:2021-09-01-gcc11.2

# What we want to install and how we want to install it
# is specified in a manifest file (spack.yaml)
RUN mkdir /opt/spack-environment \
&&  (echo "spack:" \
&&   echo "  specs:" \
&&   echo "  - antlr@2.7.7" \
&&   echo "  - automake@1.16.3" \
&&   echo "  - bacio@2.4.1" \
&&   echo "  - berkeley-db@18.1.40" \
&&   echo "  - bison@3.7.6" \
&&   echo "  - bufr@11.5.0" \
&&   echo "  - bzip2@1.0.8" \
&&   echo "  - cmake@3.21.2" \
&&   echo "  - crtm@2.3.0" \
&&   echo "  - curl@7.78.0" \
&&   echo "  - diffutils@3.7" \
&&   echo "  - esmf@8.1.1 ^mpich@3.3.2" \
&&   echo "  - expat@2.4.1" \
&&   echo "  - findutils@4.8.0" \
&&   echo "  - flex@2.6.3" \
&&   echo "  - g2@3.4.3" \
&&   echo "  - g2tmpl@1.10.0" \
&&   echo "  - gdbm@1.19" \
&&   echo "  - gfsio@1.4.1" \
&&   echo "  - gsl@2.7" \
&&   echo "  - hdf5@1.10.7 ^mpich@3.3.2" \
&&   echo "  - hwloc@2.5.0" \
&&   echo "  - ip@3.3.3" \
&&   echo "  - ip2@1.1.2" \
&&   echo "  - jasper@2.0.32" \
&&   echo "  - libaec@1.0.5" \
&&   echo "  - libbsd@0.11.3" \
&&   echo "  - libedit@3.1-20210216" \
&&   echo "  - libevent@2.1.12" \
&&   echo "  - libfabric@1.13.1" \
&&   echo "  - libiconv@1.16" \
&&   echo "  - libjpeg-turbo@2.1.0" \
&&   echo "  - libmd@1.0.3" \
&&   echo "  - libpciaccess@0.16" \
&&   echo "  - libpng@1.6.37" \
&&   echo "  - libsigsegv@2.13" \
&&   echo "  - libxml2@2.9.12" \
&&   echo "  - m4@1.4.19" \
&&   echo "  - mpich@3.3.2" \
&&   echo "  - nasm@2.15.05" \
&&   echo "  - ncurses@6.2" \
&&   echo "  - nemsio@2.5.2 ^mpich@3.3.2" \
&&   echo "  - netcdf-c ^hdf5@1.10.7+fortran+hl ^mpich@3.3.2" \
&&   echo "  - netcdf-fortran ^hdf5@1.10.7+hl ^mpich@3.3.2" \
&&   echo "  - numactl@2.0.14" \
&&   echo "  - openblas@0.3.17" \
&&   echo "  - openssh@8.7p1" \
&&   echo "  - openssl@1.1.1l" \
&&   echo "  - parallel-netcdf@1.12.2 ^mpich@3.3.2" \
&&   echo "  - perl@5.34.0" \
&&   echo "  - pkgconf@1.8.0" \
&&   echo "  - readline@8.1" \
&&   echo "  - sfcio@1.4.1" \
&&   echo "  - sigio@2.3.2" \
&&   echo "  - sp@2.3.3" \
&&   echo "  - trilinos@13.0.1 ^mpich@3.3.2" \
&&   echo "  - udunits@2.2.28" \
&&   echo "  - util-macros@1.19.3" \
&&   echo "  - w3emc@2.9.0" \
&&   echo "  - w3nco@2.4.1" \
&&   echo "  - xerces-c@3.2.3" \
&&   echo "  - xz@5.2.5" \
&&   echo "  - zlib@1.2.11" \
&&   echo "  view: /opt/view" \
&&   echo "  compilers:" \
&&   echo "  - compiler:" \
&&   echo "      spec: gcc@8.4.1" \
&&   echo "      paths:" \
&&   echo "        cc: /usr/bin/gcc" \
&&   echo "        cxx: /usr/bin/g++" \
&&   echo "        f77: /usr/bin/gfortran" \
&&   echo "        fc: /usr/bin/gfortran" \
&&   echo "      flags: {}" \
&&   echo "      operating_system: rhel8" \
&&   echo "      target: x86_64" \
&&   echo "      modules: []" \
&&   echo "      environment: {}" \
&&   echo "      extra_rpaths: []" \
&&   echo "  mirrors:" \
&&   echo "    e4s: https://cache.e4s.io" \
&&   echo "  concretization: together" \
&&   echo "  config:" \
&&   echo "    install_tree: /opt/software") > /opt/spack-environment/spack.yaml

# Setup spack
# these instructions are from one of the current non-runner ecpe4s dockerhub images
RUN git clone https://github.com/spack/spack.git \
     && cd spack \
     && git checkout c24413a530ee4cddc630d79aa67fada7d82a86e5

# Install the software, remove unnecessary deps
RUN cd /opt/spack-environment && \
    . /spack/share/spack/setup-env.sh && \ 
    spack env activate . && \
    spack install --fail-fast && \
    spack gc -y

# Strip all the binaries
RUN find -L /opt/view/* -type f -exec readlink -f '{}' \; | \
    xargs file -i | \
    grep 'charset=binary' | \
    grep 'x-executable\|x-archive\|x-sharedlib' | \
    awk -F: '{print $1}' | xargs strip -s

# Modifications to the environment that are necessary to run
RUN cd /opt/spack-environment && \
    spack env activate --sh -d . >> /etc/profile.d/z10_spack_environment.sh


# Bare OS image to run the installed executables
FROM ubuntu:18.04

COPY --from=builder /opt/spack-environment /opt/spack-environment
COPY --from=builder /opt/software /opt/software
COPY --from=builder /opt/view /opt/view
COPY --from=builder /etc/profile.d/z10_spack_environment.sh /etc/profile.d/z10_spack_environment.sh



ENTRYPOINT ["/bin/bash", "--rcfile", "/etc/profile", "-l"]
