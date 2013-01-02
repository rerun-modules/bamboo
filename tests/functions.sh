# 
# Test functions for command tests.
#

# - - -
# Your functions declared here.
# - - -


buildBamboo() {
   directory=$1
   version=$2

   buildTmp="${directory}"
   cp -r $RERUN_MODULES/bamboo/examples/build/atlassian-bamboo "${buildTmp}"
   rerun bamboo:build --version ${version} --directory "${buildTmp}/atlassian-bamboo"
   # check the package:
   rpm -qi -p "${buildTmp}/atlassian-bamboo/RPMS/noarch/atlassian-bamboo-${version}-1.noarch.rpm"
}
