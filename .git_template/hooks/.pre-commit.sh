#!/bin/sh
# from http://stackoverflow.com/questions/591923/make-git-automatically-remove-trailing-whitespace-before-committing
if git-rev-parse --verify HEAD > /dev/null 2>&1; then
  against=HEAD
else
  # Initial commit: diff against an empty tree object
  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Find files with trailing whitespace
for FILE in `exec git diff-index --check --cached $against -- | sed '/^[+-]/d' | cut -f1 -d: | uniq`; do
  # Fix them!
  sed -i.$now 's/[[:space:]]*$//' "$FILE"
  rm "$FILE.$now"
done

exit
