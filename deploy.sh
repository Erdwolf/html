#!/bin/bash
export FILE="$1"
export REPO_URL="$2"
export BRANCH="gh-pages"

mkdir deploy
cd deploy
git init
git remote add origin $REPO_URL
git checkout --orphan $BRANCH
git pull origin $BRANCH || true

mv "../$FILE" ./
git add "$FILE"

git commit -m "deployed"
git push origin $BRANCH
