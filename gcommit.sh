#!/usr/bin/env bash
BRANCH_NAME=$(git symbolic-ref --short head)
COMMIT_MSG="$1"

if [ $# -eq 0 ]; then
    echo "Please provide commit message. Eg. gcommit \"testing stuff\""
    exit 1
fi
git add .
git commit -m "$COMMIT_MSG"

git push
RETURN_CODE=$?

if ! test "$RETURN_CODE" -eq 0
then
    git push --set-upstream origin "$BRANCH_NAME"
fi

