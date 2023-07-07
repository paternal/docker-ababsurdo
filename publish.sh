#!/bin/bash

set -e

cd $(dirname $0)

sudo docker build -t paternal/ababsurdo .
sudo docker push paternal/ababsurdo
