# Settings to configure Ubuntu
[TOC]

# Changes in .bashrc of Git Bash
## configure ssh-agent with private key
**open** ```~/.bashrc```

```
eval `ssh-agent.exe`
ssh-add ~/.ssh/id_rsa
```