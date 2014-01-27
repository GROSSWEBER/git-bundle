#!/bin/sh

bundle=../partial-not-applicable

echo "Removing old branches from previous demo"
git for-each-ref refs/heads |
  cut -d / -f 3- |
  env GREP_OPTIONS='' grep -v @ |
  while read branch_name; do
    if [ "$branch_name" == "master" ]; then
      continue
    fi
    git branch -D $branch_name >/dev/null 2>&1
  done

echo -e "\nMaking sure base commit is unreachable"
git reflog expire --expire=now >/dev/null 2>&1
git gc --prune=now >/dev/null 2>&1

echo -e "\nVerifying bundle $bundle"
git bundle verify $bundle

echo -e "\nCreating partial-not-applicable/master from master in $bundle"
git fetch $bundle master:partial-not-applicable/master
