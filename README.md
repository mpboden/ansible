# ansible

INSTALL

bash -c "$(curl -fsSl https://raw.githubusercontent.com/mpboden/ansible/master/bin/dotfiles)"


INFO

For passwordless login, there are two options:

1. Add file on remote host to /etc/sudoers.d/ directory. For example:
  $ cat /etc/sudoers.d/sudoer_mike
  mike ALL=(ALL) NOPASSWD: ALL

  To encrypt this file locally and in git repository, use ansible-vault:
    $ ansible-vault encrypt --vault-password-file ~/.vault_key sudoer_mike

  Then this file can be copied to remote host.

2. Define variable, 'ansible_become_pass', in ansible.cfg file or in
  group_vars/all.yml. Obviously, best practice is to encrypt this text.
  Use following command to do so, which will append encrypted string to all.yml:

    $ ansible-vault encrypt-string --vault-password-file ~/.vault_key 'password' --name 'ansible_become_pass' >> group_vars/all.yml

  If you have 'vault_password_file' defined in ansible.cfg, the above command
  will not work if run from directory where ansible.cfg is saved. Thus, omit
  --vault-password-file argument as follows:

    $ ansible-vault encrypt-string 'password' --name 'ansible_become_pass' >> group_vars/all.yml

