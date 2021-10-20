#!/bin/bash

BUILD_DATE=$(printf '%(%Y-%m-%d)T' -1)
BUILD_TAG=${BUILD_TAG:-${BUILD_DATE}}

# set $REGISTRY to the Docker username/registry to use, otherwise will default to $USER
REGISTRY=${REGISTRY:-$USER}
OUTPUT_IMAGE="${REGISTRY}/rhel8-spack-x86_64:${BUILD_TAG}-gcc11.2_environment-v7"



docker build \
  -t "${OUTPUT_IMAGE}" -f Dockerfile .
