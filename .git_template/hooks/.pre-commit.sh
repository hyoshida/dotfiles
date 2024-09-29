#!/bin/sh
# from http://stackoverflow.com/questions/591923/make-git-automatically-remove-trailing-whitespace-before-committing
if git rev-parse --verify HEAD > /dev/null 2>&1; then
  against=HEAD
else
  # Initial commit: diff against an empty tree object
  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Change the file permissions (only Windows)
case "$OSTYPE" in
  *cygwin*)
    files=`git diff --cached --name-only | xargs -d "\n" -r ls 2>/dev/null`
    if [ "$files" != "" ]; then
      echo "$files" | xargs -d "\n" chmod -x
      echo "$files" | xargs -d "\n" git update-index --chmod=-x
    fi
    ;;
esac

exit
