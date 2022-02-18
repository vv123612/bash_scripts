#!/bin/bash


function create_branch() {
  
  local commits_count=$1
  local branch_name=$2

  git checkout $branch_name
  git branch 

  for (( i=1; i<=$commits_count; i++ ))
  do  
    message="${branch_name}_${i}"
    echo $message
    echo $message >> f.txt
    git add .
    git commit -m "$message"

done  
}


GIT_DIR=".git"
if [ -d "$GIT_DIR" ]; 
    then rm -Rf $GIT_DIR; 
fi


git init
echo "0" > f.txt
git add .
git commit -m "Init"

#create branches
# git branch 
git checkout -b n
git checkout -b k
git checkout -b master

#create commits
create_branch 3 n
create_branch 3 k
create_branch 3 master