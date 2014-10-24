#!/usr/bin/env bash

#!/bin/bash
if [ "$1" == "" ]; then
  branch=HEAD
else
  branch=$1
fi

git log $branch --decorate --oneline --graph
