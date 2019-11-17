# powershell-wtf

Profile and Module for Powershell use on (Fedora) Linux.

Why not. *shrug*.


### Theming
I use oh-my-posh with a modified Honukai theme called Impact. It matches the prompt I had been using on FiSH Shell.


### Modules

I use [Tyler/LeonhardtPSNotifySend](https://github.com/TylerLeonhardt/PSNotifySend) and [DTW-DanWard/Powershell-Beautify](https://github.com/DTW-DanWard/PowerShell-Beautifier).


### Functions in WTF.psm1

- `Get-ComputerInfo`  
Implements `uname -a` and `cat /etc/os-release` as a nice looking table

- `Get-DiskUsage`  
Implements `df -h` as a nice looking table

- `Get-DefaultKernel`  
Implements `grubby --default-kernel` as a nice looking table

- `Invoke-Sudo`  
`sudo pwsh-preview "% $args"`

- `Edit-PrivilegedItem`  
`Invoke-Sudo vim [file]`

- `Edit-Profile`  
`Edit-Item $PROFILE`

- `Edit-WTF`  
`Edit-Item $WTF_MODULE`

- `Update-Computer`  
`flatpak update; sudo dnf upgrade --refresh`

- `Get-Service`  
`sudo systemctl status $name`

- `Write-EveryOtherOdd`  
Calculates "every other odd" in a range of numbers


### Aliases

- Edit-Item: `vim`  
- Connect-Shell: `ssh`  
- Open-Item: `xdg-open`  
- ls: dir: `Get-ChildItem`  
