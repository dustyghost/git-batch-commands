git branch | grep -v 'master' | grep -v '*' | awk '{ print $1; }' | xargs -r git branch -d
