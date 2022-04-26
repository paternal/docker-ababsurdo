#!/bin/bash

set -e

sudo docker build -t paternal/ababsurdo .
sudo docker push paternal/ababsurdo
