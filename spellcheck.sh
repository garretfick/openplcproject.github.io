#!/bin/bash

aspell --lang=en create master ./aspell-dict.rws < ./aspell-dict.txt

NUMBAD=0
FILES=($(find ./_site/ -type f -name "*.html"))
for FNAME in ${FILES[*]}
do
    OUTPUT=$(cat ${FNAME} | aspell list -H --html-skip=script --add-html-skip=style --add-html-skip=pre --add-html-skip=code --extra-dicts=./aspell-dict.rws | sed '/^$/d')
    
    if [ -n "${OUTPUT}" ]
    then
          echo "${FNAME} is not good"
          echo ${OUTPUT}
          NUMBAD=$((NUMBAD+1))
    fi
done

echo "${NUMBAD} files have spelling errors"
exit ${NUMBAD}
