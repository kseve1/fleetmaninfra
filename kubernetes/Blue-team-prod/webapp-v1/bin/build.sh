#!/usr/bin/env bash

for docker in $(find ./ -name Dockerfile); do
  name=$(dirname $docker)
  echo ${name#./}
  (cd $name && docker build -t ${name#./} .)
done
