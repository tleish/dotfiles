#!/usr/bin/env bash

IGNORE_FILES=(.git .DS_Store .osx bootstrap.sh apply-settings.fish ps-dev.sh ruby.sh test.sh Brewfile Gemfile Gemfile.lock README.md LICENSE-MIT.txt)

# exclude variables
RSYNC_EXCLUDE_FILES=$(printf " --exclude %s" "${IGNORE_FILES[@]}")

# check prerequisites

which brew &> /dev/null
if [[ $? -ne 0 ]]; then
  printf "\nError: Homebrew not installed\n\n"
  exit 1
fi

# fix working dir
cd "$(dirname "${BASH_SOURCE}")"

if [ "$2" != "--no-pull" -a "$2" != "-n" ]; then
  printf "\n# Pulling latest changes...\n"
  git pull
  if [[ $? -ne 0 ]]; then
    printf "\nWarning: git failed pulling the latest version (see details above).\n\n"
  fi
fi

printf "# Syncing to home folder...\n"
function dryRunSync() {
	rsync $RSYNC_EXCLUDE_FILES -ahi --dry-run --no-perms  --out-format=' > %f' . ~
}
function doSync() {
	rsync $RSYNC_EXCLUDE_FILES -avh --no-perms . ~;
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doSync
elif [[ $(dryRunSync) ]] ; then
	echo "This may overwrite existing files in your home directory."
	echo $(dryRunSync)
	echo
	read -p "Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doSync
  else
    printf "Aborted.\n\n"
    exit 0
	fi
else
	echo "No file changes."
fi
unset dryRunSync
unset doSync

printf "\n# Checking for fish... "
brew ls fish &> /dev/null
if [[ $? -ne 0 ]]; then
  printf "not found, installing...\n\n"
  brew update
  if [[ $? -ne 0 ]]; then
    printf "\nError: Homebrew update failed. Aborting.\n\n"
    exit 1
  fi
  brew install fish
  if [[ $? -ne 0 ]]; then
    printf "\nError: fish installation failed. Aborting.\n\n"
    exit 1
  fi
  printf "\nSee instructions above for making fish the default shell.\n"
else
  printf "ok.\n\n"
fi

printf "# Setting up/refreshing fish settings (i.e. universal variables)... "
fish apply-settings.fish
if [[ $? -ne 0 ]]; then
  printf "\nError: applying fish settings failed.\n\n"
  exit 1
else
  printf "done.\n\n"
fi

printf "# Checking for brew updates... "
# update brew libraries
brew update
# report if any brew updates needed
brew outdated
printf "\n\n"

printf "# Ruby Gem updates...\n"
# update ruby gems
bundle update
printf "\n\n"

# reload fish with updated config
exec fish
