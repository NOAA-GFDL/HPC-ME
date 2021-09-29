# Declare these Docker variables which are passed in the --build-arg option
# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG E4S_BASE_IMAGE

FROM ecpe4s/${E4S_BASE_IMAGE}


ARG BUILD_DATE
ARG BUILD_REPO
ARG BUILD_REPO_REF
ARG SPACK_REPO
ARG SPACK_REPO_REF

# Setup spack
# these instructions are from one of the current non-runner ecpe4s dockerhub images
RUN git clone ${SPACK_REPO} \
    && cd spack \
    && git checkout bcf708098de5db0890020cc786f7290ea99377b4 \
    && rm -rf .git   

RUN . /spack/share/spack/setup-env.sh \
     && spack install mpich@3.3.2 \
     && spack install hdf5@1.10.7 ^mpich@3.3.2 \
     && spack install bacio@2.4.1 \
     && spack install bison@3.7.6 \
     && spack install bufr@11.5.0 \
     && spack install bzip2@1.0.8 \
     && spack install cmake@3.21.2 \
     && spack install crtm@2.3.0 \
     && spack install curl@7.78.0 \
     && spack install diffutils@3.7 \
     && spack install expat@2.4.1 \
     && spack install g2@3.4.3 \
     && spack install g2tmpl@1.10.0 \
     && spack install gdbm@1.19 \
     && spack install gfsio@1.4.1 \
     && spack install gsl@2.7 \
     && spack install ip@3.3.3 \
     && spack install ip2@1.1.2 \
     && spack install jasper@2.0.32 \
     && spack install libaec@1.0.5 \
     && spack install libbsd@0.11.3 \
     && spack install libpng@1.6.37 \
     && spack install libsigsegv@2.13 \
     && spack install libtool@2.4.6 \
     && spack install libxml2@2.9.12 \
     && spack install m4@1.4.19 \
     && spack install nemsio@2.5.2 ^mpich@3.3.2 \
     && spack install ncurses@6.2 \
     && spack install numactl@2.0.14 \
     && spack install openblas@0.3.17 \
     && spack install parallel-netcdf@1.12.2 ^mpich@3.3.2 \
     && spack install sfcio@1.4.1 \
     && spack install sigio@2.3.2 \
     && spack install sp@2.3.3 \
     && spack install trilinos@13.0.1 ^mpich@3.3.2 \
     && spack install udunits@2.2.28 \
     && spack install w3emc@2.9.0 \
     && spack install w3nco@2.4.1 \
     && spack install xz@5.2.5 \
     && spack install zlib@1.2.11 \
     && spack install netcdf-c ^hdf5@1.10.7+fortran+hl ^mpich@3.3.2 \
     && spack install netcdf-fortran ^hdf5@1.10.7+hl ^mpich@3.3.2 \
     && spack install esmf ^mpich@3.3.2 \
     && spack mirror add e4s https://cache.e4s.io \
     && spack buildcache keys -it
    # Search for system-provided packages and add to packages.yaml
    #spack external find

# Set label metadata, following E4S example
# https://docs.docker.com/config/labels-custom-metadata/
LABEL gov.noaa.gfdl.spack-repo=${SPACK_REPO}
LABEL gov.noaa.gfdl.spack-repo-ref=${SPACK_REPO_REF}
LABEL gov.noaa.gfdl.build-date=${BUILD_DATE}
LABEL gov.noaa.gfdl.repo=${BUILD_REPO}
LABEL gov.noaa.gfdl.repo-ref=${BUILD_REPO_REF}
