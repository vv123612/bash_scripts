#!/bin/bash

git init
for (( i=1; i<=9; i++ ))
do  
  echo "$i" >> f.txt
  git add .
  git commit -m "$i"

  #git branch "b$i"

done