# git-utils
A collection of useful git tools. Currently the only tool here is a git command to sync an upstream repository with your local copy and your fork.

> :warning: **If you are not on Linux/MacOS**: these scripts have only been tested on Linux and MacOS so far. Please open an issue if you find any compatibility problems.

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


## How to set up an SSH Key with GitHub

To set up an SSH key with GitHub, follow these steps:

1. **Check for existing SSH keys:** Before generating a new SSH key, check if you already have one on your computer. By default, SSH keys are stored in the `~/.ssh` directory. To check for existing keys, open a terminal (command prompt) and enter the following command:

   ```bash
   ls ~/.ssh
   ```

   If you see files like `id_rsa` and `id_rsa.pub`, it means you already have an SSH key pair.

2. **Generate a new SSH key:** If you don't have an existing SSH key or want to generate a new one, you can do so using the `ssh-keygen` command. Open a terminal and enter the following command:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   Make sure to replace `"your_email@example.com"` with the email address associated with your GitHub account. You can also leave the email empty if you prefer.

   This command will generate a new RSA type SSH key with 4096 bits for better security. You'll be prompted to save the key in a specific location. By default, the keys will be stored in the `~/.ssh` directory with filenames `id_rsa` (private key) and `id_rsa.pub` (public key).

3. **Add your SSH key to the ssh-agent (optional):** The `ssh-agent` is a program that runs in the background and manages your SSH keys. It helps you avoid entering your passphrase every time you use your SSH key. To add your key to the `ssh-agent`, run the following commands:

   ```bash
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_rsa
   ```

   If you set a passphrase during the SSH key generation process, you'll be prompted to enter it now.

4. **Copy the public key to your GitHub account:** To connect your generated SSH key to your GitHub account, you need to add the public key (`id_rsa.pub`) to your GitHub account settings.

   - Open the `id_rsa.pub` file with a text editor or use the following command to display the key in the terminal:

     ```bash
     cat ~/.ssh/id_rsa.pub
     ```

   - Copy the entire contents of the `id_rsa.pub` file.

   - Go to your GitHub account and navigate to **Settings > SSH and GPG keys**.

   - Click on **New SSH key** or **Add SSH key**.

   - Provide a title for the SSH key (e.g., "My Personal Laptop") and paste the copied key into the "Key" field.

   - Click **Add SSH key**.

5. **Test the SSH connection:** To ensure everything is set up correctly, test your SSH connection to GitHub:

   ```bash
   ssh -T git@github.com
   ```

   If this is your first time connecting to GitHub, you may see a prompt asking you to verify the authenticity of the host. Type "yes" to continue. If the connection is successful, you'll see a message like:

   ```
   Hi username! You've successfully authenticated, but GitHub does not provide shell access.
   ```

That's it! Your SSH key is now set up and associated with your GitHub account, allowing you to securely interact with repositories using SSH.
