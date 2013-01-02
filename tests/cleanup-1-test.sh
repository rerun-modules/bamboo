#!/usr/bin/env roundup
#
# This file contains the test plan for the `cleanup` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p cleanup [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "cleanup"


it_will_not_test_cleanup() {
    exit 0
}
