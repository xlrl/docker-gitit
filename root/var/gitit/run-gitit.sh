#/bin/sh
set -e
chown -R gitit:gitit /gitit
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
# for whatever reason haskell doesn't like the locale
export LANG=C.UTF-8
cd /gitit
su gitit -c "gitit -p 4000"
