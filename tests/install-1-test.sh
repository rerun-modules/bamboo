#!/usr/bin/env roundup
#
# This file contains the test plan for the `install` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p install [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "install"


it_can_install_bamboo() {
   buildTmp=$(mktemp -d)

   buildBamboo "${buildTmp}" 4.3.3

   rerun bamboo:stop
   rerun bamboo:install --bamboo-package-file ${buildTmp}"/atlassian-bamboo/RPMS/noarch/atlassian-bamboo-4.3.3-1.noarch.rpm"
   rm -rf "${buildTmp}"
}
