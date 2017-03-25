#!/usr/bin/env bash

IGNORE_FILES=(.git .DS_Store .osx bootstrap.sh apply-settings.fish ps-dev.sh ruby.sh test.sh Gemfile Gemfile.lock README.md LICENSE-MIT.txt)
EXCLUDE_FILES=$(printf " --exclude %s" "${IGNORE_FILES[@]}")
IGNORE_FILES_REGEX_TMP=$(printf "|%s" "${IGNORE_FILES[@]}")
IGNORE_FILES_REGEX=${IGNORE_FILES_REGEX_TMP:1} # remove leading '|'

echo $IGNORE_FILES_REGEX

# filenames=`find . -name '*' -type f | egrep -v ${IGNORE_FILES_REGEX}`
#
# # rsync --exclude ".git/" --exclude ".DS_Store" --exclude ".osx" --exclude "bootstrap.sh" --exclude "apply-settings.fish" --exclude "ps-dev.sh" --exclude "ruby.sh" --exclude "Gemfile.lock"  --exclude "README.md" --exclude "LICENSE-MIT.txt"
#
# for filename in $filenames; do
#   if ! cmp -s $filename ${filename/./~}
#   then
#     echo $filename
#     echo "The files are different"
#   fi
#
#   # echo "diff $filename ${filename/./~}"
#   # diff $filename ${filename/./~}
#
# done
