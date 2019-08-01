#!/bin/bash
#
# Description: Set install-product pipeline in Concourse and apply operations
# Written by: Amlan Datta - adatta@pivotal.io
#
# -e          - fail on errors
# -u          - ensure all variables are set
# -o pipeline - catch pipeed command failures
# -x          - verbose when `export DEBUG=true` is set on shell

# set -eu
# set -o pipefail
# # [[ -z "${DEBUG:-""}" ]] || set -x

# Check that product name has been specificed

PRODS_TEXT="[metrics/healthwatch/redis/pas]"
USAGE_TEXT="Usage: ./fly-install-product.sh [dev|prod] $PRODS_TEXT"

if [ -z $1 ]; then
  echo "Please input target Name"
  exit 1
fi

if [ -z $2 ]; then
  echo "Please input Iaas Name [dev|prod]"
  echo $USAGE_TEXT
  exit 1
fi

if [ -z $3 ]; then
  echo "Please input product name $PRODS_TEXT"
  echo $USAGE_TEXT
  exit 1
fi

fly -t $1 sp -c pipelines/install-product.yml \
  -p install-$3 \
  -v foundation=$2 \
  -v product-name=$3
