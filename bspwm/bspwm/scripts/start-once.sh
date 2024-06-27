#!/usr/bin/env bash

pgrep -x "$1" > /dev/null || "$@"
