# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Wed Dec 26 12:24:14 PST 2012
#
#/ usage: bamboo:build [ --package-format <rpm>] [ --package-release <1>] [ --format <tgz>] [ --url <http://wpc.29c4.edgecastcdn.net/8029C4/downloads/software/bamboo/downloads>]  [ --version <4.3.3> ]  --directory <> 

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
            --package-format) rerun_option_check $# ; PACKAGE_FORMAT=$2 ; shift ;;
            --package-release) rerun_option_check $# ; PACKAGE_RELEASE=$2 ; shift ;;
            --format) rerun_option_check $# ; FORMAT=$2 ; shift ;;
            --url) rerun_option_check $# ; URL=$2 ; shift ;;
            --version) rerun_option_check $# ; VERSION=$2 ; shift ;;
            --directory) rerun_option_check $# ; DIRECTORY=$2 ; shift ;;
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
    [ -z "$PACKAGE_FORMAT" ] && PACKAGE_FORMAT="rpm"
    [ -z "$PACKAGE_RELEASE" ] && PACKAGE_RELEASE="1"
    [ -z "$FORMAT" ] && FORMAT="tgz"
    [ -z "$URL" ] && URL="http://wpc.29c4.edgecastcdn.net/8029C4/downloads/software/bamboo/downloads"
    # Check required options are set
    [ -z "$VERSION" ] && VERSION="4.3.3"
    [ -z "$DIRECTORY" ] && { echo >&2 "missing required option: --directory" ; return 2 ; }
    # If option variables are declared exportable, export them.

    #
    return 0
}


# Initialize the options variables to null.
PACKAGE_FORMAT=
PACKAGE_RELEASE=
FORMAT=
URL=
VERSION=
DIRECTORY=

