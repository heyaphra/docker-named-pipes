#!/bin/bash

HOST_PIPE_PATH = "~/repos/docker-named-pipes/host-pipe/cmd-runner"
OUTPUT_PATH = "~/repos/docker-named-pipes/host-pipe/output.txt"

while true; do eval "$(cat $HOST_PIPE_PATH)" &>$OUTPUT_PATH; done
