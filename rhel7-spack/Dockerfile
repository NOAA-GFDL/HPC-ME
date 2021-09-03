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
RUN git clone ${SPACK_REPO} --single-branch --depth=1 --branch ${SPACK_REPO_REF} && \
    echo ". /spack/share/spack/setup-env.sh" >> /etc/bashrc
    # Don't think these Spack init steps are needed but possibly they are so commenting for now
    # Initialize spack for this shell
    #. /spack/share/spack/setup-env.sh && \
    # Search for installed compilers
    #spack compiler find && \
    # Search for system-provided packages and add to packages.yaml
    #spack external find

# Set label metadata, following E4S example
# https://docs.docker.com/config/labels-custom-metadata/
LABEL gov.noaa.gfdl.spack-repo=${SPACK_REPO}
LABEL gov.noaa.gfdl.spack-repo-ref=${SPACK_REPO_REF}
LABEL gov.noaa.gfdl.build-date=${BUILD_DATE}
LABEL gov.noaa.gfdl.repo=${BUILD_REPO}
LABEL gov.noaa.gfdl.repo-ref=${BUILD_REPO_REF}
