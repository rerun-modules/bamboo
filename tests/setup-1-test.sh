#!/usr/bin/env roundup
#
# This file contains the test plan for the `setup` command.
#    
#/ usage:  rerun stubbs:test -m bamboo -p setup [--answers <>]
#

# Helpers
#
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------

describe "setup"

SERVERID=B0TP-0X4V-D61A-1R2D

LICENSE='AAABFA0ODAoPeNptkM1OwzAQhO9+CktccWUbQqGSD23sQ6T8KQmIAxfXLNRS40R2EtG3J22pEBXS7 mE9mm/We9PsRizBYL7EjK0itqIRjusGc8o4khCMt/1gOyc2ut12HVZuAN97G+BthdWk96M+yigf2 y344uM5gA+CRyj2cFKkHkAcaWQu/oh+PWLwI6DtibvQZrATnJ8ybecUp50B9dVbf7gw7ghlhC8vn tQacAHUuz3hVN6oqqySWqHCf2pnwzlGNgWuu/14HMItTpxZoBr8BD6RYkObktDX+xciH9iasIpLV KtczE1Szhhl0dNVXnPoIdctiLjIMlXFyTpFP9IMTBP5x3tZ8t+PlKM3Ox3g+kjfPLaBIDAsAhQEI Y2bIBLrWyZ2AB/cvUq7hqC3nQIUGs2RS6TpsoWUDMoMdozmuAXv8lA=X02e2'

it_can_setup_bamboo() {

   umask 002


   rerun bamboo:stop
   rerun bamboo:addLicenseConfig --serverId "${SERVERID}" --license "${LICENSE}"
   rerun bamboo:start
   rerun bamboo:status
   rerun bamboo:setup
   rerun bamboo:stop
}
