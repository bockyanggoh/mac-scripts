#!/usr/bin/env bash

echo "Reminder of script usage: ./gclear.sh \"commit_msg_goes_here\""
if [[ -z "$1" ]]; then
	msg="placeholder message for the lazy"
else
	msg="$1"
fi

git rm -r --cached .
git add .
git commit -m "${msg}"

if [[ -z "$1" ]]; then
	git push
else
	echo "not pushing commit to remote"
fi

