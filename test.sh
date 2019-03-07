#!/bin/bash

echo "Testing ""$TRAVIS_BRANCH"" branch"

# Check 'master' branch
if [ "$TRAVIS_BRANCH" == "" ]; then
	echo "We don't have tests for master branch"
	exit 0
fi

# Check 'play-travis' branch
if [ "$TRAVIS_BRANCH" == "play-travis" ]; then
	cd play-travis
	echo "Run python test.py in play-travis directory"
	RESULT="$(python test.py)"
	VALID="$("${RESULT}" | grep -o 'failing')"
	if [ "$VALID" != "FAILED" ]; then
    	exit 0
	else
    	exit 1
	fi
fi
