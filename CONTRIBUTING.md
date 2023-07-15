# Contribution guidelines

Welcome! We are happy that you want to contribute to `git-utils`! In general, contributions are welcome here!
We ask that you are respectful when interacting with people, and that you always open an issue before working
on a PR. Otherwise, have fun and we look forward to working with you!

## Getting started

1. Assign yourself an issue from the [issues page](https://github.com/Cali0707/git-utils/issues), or open an issue if one does not exist yet.
We recommend the issues labelled `good-first-issue` as well documented issues ready for new contributors.
2. Create and checkout a fork of the repo (this is a great chance to use `git clonefork`). 

## Workflow

Git utils are created by making executable files named `git-<commandname>`. To add a new command, create a file accordingly. If you are
making a change to an existing file, this naming convention should also make it easy for you to figure out which file to edit! 

Currently, all of the files are bash scripts, so if you are editing a new file please add `#!/usr/bin/env bash` to the top of the file.
We also require that you add the [Apache License comment](https://github.com/Cali0707/git-utils/blob/main/git-sync#L3-L15) 
to the top of any new files you add.

Since every command is just an executable, if you are working on a new command you can simply run the file while you develop it. Once you
feel it is ready, remember to add it to the `install.sh` script and update the `README.md`.

If you have any questions about what an issue is asking you to do, please comment on the issue. If you have any questions as you are working
on your code, please open a [Draft PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/changing-the-stage-of-a-pull-request#converting-a-pull-request-to-a-draft)
and ask the question there so that we can see what changes you have made so far.
