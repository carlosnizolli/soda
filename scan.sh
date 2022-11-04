#!/bin/sh
export dataset=$1
export POSTGRES_USERNAME=env_var(POSTGRES_USERNAME)
export POSTGRES_PASSWORD=env_var(POSTGRES_PASSWORD)
export SODA_API_PUBLIC=env_var(SODA_API_PUBLIC)
export SODA_API_PRIVATE=env_var(SODA_API_PRIVATE)
soda scan -d $1 -c $2 -v DAYS=$3 $4
