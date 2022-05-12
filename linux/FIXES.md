<!-- omit in toc -->
# Fixes 
- [avoid report popup because of detected problems](#avoid-report-popup-because-of-detected-problems)
- [fix miktex error during "sudo apt update"](#fix-miktex-error-during-sudo-apt-update)
  - [Error:](#error)
  - [Fix:](#fix)

## avoid report popup because of detected problems
view detected problems:
```bash
ls -l /var/crash
```

remove detected problems to avoid report popup:
```bash
sudo rm /var/crash/*
```

## fix miktex error during "sudo apt update"
### Error:
```
N: Skipping acquire of configured file 'universe/binary-i386/Packages' as repository 'http://miktex.org/download/ubuntu xenial InRelease' doesn't support architecture 'i386'
```

### Fix:
- open file ``` /etc/apt/sources.list.d/miktek.list```
- change file content - example:
  - before:
    ```
    deb http://miktex.org/download/ubuntu xenial universe
    ```
  - after:
    ```
    deb [arch=amd64] http://miktex.org/download/ubuntu xenial universe
    ```
