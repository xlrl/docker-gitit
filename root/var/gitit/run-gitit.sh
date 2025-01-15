#/bin/sh
set -e

cd /gitit

git config --global init.defaultBranch main

echo -n Initialize git repository...
if test -d .git ; then
    echo Skipped
else
    git init
    echo Done
fi

echo -n Create default configuration...
pwd
ls -al
if test -f conf/gitit.conf ; then
    echo Skipped
else
    gitit --print-default-config > conf/gitit.conf
    echo Done
fi

gitit --port=4000 --config-file=conf/gitit.conf
