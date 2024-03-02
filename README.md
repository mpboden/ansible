# dotfiles

## INSTALL

bash -c "$(curl -fsSl https://raw.githubusercontent.com/mpboden/ansible/master/bin/dotfiles)"

## REQUIREMENTS

- `curl` needs to be installed.

- Vault password file with `vault_key` needs to be place in `~/.vault_key` file.

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

## License

MIT License

Copyright (c) 2019 Thiago Alves

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

