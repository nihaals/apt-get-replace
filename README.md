# apt-get-replace
Replaces apt-get with apt

To add the replacement scripts to your PATH while using `sudo`, you can do:
```bash
sudo visudo -f /etc/sudoers.d/apt-get-replace

Defaults        secure_path="/opt/apt-get-replace:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

sudo chmod 644 /etc/sudoers.d/apt-get-replace
sudo chown root:root /etc/sudoers.d/apt-get-replace
```

This allows it to work for any shell. It is much simpler if your shell supports aliases while using `sudo`:
```bash
# "Alias Expansion"
alias sudo='sudo '

alias -- apt-get='"/opt/apt-get-replace/apt-get-replace/bin/apt-get"'
alias -- apt-cache='"/opt/apt-get-replace/apt-get-replace/bin/apt-cache"'
```

Simply add this to `~/.bash_aliases`.
