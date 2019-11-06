#!/bin/bash

~/k/bin/krun -d $1 $2 --state-log --state-log-path $3 --state-log-events OPEN,NODE,CLOSE \
        --no-alpha-renaming --restore-original-names --no-sort-collections --output json \
        --output-flatten "_Map_"
