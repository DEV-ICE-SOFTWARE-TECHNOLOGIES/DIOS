#!/bin/bash

# ----------------------------------------------------------------------
# Script to only cherry pick github pull requests
# ----------------------------------------------------------------------

set -eu


# ----------------------------------------------------------------------
# Variables that can be overriden by caller
# ----------------------------------------------------------------------
SOURCE=${SOURCE:-~/android/source}

_pick_pr() {
    local _remote=$1
    local _pr_refspec=$2
    local _commits=${3:-1}
    local _max_commits=${4:-$_commits}
    local _excluded_commits=${5:-}
    local _index=$(($_commits - 1))
    local _count=0
    local _current_commit

    git fetch $_remote $_pr_refspec

    while [ $_index -ge 0 -a $_count -lt $_max_commits ]; do
        _current_commit=`git log --pretty=format:%h FETCH_HEAD~$_index|head -1`
        if echo $_excluded_commits | grep $_current_commit; then
            echo "skip commit"
        else
            git cherry-pick --allow-empty -Xtheirs --no-edit FETCH_HEAD~$_index
        fi
        _index=$(($_index - 1))
        _count=$(($_count + 1))
    done
}

cd $SOURCE
