#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t cocoa-eh-hugo-theme

curcommit=$(git rev-parse HEAD)

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="Rebuilding website, source commit $curcommit"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg" --allow-empty

# Push source and build repos.
git push origin master

# Come Back
cd ..
