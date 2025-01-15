#!/bin/sh
set -e
export DATA_DIR=/gitit

# for whatever reason haskell doesn't like the locale
export LANG=C.UTF-8

cd $DATA_DIR

if test ! -d conf ; then
    mkdir conf
fi

chown -R gitit:gitit $DATA_DIR

su gitit -c "/var/gitit/run-gitit.sh"
