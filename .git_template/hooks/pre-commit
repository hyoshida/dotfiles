#!/bin/sh
# from http://www.techques.com/question/1-591923/Make-git-automatically-remove-trailing-whitespace-before-committing
esed() {
  if [ "$OSTYPE" = 'darwin' ]; then
    sed -E "$@"
  else
    sed -r "$@"
  fi
}

if git-rev-parse --verify HEAD > /dev/null 2>&1; then
  against=HEAD
else
  # Initial commit: diff against an empty tree object
  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Find files with trailing whitespace
for FILE in `exec git diff-index --check --cached $against -- | sed '/^[+-]/d' | esed 's/:[0-9]+:.*//' | uniq`; do
  # Fix them!
  sed -i.$now 's/[[:space:]]*$//' "$FILE"
  rm "$FILE.$now"
done

exit
