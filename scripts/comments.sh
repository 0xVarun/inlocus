#!/bin/bash

for files in $(find .. -path ../node_modules -prune -o -name '*.js')
do
    sed -i '/\/\*/,/*\//d' $files
    sed -i -E '/^[[:blank:]]*(\/\/)/d;s/#.*//' $files
done