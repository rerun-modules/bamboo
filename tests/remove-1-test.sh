#!/usr/bin/env roundup
#
# This file contains the test plan for the `remove` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p remove [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "remove"


it_will_not_test_remove() {
    exit 0
}

