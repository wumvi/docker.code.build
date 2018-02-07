#!/bin/bash

TIMESTAMP=`date +%s`
DATE=`date`
TEXT="<?php namespace Site\BuildInfo; class Version { public const REF = '$CI_COMMIT_REF_NAME';\npublic const SHA = '$CI_COMMIT_SHA';\npublic const TIMESTAMP = $TIMESTAMP;\npublic const DATE = '$DATE'\n}\n"
echo -e $TEXT
