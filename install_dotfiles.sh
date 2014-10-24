#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make all of the symlinks to the dotfiles
function link_dotfiles {
    for dotfilepath in ${DIR}/dotfiles/*;
    do
        dotfile=$(basename "$dotfilepath")
        if [ -h ~/".${dotfile}" ]; then
            echo "Already linked: ${dotfile}"
        else
            echo "Installing $dotfile"
            if [ -f ~/".${dotfile}" ]; then
                echo "Hard file at ~/.${dotfile}.  Saving as ~/.${dotfile}_bak"
                mv ~/".${dotfile}" ~/".${dotfile}_bak"
            fi
            ln -s "${DIR}/dotfiles/${dotfile}" ~/".${dotfile}"
        fi
    done
}

function link_dotfolders {
    for dotfolderpath in ${DIR}/dotfolders/*;
    do
        dotfolder=$(basename "$dotfolderpath")
        if [ -h ~/".${dotfolder}" ]; then
            echo "Already linked: ${dotfolder}"
        else
            echo "Installing $dotfolder"
            if [ -d ~/".${dotfolder}" ]; then
                echo "Real folder at ~/.${dotfolder}.  Saving as ~/.${dotfolder}_bak"
                mv ~/".${dotfolder}" ~/".${dotfolder}_bak"
            fi
            # Don't link these, just copy to not screw up git
            cp -r "${DIR}/dotfolders/${dotfolder}" ~/".${dotfolder}"
        fi
    done
}

function install_neobundle {
    if [ -d ~/.vim/bundle/neobundle.vim ]; then
        echo "Found NeoBundle, deleting"
        rm -rf ~/.vim/bundle/neobundle.vim
    fi
    echo "Installing NeoBundle"
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    echo "IGNORE TONS OF ERRORS"
    sh ~/.vim/bundle/neobundle.vim/bin/neoinstall
    echo "STOP IGNORING"
}

link_dotfiles
link_dotfolders
install_neobundle
