#!/bin/bash
if [[ -z "$1" || $# -gt 1 ]]
then
    echo "please use 1 param"
    exit 1
fi
if [[ ${DIRECTORY: - 1} != "/" ]]
then
  echo "Wrong path! Missing sign in the end \"/\"."
  exit 1
fi
# check existence of a directory
if [[ ! -d "$1" ]]
then
  echo "No such directory!"
  exit 1
fi
