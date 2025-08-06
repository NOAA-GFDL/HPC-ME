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
#export CYLC_CONF_PATH=/mnt

### WHAT IS NEEDED ON THE CLOUD VS NOT for conda set-up
# Initializations for conda environment in container
conda init --all
source /opt/conda/etc/profile.d/conda.sh
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

    name=${expname}__${plat}__${targ}
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
        echo "   Removing ${name}... "
        cylc clean ${name}
    fi

    ## Checkout
    case ${hostname} in
        *"pclusternoaa"*)
            echo -e "\nCopying fre-workflows directory in ${HOME}/cylc-src/${name} ...... "
            mkdir -p /mnt/cylc-src/${name}
            cp -r ./* /mnt/cylc-src/${name}
            ;;
        *)
            echo -e "\nRunning fre pp checkout to create ${HOME}/cylc-src/${name} ...... "
            exit 0
            fre -v pp checkout -e ${expname} -p ${plat} -t ${targ}
            ;; 
    esac

    #Not sure if needed because if no global.cylc found, cylc uses default, which utilizes background jobs anyway ...
    #export CYLC_CONF_PATH=/mnt/cylc-src/${name}/generic-global-config/
    
    ## Configure the rose-suite and rose-app files for the workflow
    echo -e "\nRunning fre pp configure-yaml to configure the rose-suite and rose-app files ..."
    fre -v pp configure-yaml -e ${expname} -p ${plat} -t ${targ} -y ${yamlfile}

    ## Validate the configuration files
    echo -e "\nRunning fre pp validate to validate rose-suite and rose-app configuration files for workflow ... "
    fre -v pp validate -e ${expname} -p ${plat} -t ${targ} || echo "validate, no kill"

    # Install
    echo -e "\nRunning fre pp install to instal the workflow in ${HOME}/cylc-run/${name} ... "
    fre -v pp install -e ${expname} -p ${plat} -t ${targ}

    ## RUN
    echo -e "\nRunning the workflow with cylc play ... "
    cylc play --no-detach --debug ${name}
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
