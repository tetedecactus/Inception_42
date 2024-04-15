#!/bin/bash

docker image prune -f

docker container prune -f

docker image prune -af