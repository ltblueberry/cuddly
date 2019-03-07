#!/bin/bash
echo "Testing ""$TRAVIS_BRANCH"" branch"

# Check 'master' branch
if [ "$TRAVIS_BRANCH" == "master" ]; then
	echo "We don't have tests for master branch"
	exit 0
fi

# Check 'play-travis' branch
if [ "$TRAVIS_BRANCH" == "play-travis" ]; then
	cd play-travis
	echo "Run python test.py in play-travis directory"
	python test.py
fi
