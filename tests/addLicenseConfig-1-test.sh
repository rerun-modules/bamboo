#!/usr/bin/env roundup
#
# This file contains the test plan for the `addLicenseConfig` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p addLicenseConfig [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

#BAMBOO_{HOME,ROOT,INSTALL}

describe "addLicenseConfig"


SERVERID=B0TP-0X4V-D61A-1R2D

LICENSE='AAABFA0ODAoPeNptkM1OwzAQhO9+CktccWUbQqGSD23sQ6T8KQmIAxfXLNRS40R2EtG3J22pEBXS7 mE9mm/We9PsRizBYL7EjK0itqIRjusGc8o4khCMt/1gOyc2ut12HVZuAN97G+BthdWk96M+yigf2 y344uM5gA+CRyj2cFKkHkAcaWQu/oh+PWLwI6DtibvQZrATnJ8ybecUp50B9dVbf7gw7ghlhC8vn tQacAHUuz3hVN6oqqySWqHCf2pnwzlGNgWuu/14HMItTpxZoBr8BD6RYkObktDX+xciH9iasIpLV KtczE1Szhhl0dNVXnPoIdctiLjIMlXFyTpFP9IMTBP5x3tZ8t+PlKM3Ox3g+kjfPLaBIDAsAhQEI Y2bIBLrWyZ2AB/cvUq7hqC3nQIUGs2RS6TpsoWUDMoMdozmuAXv8lA=X02e2'


it_can_license_bamboo() {

   umask 002

   rerun bamboo:stop
   rerun bamboo:remove --cleanup true

   buildTmp="$(mktemp -d)"

   buildBamboo "${buildTmp}" 4.3.3

   rerun bamboo:install --bamboo-package-file ${buildTmp}"/atlassian-bamboo/RPMS/noarch/atlassian-bamboo-4.3.3-1.noarch.rpm"
   rerun bamboo:addLicenseConfig --serverId "${SERVERID}" --license "${LICENSE}"
   rerun bamboo:start
   rerun bamboo:status
   rerun bamboo:setup
   rerun bamboo:stop
 
   rm -rf "${buildTmp}"
}
