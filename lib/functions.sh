# Shell functions for the bamboo module.
#/ usage: source RERUN_MODULE_DIR/lib/functions.sh command
#

# Read rerun's public functions
. $RERUN || {
    echo >&2 "ERROR: Failed sourcing rerun function library: \"$RERUN\""
    return 1
}

# Check usage. Argument should be command name.
[[ $# = 1 ]] || rerun_option_usage

# Source the option parser script.
#
if [[ -r $RERUN_MODULE_DIR/commands/$1/options.sh ]] 
then
    . $RERUN_MODULE_DIR/commands/$1/options.sh || {
        rerun_die "Failed loading options parser."
    }
fi

# - - -
# Your functions declared here.
# - - -

export BAMBOO_URL=http://localhost:8085
export BAMBOO_ROOT=/usr/share/atlassian-bamboo
export BAMBOO_HOME=/usr/share/atlassian-bamboo/bamboo-home

if [ -f ${RERUN_MODULE_DIR}/options/version/metadata ]
then
   installDir="${BAMBOO_ROOT}/atlassian-bamboo-$(grep ^DEFAULT= ${RERUN_MODULE_DIR}/options/version/metadata  |cut -d'=' -f2)"
   if [ -d ${installDir}  ]
   then
      export BAMBOO_INSTALL="${installDir}"
   fi
fi

export BAMBOO_LOG=${BAMBOO_INSTALL}/logs/bamboo.log
