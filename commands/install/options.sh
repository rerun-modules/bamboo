# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Wed Dec 26 17:36:01 PST 2012
#
#/ usage: bamboo:install  --bamboo-package-file <> 

# _rerun_options_parse_ - Parse the command arguments and set option variables.
#
#     rerun_options_parse "$@"
#
# Arguments:
#
# * the command options and their arguments
#
# Notes:
# 
# * Sets shell variables for any parsed options.
# * The "-?" help argument prints command usage and will exit 2.
# * Return 0 for successful option parse.
#
rerun_options_parse() {
    
    while [ "$#" -gt 0 ]; do
        OPT="$1"
        case "$OPT" in
            --bamboo-package-file) rerun_option_check $# ; BAMBOO_PACKAGE_FILE=$2 ; shift ;;
            # help option
            -?)
                rerun_option_usage
                exit 2
                ;;
            # end of options, just arguments left
            *)
              break
        esac
        shift
    done

    # Set defaultable options.

    # Check required options are set
    [ -z "$BAMBOO_PACKAGE_FILE" ] && { echo >&2 "missing required option: --bamboo-package-file" ; return 2 ; }
    # If option variables are declared exportable, export them.

    #
    return 0
}


# Initialize the options variables to null.
BAMBOO_PACKAGE_FILE=


