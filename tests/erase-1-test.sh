#!/usr/bin/env roundup
#
# This file contains the test plan for the `erase` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p erase [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "erase"


it_will_not_test_erase() {
    exit 0
}
