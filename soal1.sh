#!/bin/bash

i=1
for eachfile in ./nature/*.jpg
do
  base64 -d $eachfile | xxd -r > $i.jpg
  i=$((i+1))
done
