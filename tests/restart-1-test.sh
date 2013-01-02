#!/usr/bin/env roundup
#
# This file contains the test plan for the `restart` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p restart [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "restart"

it_can_restart_bamboo() {
   rerun bamboo:start
   rerun bamboo:restart
   rerun bamboo:status
   rerun bamboo:stop
   rerun bamboo:status || return 0
}
