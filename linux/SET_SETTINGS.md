<!-- omit in toc -->
# Settings to configure Ubuntu

- [Settings](#settings)
  - [[BLUETOOTH] turn off by default in Ubuntu](#bluetooth-turn-off-by-default-in-ubuntu)
  - [[DUAL BOOT] [TIME] make linux listen to windows time (dual boot)](#dual-boot-time-make-linux-listen-to-windows-time-dual-boot)
  - [[GIT] In common](#git-in-common)
  - [[GIT] Add git information to bash prompt (.bashrc)](#git-add-git-information-to-bash-prompt-bashrc)
  - [[INSTALL] sudo apt install for relevant programs](#install-sudo-apt-install-for-relevant-programs)
  - [[MINIMIZE] activate minimize to doc](#minimize-activate-minimize-to-doc)
  - [[NAUTILUS] set shortcut for opening nautilus window](#nautilus-set-shortcut-for-opening-nautilus-window)
  - [[SSH] Create ssh key](#ssh-create-ssh-key)
  - [[VIM] configure vim as default editor for bash](#vim-configure-vim-as-default-editor-for-bash)
- [Default commands](#default-commands)
  - [command to update software](#command-to-update-software)
- [Legend](#legend)

# Settings
## [BLUETOOTH] turn off by default in Ubuntu
Bluetooth is enabled by default (on Laptop) and is active after every boot.

**command**:
```bash
sudo systemctl disable bluetooth.service
```

## [DUAL BOOT] [TIME] make linux listen to windows time (dual boot)
If this is not configured for a dual boot, linux and windows have time differences.
Windows os shows wrong time.
This will provide that the linux system uses the local time which is set/updated by windows.

```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```

## [GIT] In common
**install and configure git**
```bash
sudo apt install git -y &&
git config --global user.name "Name" &&
git config --global user.email "e-mail"
```

**view git config**
```bash
git config --list
```

## [GIT] Add git information to bash prompt (.bashrc)
**open** ```~/.bashrc```

**replace** a part of ```.bashrc```

**part before:**
```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```

**part after:**
```bash
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\] $(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(parse_git_branch)\$ '
fi
```

## [INSTALL] sudo apt install for relevant programs
```bash
sudo apt install vim -y &&
sudo apt install gufw -y &&
sudo apt install apt-xapian-index -y &&
sudo apt install amd64-microcode -y &&
sudo apt install intel-microcode -y &&
sudo apt install tlp -y &&
sudo apt install tlp-rdw -y &&
sudo apt install synaptic -y &&
sudo apt install okular -y &&
```

## [MINIMIZE] activate minimize to doc
```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

## [NAUTILUS] set shortcut for opening nautilus window
**Where**:

``System Settings`` &#8594; ``Keyboard`` &#8594; ``Shortcuts`` &#8594; ``Custom shortcut``

**command**:
```bash
nautilus -w
```

**shortcut**:
```
Super(Windows) + E
```

## [SSH] Create ssh key
```bash
ssh-keygen
```

## [VIM] configure vim as default editor for bash
**open** ```~/.bashrc```

**add the following lines:**
```bash
export VISUAL=vim
export EDITOR="$VISUAL"
```


# Default commands
## command to update software
```bash
sudo apt update &&
sudo apt upgrade -y &&
sudo apt autoremove -y &&
sudo apt autoclean
```

# Legend
- Nautilus =  file system explorer of ubuntu
- Super = Windows Key
