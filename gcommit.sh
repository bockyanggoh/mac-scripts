#!/usr/bin/env bash
BRANCH_NAME=$(git symbolic-ref --short head)
COMMIT_MSG="$1"

if [ $# -eq 0 ]; then
    echo "Please provide commit message. Eg. gcommit \"testing stuff\""
    exit 1
fi
if git add .; then
    if git commit -m "$COMMIT_MSG"; then
        git push remote $BRANCH_NAME
    fi
fi