#!/usr/bin/env bash

# Directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make all of the symlinks to the dotfiles
function link_dotfiles {
    for dotfilepath in ${DIR}/dotfiles/*;
    do
        dotfile=$(basename "$dotfilepath")
        if [ -h "${HOME}/.${dotfile}" ]; then
            echo "Already linked: ${dotfile}"
        else
            echo "Installing $dotfile"
            if [ -f "${HOME}/.${dotfile}" ]; then
                echo "Hard file at ~/.${dotfile}.  Saving as ~/.${dotfile}_bak"
                mv "${HOME}/.${dotfile}" "${HOME}/.${dotfile}_bak"
            fi
            ln -s "${DIR}/dotfiles/${dotfile}" "${HOME}/.${dotfile}"
        fi
    done
}

function link_dotfolders {
    for dotfolderpath in ${DIR}/dotfolders/*;
    do
        dotfolder=$(basename "$dotfolderpath")
        if [ -h "${HOME}/.${dotfolder}" ]; then
            echo "Already linked: ${dotfolder}"
        else
            echo "Installing $dotfolder"
            if [ -d "${HOME}/.${dotfolder}" ]; then
                echo "Real folder at ~/.${dotfolder}.  Saving as ~/.${dotfolder}_bak"
                if [ -d "${HOME}/.${dotfolder}_bak" ]; then
                    rm -rf "${HOME}/.${dotfolder}_bak"
                fi
                mv "${HOME}/.${dotfolder}" "${HOME}/.${dotfolder}_bak"
            fi
            # Don't link these, just copy to not screw up git
            cp -r "${DIR}/dotfolders/${dotfolder}" "${HOME}/.${dotfolder}"
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
