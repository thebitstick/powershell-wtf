# powershell-wtf

Profile and Module for Powershell use on (Fedora) Linux.

Why not. *shrug*.


### Theming
I use oh-my-posh with a modified Honukai theme called Impact. It matches the prompt I had been using on FiSH Shell.


### Modules

I use my own separate modules for systemctl/systemd manipulation. Found here: [thebitstick/powershell-systemctl](https://github.com/thebitstick/powershell-systemctl).  

I also use [Tyler/LeonhardtPSNotifySend](https://github.com/TylerLeonhardt/PSNotifySend), [DTW-DanWard/Powershell-Beautify](https://github.com/DTW-DanWard/PowerShell-Beautifier) and [cloudbase/powershell-yaml](https://github.com/cloudbase/powershell-yaml).


### Functions in WTF.psm1

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


### Function in masm.psm1

- `Build-Assembly`  
Takes a MASM file and assembles it


### Functions in Item.psm1

- `Edit-Item`  
Wrapper for $EDITOR (currently nvim)

- `Edit-PrivilegedItem`  
Calls $EDITOR with `Invoke-Sudo`

- `New-PrivilegedItem`  
Calls `New-Item` with `Invoke-Sudo`

- `Remove-PrivilegedItem`  
Calls `Remove-Item` with `Invoke-Sudo`

- `Clear-PrivilegedItem`  
Calls `Clear-Item` with `Invoke-Sudo`

- `Copy-PrivilegedItem`  
Calls `Copy-Item` with `Invoke-Sudo`

- `Get-PrivilegedItem`  
Calls `Get-Item` with `Invoke-Sudo`

- `Move-PrivilegedItem`  
Calls `Move-Item` with `Invoke-Sudo`

- `Set-PrivilegedItem`  
Calls `Set-Item` with `Invoke-Sudo`

- `Invoke-PrivilegedItem`  
Calls `Invoke-Item` with `Invoke-Sudo`


### Aliases

- Connect-Shell: `ssh`  
- Build-C++: `g++`
- Build-Rust: `rustc`
- ls: `Get-ChildItem`  
- touch: `New-Item`
