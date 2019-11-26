# powershell-wtf

Profile and Module for Powershell use on (Fedora) Linux.

Why not. *shrug*.


### Theming
I use oh-my-posh with a modified Honukai theme called Impact. It matches the prompt I had been using on FiSH Shell.


### Modules

I use my own separate modules for systemctl/systemd manipulation. Found here: [thebitstick/powershell-systemctl](https://github.com/thebitstick/powershell-systemctl).  

I also use [Tyler/LeonhardtPSNotifySend](https://github.com/TylerLeonhardt/PSNotifySend), [DTW-DanWard/Powershell-Beautify](https://github.com/DTW-DanWard/PowerShell-Beautifier) and [cloudbase/powershell-yaml](https://github.com/cloudbase/powershell-yaml).


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


### Function in masm.psm1

- `Build-Assembly`
Takes a MASM file and assembles it


### Functions in Item.psm1

- `Edit-Item`
Wrapper for $EDITOR (currently nvim)

- `Edit-PrivilegedItem`
Calls $EDITOR with `Invoke-Sudo`

- `Invoke-PrivilegedItem`
Wrapper for xdg-open

### Aliases

- Connect-Shell: `ssh`  
- Build-C++: `g++`
- Build-Rust: `rustc`
- ls: `Get-ChildItem`  
- touch: `New-Item`
