#!/bin/bash

# stops script if a command fails
set -e 

## TO-DO: 
##    - automate rebuilding container when there is an update in fre-cli
##    - checks for the status of the workflow (before installation step)

# Initialize ppp-setup
# Set environment variables 
export TMPDIR=/mnt/temp
export HOME=/mnt

#Not sure if needed
#export CYLC_CONF_PATH=/mnt

### WHAT IS NEEDED ON THE CLOUD VS NOT for conda set-up
# Initializations for conda environment in container
conda config --add envs_dirs /opt/conda
conda init --all
source /opt/conda/etc/profile.d/conda.sh
#source ~/.bashrc  #not sure if needed
conda deactivate
conda activate /app/cylc-flow-tools

get_user_input () {
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

create_dirs () {
    # Create necessary paths used in workflow
    paths=("${HOME}/pp" "${HOME}/ptmp" "${HOME}/temp")

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

fre_pp_steps () {
###### FRE-CLI STEPS ######
    # experiment cleaned if previously installed
    if [ -d /mnt/cylc-run/${name} ]; then
        echo -e "\n${name} previously installed"
        echo "   Stopping and removing ${name}... "
        cylc stop --now --now $name
        sleep 5
        cylc clean ${name}
    fi

    ## Checkout
    echo -e "\nCreating $name directory in ${HOME}/cylc-src/${name} ...... "

    ##checkout creates cylc-src if it doesn't exist in HOME 
    fre pp checkout -e ${expname} -p ${plat} -t ${targ}

    ## Configure the rose-suite and rose-app files for the workflow
    echo -e "\nConfiguring the rose-suite and rose-app files ..."
    fre pp configure-yaml -e ${expname} -p ${plat} -t ${targ} -y ${yamlfile}

    ## Validate the configuration files
    echo -e "\nValidating rose-suite and rose-app configuration files for workflow ... "
    fre pp validate -e ${expname} -p ${plat} -t ${targ} || echo "validate, no kill"

    # Install
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

main () {
    # Run set-up and fre-cli post-processing steps #

    # Set user-input
    get_user_input
    #Create directories needed for post-processing
    create_dirs

    # Run the post-processing steps
    fre_pp_steps
}

# Run main function
main
