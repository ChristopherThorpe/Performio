#!/bin/bash

force=''

if test "x$1" == "x-f"; then
    echo "Forcing reload"
    force="-f"
    shift
fi

# https://karajan-dataset.s3.amazonaws.com/2016-10-21/h5/1213/01.h5
for x in $*; do 
    dir=`dirname $x`
    dir=`basename $dir`
    file=`basename $x`
    mkdir $dir > /dev/null 2>&1 || true
    if test -s $dir/$file -a "x$force" != "x-f"; then
       echo $dir/$file exists
    else
        wget -O $dir/$file $x 
    fi
done
