#!/bin/bash

TIMESTAMP=`date +%s`
DATE=`date`
TEXT="project: $HOST\nref: $CI_COMMIT_REF_NAME\nsha: $CI_COMMIT_SHA\ntimestamp: $TIMESTAMP\ndate: $DATE"
echo -e $TEXT