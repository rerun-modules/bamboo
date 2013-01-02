#!/usr/bin/env roundup
#
# This file contains the test plan for the `start` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p start [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "start"


it_can_start_bamboo() {
   rerun bamboo:stop
   rerun bamboo:start
   rerun bamboo:status
   rerun bamboo:stop
   rerun bamboo:status || return 0
}

