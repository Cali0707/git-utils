#!/usr/bin/env bash

# Copyright 2023 Calum Murray
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

function install_git_util_command() {
    ln -s "$(pwd)/$1" "${HOME}/bin/$1"
}

function check_git_util_dep_installed() {
    if ! command -v "$1" &> /dev/null
    then
        echo "$1 is a dependency for $2. Please install it before installing $2"
        return 1
    fi
    return 0
}

while getopts "n:" flag; do
    case "${flag}" in 
        n) NAME="${OPTARG}" ;;
        ?) printf "Usage: %s: [-n name_of_command_to_install]\n" $0
            exit 2;;
    esac
done

if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
  echo "Your path is correctly set"
else
  echo "Your path is missing ~/bin, you might want to add it."
  echo "If you use bash, add 'export PATH=\"\${PATH}:\${HOME}/bin\"' to your .bashrc file"
  echo "If you use zsh, add 'export PATH=\"\${PATH}:\${HOME}/bin\"' to your .zshrc file"
  echo "If you use fish, add 'fish_add_path -m ~/bin' to your config.fish file"
  exit 1
fi

mkdir -p "${HOME}/bin"

if [[ -z "$NAME" || "$NAME" = "git-sync" ]]; then
    install_git_util_command "git-sync" && echo "installed git_sync"
fi

if [[ (-z "$NAME" || "$NAME" = "git-clonefork") ]]; then
    check_git_util_dep_installed "jq" "git-clonefork" && install_git_util_command "git-clonefork" && echo "intalled git_clonefork"
fi
