# dotfiles

## INSTALL

- Initial install
    ```sh
    bash -c "$(curl -fsSl https://raw.githubusercontent.com/mpboden/ansible/master/bin/dotfiles)"
    ```
- Updates

    A symlink to `~/.dotfiles/bin/dotfiles` is placed in `~/bin` and can be run
    without tags or with tags for specific roles. For example:

  - `dotfiles`
  - `dotfiles -t ssh`
  - `dotfiles -t "ssh,nvim"`

## REQUIREMENTS

- `curl` needs to be installed.

- Vault password file with raw `vault_key` password only placed in `~/.vault_key` file.

## INFO

For passwordless login, there are two options:

1. Add file on remote host to `/etc/sudoers.d/` directory. For example:
    ```sh
    $ cat /etc/sudoers.d/sudoer_mike
    mike ALL=(ALL) NOPASSWD: ALL
    ```
  
    To encrypt this file locally and in git repository, use ansible-vault:
    ```sh
    $ ansible-vault encrypt --vault-password-file ~/.vault_key sudoer_mike
    ```
  
    Then this file can be copied to remote host.
  
2. Define variable, 'ansible_become_pass', in ansible.cfg file or in
  group_vars/all.yml. Obviously, best practice is to encrypt this text.
  Use following command to do so, which will append encrypted string to all.yml:

    ```sh
    $ ansible-vault encrypt-string --vault-password-file ~/.vault_key 'password' --name 'ansible_become_pass' >> group_vars/all.yml
    ```
    
    If you have 'vault_password_file' defined in *ansible.cfg*, the above command
    will not work if run from directory where ansible.cfg is saved. Thus, omit
    `--vault-password-file` argument as follows:
    
    ```sh
    $ ansible-vault encrypt-string 'password' --name 'ansible_become_pass' >> group_vars/all.yml
    ```

