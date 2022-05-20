<!-- omit in toc -->
# Helpful Windows Settings

- [[SSH] Use ssh-Agent for PKs](#ssh-use-ssh-agent-for-pks)
- [[TERMINAL] Add Git Bash to "Terminal" of Windows](#terminal-add-git-bash-to-terminal-of-windows)

## [SSH] Use ssh-Agent for PKs

This is useful if you have a ssh-key with a password.

You need to type in the password once after starting your git bash. This will be the only time you are typing in your password during this session.

**open** ```~/.bashrc```

```
eval `ssh-agent.exe`
ssh-add ~/.ssh/id_rsa
```

## [TERMINAL] Add Git Bash to "Terminal" of Windows

1. Install [Git Bash](https://gitforwindows.org/)
2. Open Terminal
3. Open Terminal Settings JSON file (`Settings` &#8594; `Open JSON file`)
4. Insert Config for Git Bash to JSON (`profiles` &#8594; `list` )

Config for Git Bash:
```json
{
    "closeOnExit": "always",
    "commandline": "\"%PROGRAMFILES%\\git\\usr\\bin\\bash.exe\" -i -l",
    "guid": "{00000000-0000-0000-ba88-000000000000}",
    "icon": "%PROGRAMFILES%\\Git\\mingw64\\share\\git\\git-for-windows.ico",
    "name": "Git Bash",
    "startingDirectory": "%USERPROFILE%"
},
```

[Example Picture](../images/terminal_git_bash_config_example.PNG)
