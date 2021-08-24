FROM ecpe4s/rhel8-runner-x86_64:2021-07-01

COPY spack.yaml /

RUN git clone https://github.com/spack/spack /opt/spack \
 && (cd /opt/spack && git checkout 985e101507560c52aa060cdb8d5ef838fbe9cea7) \
 && rm -rf /opt/spack/.git

RUN . /opt/spack/share/spack/setup-env.sh \
 && spack mirror add e4s https://cache.e4s.io \
 && spack buildcache keys -it \
 && spack -e . concretize -f | tee dag \
 && spack -e . install --cache-only \
 && spack clean -a \
 && rm -rf /tmp/root

RUN echo . /opt/spack/share/spack/setup-env.sh >> /etc/bash.bashrc \
 && echo spack load nalu-wind >> /etc/bash.bashrc \
 && echo spack load amr-wind >> /etc/bash.bashrc \
 && echo spack load tau >> /etc/bash.bashrc
