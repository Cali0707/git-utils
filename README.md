# git-utils
A collection of useful git tools. Currently the only tool here is a git command to sync an upstream repository with your local copy and your fork.

> :warning: **If you are not on Linux**: these scripts have only been tested on Linux so far. Please open an issue if you find any compatibility problems.

## Git Sync
### Usage
The `git sync` command can be used by running `git sync` in any git repository which meets the following requirements:
1. There is a remote named `upsteam` which is your upstream repository.
If there isn't, you can add it by doing:
```sh
git remote add upstream <the URL to the upstream repo>
```

2. There is a remote named `origin` which is your fork that you would like to sync with upstream.
If there isn't, you can add it by doing:
```sh
git remote add origin <the URL to your forked repo>
```

3. The main branch is named `main`.
`git sync` will stash any changes you have on your current branch, checkout `main`, sync it with upstream and with your fork, and then switch back to your current branch and pop off of the stash to restore your working tree and index.

## Installation
In order to use the `git sync` command, you need to add the `git-sync` file to your path. The recommended way to do this is to:
1. Find your path:
```sh
echo $PATH
```
In here you will likely have an entry like `/usr/bin` or `/home/{USERNAME}/bin` or `/usr/local/bin`. Pick an appropriate directory from your path, and then run:
```sh
ln -s "$(pwd)/git-sync" {DIRECTORY_OF_CHOICE}/git-sync
```
where `{DIRECTORY_OF_CHOICE}` is for example `/usr/bin`.
## Git Clone Fork
Note: this command currently only works with github repositories!
### Usage
The `git clonefork` can be used by running `git clonefork {REMOTE_ORIGIN_URL}` where `{REMOTE_ORIGIN_URL}` is:
1. The remote url for your fork of a repository. You must first create the fork in the Github UI, then in your fork click on the "Code" button and copy the url.
### Installation
The `git-sync` command needs `jq` installed. To check if it is installed you can run:
```sh
which jq
```
If it is not installed, please install it onto your system. To install `git clonefork` you can follow the same steps as `git sync` and:
1. Find your path:
```sh
echo $PATH
```
In here you will likely have an entry like `/usr/bin` or `/home/{USERNAME}/bin`. Pick an appropriate directory from your path, and then run:
```sh
ln -s "$(pwd)/git-clonefork" {DIRECTORY_OF_CHOICE}/git-clonefork
```
where `{DIRECTORY_OF_CHOICE}` is for example `/usr/bin`.
