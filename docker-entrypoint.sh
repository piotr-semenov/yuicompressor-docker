#!/bin/sh

set -e

java -jar /var/opt/yuicompressor.jar "$@"
