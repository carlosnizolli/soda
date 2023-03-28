#!/bin/sh

soda scan -v data_source=$1 -d $1 -c $2 -v MONTH=$4 -v DATE1=$5 -v DATE2=$6 $3

