#!/bin/bash

#found this answer here: https://stackoverflow.com/a/39644782/4860233

#Stash everything temporarily.  Keep staged files, discard everything else after stashing.
git stash --keep-index

#Stash everything that remains (only the staged files should remain)  This is the stash we want to keep, so give it a name.
git stash save "$1"

#Apply the original stash to get us back to where we started.
git stash apply stash@{1}

#Create a temporary patch to reverse the originally staged changes and apply it
git stash show -p | git apply -R

#Delete the temporary stash
git stash drop stash@{1}
