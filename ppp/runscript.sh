#!/bin/bash

## TO-DO: 
##    - automate rebuilding container when there is an update in fre-cli
##    - checks for the status of the workflow (before installation step)

# Initialize ppp-setup
# Set environment variables 
export TMPDIR=/mnt/temp
export HOME=/mnt
export CYLC_CONF_PATH=/mnt
###Not sure is this is needed 
export HDF5_USE_FILE_LOCKING=FALSE

### WHAT IS NEEDED ON THE CLOUD VS NOT for conda set-up
# Initializations for conda environment in container
conda config --add envs_dirs /opt/conda
conda init --all
source /opt/conda/etc/profile.d/conda.sh
source ~/.bashrc
conda deactivate
conda activate /opt/conda/cylc-flow-tools

function get_user_input {
    # User input
    echo Please Enter Experiment Name:
    read -r expname

    echo Please Enter Platform:
    read -r plat

    echo Please Enter Target:
    read -r targ

    echo Please Enter Path to model yaml file:
    read -r yamlfile
}

function create_dirs {
    # Create necessary paths used in workflow
    paths=("/mnt/pp" "/mnt/ptmp" "/mnt/temp")

    for p in ${paths[@]}; do
        if [ -d $p ]; then
            echo -e "Path $p previously created. Removing..."
            rm -rf $p
            echo -e "   Creating new $p\n"
            mkdir -p $p
        else
            mkdir -p $p
        fi
    done
}

function fre_pp_steps {
###### FRE-CLI STEPS ######
    ## Checkout
    echo -e "\nCreating $name directory in ${HOME}/cylc-src/${name} ...... "

    cylcsrcdir="/mnt/cylc-src"
    if [ -d  $cylcsrcdir ]; then
        echo "CYLC-SRC directory exists. Removing"
        rm -rf $cylcsrcdir/${name}
        mkdir -p $cylcsrcdir/${name}
        fre pp checkout -e ${expname} -p ${plat} -t ${targ}
    else
        fre pp checkout -e ${expname} -p ${plat} -t ${targ}
    fi

    ## Configure the rose-suite and rose-app files for the workflow
    echo -e "\nConfiguring the rose-suite and rose-app files ..."
    fre pp configure-yaml -e ${expname} -p ${plat} -t ${targ} -y ${yamlfile}

    ## Validate the configuration files
    echo -e "\nValidating rose-suite and rose-app configuration files for workflow ... "
    fre pp validate -e ${expname} -p ${plat} -t ${targ} || echo "validate, no kill"

    # Install
    # experiment cleaned if previously installed
    if [ -d /mnt/cylc-run/${name} ]; then
        echo -e "\n${name} previously installed"
        echo "   Removing ${name}... "
        cylc clean ${name}
    fi

    echo -e "\nInstalling the workflow in ${HOME}/cylc-run/${name} ... "
    fre pp install -e ${expname} -p ${plat} -t ${targ}

    ## RUN
    read -p "Would you like to see a verbose post-processing output? (y/n) (Default behavior is no):  " yn
    echo -e "\nRunning the workflow ... "

    case $yn in
        [Yy] ) cylc play --no-detach --debug ${name}
        ;;

        [Nn] ) fre pp run -e ${expname} -p ${plat} -t ${targ}
        ;;

        * ) fre pp run -e ${expname} -p ${plat} -t ${targ}
        ;;
    esac
}

function main {
    # Run set-up and fre-cli post-processing steps

    # Set user-input
    get_user_input

    # Define name
    name="$expname"__"$plat"__"$targ"

    #Create directories needed for post-processing
    create_dirs

    # Run the post-processing steps
    fre_pp_steps
}

# Run main function
main
