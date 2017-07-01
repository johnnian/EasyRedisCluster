#!/bin/sh
kill -9 $(ps -ef|grep redis |awk '$0 !~/grep/ {print $2}' |tr -s '\n' ' ')
