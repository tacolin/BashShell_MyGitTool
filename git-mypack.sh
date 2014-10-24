#!/usr/bin/env bash

# check argument number
if [[ "$#" != 4  ]]; then
  echo "ERROR: arguments are not enough."
  echo ""
  echo "	git mypack [old version] [new version] [target directory] [output filename]"
  echo ""
  exit 1
fi

filename=${4%.*}

rm -f $4
rm -f $filename.txt.zip
rm -f $filename-documents.zip

# generate patch.txt and zip it
git diff $1 $2 $3 > $filename.txt
zip $filename.txt.zip $filename.txt
rm -f $filename.txt

# generate patch code source files and zip them
git archive --format=zip --output=$4 $2 $(git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $1 $2 $3)

# zip the documents
zip $filename-documents.zip -D 5_Documents/*
