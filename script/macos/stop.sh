#!/bin/sh
ps aux | grep "redis" | grep -v grep | cut -c 9-15 | xargs kill -9
