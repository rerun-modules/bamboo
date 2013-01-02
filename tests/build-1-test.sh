#!/usr/bin/env roundup
#
# This file contains the test plan for the `build` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p build [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "build"


it_can_build_the_bamboo_example() {
   buildTmp="$(mktemp -d)"

   buildBamboo "${buildTmp}" 4.3.3

   rm -rf ${buildTmp}
}
