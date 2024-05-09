#!/bin/bash

# Set environemnt variables 
export TMPDIR=/mnt/temp HOME=/mnt CYLC_CONF_PATH=/mnt

# Initializations for environment in container
conda config --add envs_dirs /opt/conda
conda init --all
source /opt/conda/etc/profile.d/conda.sh
source ~/.bashrc
conda deactivate
conda activate /opt/conda/cylc-flow-tools

# Update fre-cli (if new container not built with updated version)
## TO-DO?: automate rebuilding container when there is an updated fre-cli and updated pp repo version
conda update fre-cli

# User input
echo Please Enter Experiment Name:
read -r expname

echo Please Enter Platform:
read -r plat

echo Please Enter Target:
read -r targ

echo Please Enter Path to yaml file:
read -r yamlfile

##### FOR OWN DEBUGGIN PURPOSES #####
# Usually user can input this since it varies per experiment - but for our debugging purposes, define here
#expname='am5_c96L65_amip'
#plat='gfdl.ncrc5-intel22-classic'
#targ='prod-openmp'
#yamlfile="/${HOME}/pp.yaml"
##### FOR OWN DEBUGGIN PURPOSES #####

# Define name of pp run
name=$expname"__"$plat"__"$targ

# Create cylc-src directory (usually done with fre pp checkout - but gitlab has issues in cloud)
cylcsrcdir="/mnt/cylc-src"
if [ -d  $cylcsrcdir ]; then
  echo "Directory exists."
  rm -rf $cylcsrcdir
  mkdir -p $cylcsrcdir/${name}
else
  mkdir - $cylcsrcdir/${name}
fi

# Copy contents of post-processing directory into cylc-src/name
cp -r /mnt2/. $cylcsrcdir/${name}


##### FRE-CLI STEPS #####
## Checkout 
# fre pp checkout -e [exp] -p [plat] -t [targ] 

## SET-UP
#Configure
fre pp configure-yaml -e ${expname} -p ${plat} -t ${targ} -y ${yamlfile}

# Validate
#fre pp validate -e ${expname} -p ${plat} -t ${targ}

# Install
# experiment installed if not previously installed
# if installed - experiments is stopped, cleaned, and installed again
if [ -d /mnt/cylc-run/${name} ]; then
  echo "${name} previously installed"

  # Check if there is a workflow running
  cws=$(fre pp status -e ${expname} -p ${plat} -t ${targ})
  echo $cws

  # running experiment?
  if [ ! -z "${cws}" ] && echo ${cws} | grep -q -e "running" -e "failed" -e "waiting" -e "submitted" ; then 
    cylc stop --now --now ${name}
    echo "${name} STOPPED"
    sleep 5
    cylc clean ${name}
  fi 

else
  echo "\n${name} not installed\n"
fi

# Install
fre pp install -e ${expname} -p ${plat} -t ${targ}

# RUN
fre pp run -e ${expname} -p ${plat} -t ${targ}

# POST CHECK
#fre pp status -e ${expname} -p ${plat} -t ${targ}
