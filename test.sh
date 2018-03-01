#!/bin/bash
#
#  author: Aysad Kozanoglu
#
#
docker build -t nginx-multi-php .
docker run -p 8881:8881 -p 8891:8891 --rm -P nginx-multi-php
