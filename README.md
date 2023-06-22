# git-utils
A collection of useful git tools. Currently the only tool here is a git command to sync an upstream repository with your local copy and your fork.
## Usage
The `git sync` command can be used by running `git sync` in any git repository which meets the following requirements:
1. There is a remote named `upsteam` which is your upstream repository.
2. There is a remote named `origin` which is your fork that you would like to sync with upstream.
3. The main branch is named `main`.
`git sync` will stash any changes you have on your current branch, checkout `main`, sync it with upstream and with your fork, and then switch back to your
current branch and pop off of the stash to restore your working tree and index.
## Installation
In order to use the `git sync` command, you need to add the `git-sync` file to your path. The recommended way to do this is to:
1. Find your path:
```sh
echo $PATH
```
In here you will likely have an entry like `/usr/bin` or `/home/{USERNAME}/bin`. Pick an appropriate directory from your path, and then run:
```sh
ln -s "$(pwd)/git-sync" {DIRECTORY_OF_CHOICE}/git-sync
```
where `{DIRECTORY_OF_CHOICE}` is for example `/usr/bin`.

