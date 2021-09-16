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
    && git checkout c0122242ee90f0fe37edceb8d25f5ebd4a48cf19 

RUN . /spack/share/spack/setup-env.sh \     
    && spack env create -d . \
    && spack env activate -d . \
    && spack compiler find \
    && spack install --no-checksum --deprecated cmake@3.16.0 \
    && spack install --no-checksum --deprecated netcdf-fortran@4.5.3 \
    && spack install --no-checksum --deprecated jpeg@9.1.0 \ 
    && spack install --no-checksum --deprecated bacio@2.4.1 \ 
    && spack install --no-checksum --deprecated sigio@2.3.2 \
    && spack install --no-checksum --deprecated sfcio@1.4.1 \
    && spack install --no-checksum --deprecated gfsio@1.4.1 \
    && spack install --no-checksum --deprecated w3nco@2.4.1 \
    && spack install --no-checksum --deprecated sp@2.3.3 \ 
    && spack install --no-checksum --deprecated bufr@11.5.0 \ 
    && spack install --no-checksum --deprecated wgrib2@2.0.8 \
    && spack install --no-checksum --deprecated crtm@2.3.0 \
    && spack install --no-checksum --deprecated wrf-io@1.2.0 \
    && spack install --no-checksum --deprecated ip@3.3.3 \
    && spack install --no-checksum --deprecated ip2@1.1.2 \
    && spack install --no-checksum --deprecated nemsio@2.5.2 \
    && spack install --no-checksum --deprecated m4@1.4.18 \
    && spack install --no-checksum --deprecated w3emc@2.7.3 \
    && spack install --no-checksum --deprecated mpich@3.3.2 \
    && spack install --no-checksum --deprecated zlib@1.2.11 \
    && spack install --no-checksum --deprecated szip@2.1.1 \
    && spack install --no-checksum --deprecated udunits@2.2.26 \ 
    && spack install --no-checksum --deprecated hdf5@1.10.6 \
    && spack install --no-checksum --deprecated nccmp@1.8.7.0 \
    && spack install --no-checksum --deprecated nco@4.8.1 \
    && spack install --no-checksum --deprecated boost@1.41 \
    && spack install --no-checksum --deprecated superlu@4.3 \
    && spack install --no-checksum --deprecated libxml2@2.9.8 \ 
    && spack install --no-checksum --deprecated binutils@2.34 \
    && spack install --no-checksum --deprecated bzip2@1.06 \
    && spack install --no-checksum --deprecated netcdf-c@4.7.3 \
    && spack install --no-checksum --deprecated trilinos@13.0.1 \
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
