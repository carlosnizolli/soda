#!/bin/sh
PREV_2_MONTH=`date --date='-2 month' +'%B'`
PREV_3_MONTH=`date --date='-3 month' +'%B'`
PREV_4_MONTH=`date --date='-4 month' +'%B'`

soda scan -v data_source=$1 -d $1 -c $2 -v PREV_2_MONTH=$PREV_2_MONTH -v PREV_3_MONTH=$PREV_3_MONTH -v PREV_4_MONTH=$PREV_4_MONTH $3

