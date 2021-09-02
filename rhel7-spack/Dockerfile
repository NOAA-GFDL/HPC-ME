FROM ecpe4s/rhel8-runner-x86_64:2021-09-01-gcc11.2

# Declare these Docker variables which are passed in the --build-arg option
# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG BUILD_DATE
ARG BUILD_REPO
ARG BUILD_REPO_REF
ARG SPACK_REPO
ARG SPACK_REPO_REF

# Setup spack
# these instructions are from one of the current non-runner ecpe4s dockerhub images
# which spack version to use? the example from non-runner image uses v0.13.3 (2019-12)
# Example from Tom uses similar (0.13.2-7599-g985e101507)
# latest is v0.16.2 (2021-05)
RUN git clone ${SPACK_REPO} --single-branch --depth=1 --branch ${SPACK_REPO_REF} && \
    echo ". /spack/share/spack/setup-env.sh" >> /etc/bashrc
    # Not sure these Spack init steps are needed so leaving commented for now
    # Initialize spack for this shell
    #. /spack/share/spack/setup-env.sh && \
    # Search for installed compilers
    # should find find gcc@11.2.0  gcc@8.4.1
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
