#FROM centos:7
#FROM continuumio/anaconda3
FROM condaforge/mambaforge:latest
COPY ./test1.yml .
#RUN mamba init
#RUN mamba deactivate
#RUN mamba remove --all
RUN mkdir opt/conda/env
RUN mamba env create --file ./test1.yml -p opt/conda/env 
#%post
#RUN mamba install python netcdf-cxx4 globus-cli nco cdo nccmp vim perl
#RUN mamba install curl

#RUN export PERLBREW_ROOT=/opt/perlbrew && curl -L http://install.perlbrew.pl | bash
#RUN source /opt/perlbrew/etc/bashrc && perlbrew install perl-5.34.0
#RUN source /opt/perlbrew/etc/bashrc && perlbrew use perl-5.34.0 && perlbrew install-cpanm
#RUN source /opt/perlbrew/etc/bashrc && perlbrew switch perl-5.34.0
#ENV PATH /opt/perlbrew/bin/:/opt/perlbrew/perls/perl-5.34.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
