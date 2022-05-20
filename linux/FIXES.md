<!-- omit in toc -->
# Fixes 
- [[APT] Update errors](#apt-update-errors)
- [[DUAL BOOT] Windows still in Grub Boot Loader](#dual-boot-windows-still-in-grub-boot-loader)
- [[MIKTEX] Error during "sudo apt update"](#miktex-error-during-sudo-apt-update)
- [[REPORTS] Avoid report popup because of detected problems](#reports-avoid-report-popup-because-of-detected-problems)


## [APT] Update errors
All additional apt settings are stored under following path:

`/etc/apt/sources.list`

If there are some errors like a failing patch from an url this might could be helpful.

## [DUAL BOOT] Windows still in Grub Boot Loader
At first a dual boot with ubuntu and windows has been installed on the computer. Afterwards there has been a ubuntu installation on the whole drive.

This could lead to the case that Windows still appears as boot option in the Grub Boot Loader even if there is no windows anymore.

With the following command the Windows/Microsoft entry can be remove from boot options:
```bash
sudo rm -r /boot/efi/EFI/Microsoft
sudo update-grub
```

## [MIKTEX] Error during "sudo apt update"
<!-- omit in toc -->
### Occuring Error
```
N: Skipping acquire of configured file 'universe/binary-i386/Packages' as repository 'http://miktex.org/download/ubuntu xenial InRelease' doesn't support architecture 'i386'
```

<!-- omit in toc -->
### Fix
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

## [REPORTS] Avoid report popup because of detected problems
view detected problems:
```bash
ls -l /var/crash
```

remove detected problems to avoid report popup:
```bash
sudo rm /var/crash/*
```
