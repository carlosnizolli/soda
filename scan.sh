#!/bin/sh
export dataset=$1
soda scan -d $1 -c $2 -v DAYS=$3 $4
