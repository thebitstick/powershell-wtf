# powershell-wtf

Profile and Module for Powershell use on (Fedora) Linux.

Why not. *shrug*.


### Theming
I use oh-my-posh with a modified Honukai theme called Impact. It matches the prompt I had been using on FiSH Shell.


### Modules

I use [Tyler/LeonhardtPSNotifySend](https://github.com/TylerLeonhardt/PSNotifySend), [DTW-DanWard/Powershell-Beautify](https://github.com/DTW-DanWard/PowerShell-Beautifier) and [cloudbase/powershell-yaml](https://github.com/cloudbase/powershell-yaml).


### Functions in WTF.psm1

- `Edit-Profile`  
`Edit-Item $PROFILE`

- `Edit-WTF`  
`Edit-Item $WTF_MODULE`

- `Update-Computer`  
`flatpak update; sudo dnf upgrade --refresh`

- `Get-DiskUsage`  
Implements `df -h` as a nice looking table

- `Get-DefaultKernel`  
Implements `grubby --default-kernel` as a nice looking table

- `Invoke-Sudo`  
`sudo pwsh-preview "% $args"`

- `Edit-PrivilegedItem`  
`Invoke-Sudo vim [file]`

- `Get-ComputerInfo`  
Implements `uname -a` and `cat /etc/os-release` and `lscpu` as a nice looking list

- `Write-EveryOtherOdd`  
Calculates "every other odd" in a range of numbers

- `Get-Service`  
`sudo systemctl status $name`

- `Start-Service`  
`sudo systemctl start $name`

- `Stop-Service`  
`sudo systemctl stop $name`

- `Restart-Service`  
`sudo systemctl restart $name`


### Aliases

- Edit-Item: `vim`  
- Connect-Shell: `ssh`  
- Open-Item: `xdg-open`  
- ls: dir: `Get-ChildItem`  
