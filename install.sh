#!/usr/bin/env bash
# PENDING: readlink -f does not work on Mac's bash
set -eou pipefail

make-link() {
    # Too long to inline
    local -r source_path=${1}

    local -r leaf=$(basename ${source_path})
    local -r target_path=~/.${leaf:1}

    if [ -e ${target_path} ]; then
        resolved_target_path=$(readlink -f ${target_path})
        [ ${resolved_target_path} != ${source_path} ] && echo "${target_path} already exists with a different target ${resolved_target_path} to ${source_path}"
        return
    fi

    ln -s ${source_path} ${target_path}
}

install() {
    # Store source directory path
    source_directory_path=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

    # Bash content
    for n in _bash_aliases _bashrc _bashrc_ext; do make-link ${source_directory_path}/${n}; done

    # .git content
    for n in _gitconfig; do make-link ${source_directory_path}/${n}; done

    # Vim content
    for n in _vim _vimrc; do make-link ${source_directory_path}/${n}; done
}

print-commands() {
    # Store source directory path
    source_directory_path=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

    echo-cmd() { leaf=$(basename ${1}); echo "ln -s ${1} ~/.${leaf:1}"; }

    # Bash content
    for n in _bash_aliases _bashrc _bashrc_ext; do echo-cmd ${source_directory_path}/${n}; done

    # .git content
    for n in _gitconfig; do echo-cmd ${source_directory_path}/${n}; done

    # Vim content
    for n in _vim _vimrc; do echo-cmd ${source_directory_path}/${n}; done
}

# Main
[[ "$@" == "" ]] && install && exit 0
$@
