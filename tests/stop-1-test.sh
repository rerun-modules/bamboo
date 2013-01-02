#!/usr/bin/env roundup
#
# This file contains the test plan for the `stop` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p stop [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "stop"


it_can_stop_bamboo() {
   rerun bamboo:stop
   rerun bamboo:start
   rerun bamboo:status
   rerun bamboo:stop
   rerun bamboo:status || return 0
}

