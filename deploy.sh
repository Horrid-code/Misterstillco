#!/bin/bash
set -e

PROJECT_DIR="$HOME/portfolio"
SOURCE_BRANCH="main"
PAGES_BRANCH="gh-pages"
REMOTE_URL="git@github.com:Horrid-code/Misterstillco.git"

cd "$PROJECT_DIR"

# 1. Pull latest source changes (from your iPad edits)
git checkout "$SOURCE_BRANCH"
git pull origin "$SOURCE_BRANCH"

# 2. Build the site
bundle install
bundle exec jekyll build

# 3. Push compiled static files to GitHub Pages
cd _site
git init
git checkout -b "$PAGES_BRANCH"
git add -A
git commit -m "Automated build from Linux server: $(date -u)"
git remote add origin "$REMOTE_URL"
git push -f origin "$PAGES_BRANCH"

cd ..
rm -rf _site/.git

echo "Portfolio successfully deployed to GitHub Pages!"
