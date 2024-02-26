#!/bin/bash

export TMPDIR=/mnt/temp HOME=/mnt CYLC_CONF_PATH=/mnt

#Setup
conda config --add envs_dirs /opt/conda
conda init --all
source /opt/conda/etc/profile.d/conda.sh
source ~/.bashrc
conda deactivate
conda activate /opt/conda/cylc-flow-tools

#Running Experiment
cd /mnt2
bin/list-exps
echo Please Enter Experiment Name:
read -r expname
cylc stop --now $expname/run*
cylc clean $expname
rose macro --validate
bin/install-exp $expname
cylc play -v --no-detach $expname
