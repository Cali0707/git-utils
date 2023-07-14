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

3. Both your git client and the git installed on your remotes support `git ls-remote --symref` (most do, just a very old version might not).

`git sync` will stash any changes you have on your current branch, checkout the local branch which is `HEAD` (aka the main branch) on the upstream remote, 
sync it with upstream and with your fork, and then switch back to your current branch and pop off of the stash to restore your working tree and index.

## Git Clone Fork
Note: this command currently only works with github repositories!
### Usage
The `git clonefork` can be used by running `git clonefork {REMOTE_ORIGIN_URL}` where `{REMOTE_ORIGIN_URL}` is:
1. The remote url for your fork of a repository. You must first create the fork in the Github UI, then in your fork click on the "Code" button and copy the url.


## Installation
To install the utils, use the `./install.sh` script provided in this repo. If you would like to specify which util to install rather than install all of them, you can
use `./install.sh -n <name_of_util`. For example, to install `git-sync` only, you could run `./install.sh -n git-sync`.
