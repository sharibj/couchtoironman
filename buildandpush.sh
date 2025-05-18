#!/bin/bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa || { echo "SSH add failed"; exit 1; }

git pull || { echo "Git pull failed"; exit 1; }
echo "Git pull succeeded"

node utils/build.js || { echo "Build failed"; exit 1; }
echo "Build succeeded"

git add . && git commit -m "Autocommit" || { echo "Git commit failed"; exit 1; }
echo "Git commit succeeded"

git push || { echo "Push failed"; exit 1; }
echo "Push succeeded"