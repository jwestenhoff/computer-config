# Settings to configure Ubuntu
[TOC]

## set shortcut for opening nautilus window
**Ubuntu Version**:

``` Ubuntu 18.04.4 LTS ```

**Where**:

``` System Settings -> Keyboard -> Shortcuts -> Custom shortcut ```

**command**:

```bash nautilus -w ```

**short cut**:

``` Super(Windows) + E ```


## add git information to bash prompt

open \~/.bashrc

**part before:**
```
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```


**part after:**
```
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\] $(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(parse_git_branch)\$ '
fi
```


# Legend
- Nautilus =  file system explorer of ubuntu
- Super = Windows Key
