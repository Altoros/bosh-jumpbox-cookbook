#!/usr/local/bin/dumb-init /bin/bash

pushd cookbook > /dev/null
  git config user.email "${GIT_EMAIL}"
  git config user.name "${GIT_USERNAME}"

  git remote add -f cookbook-develop ../cookbook-develop
  git merge --no-edit "cookbook-develop/${MERGED_REPO}"

  git status
  git show --color | cat
popd > /dev/null

shopt -s dotglob

cp -R cookbook/* cookbook-to-master
