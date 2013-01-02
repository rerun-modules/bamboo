#!/usr/bin/env roundup
#
# This file contains the test plan for the `status` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p status [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "status"


it_can_obtain_bamboo_status() {
   rerun bamboo:stop 
   rerun bamboo:start
   rerun bamboo:status
   rerun bamboo:stop
   rerun bamboo:status || return 0
}
