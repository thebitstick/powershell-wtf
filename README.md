# powershell-wtf

Dotfiles for Powershell use on Fedora Linux.


Really not sure why I'm using Powershell on Linux, and I'm not sure why YOU would want to, but if you're interested in object-oriented scripting, feel free to check out these scripts.


These mostly implement missing functionality on Linux for Powershell using \*nix commands.


### Scripts

- uname.ps1: `Get-ComputerInfo`  
Implements `uname -a` as a nice looking table

- df.ps1: `Get-DiskUsage`  
Implements `df -h` as a nice looking table

- grubby.ps1: `Get-DefaultKernel`  
Implements `grubby --default-kernel` as a nice looking table

- sudo.ps1: `Invoke-Sudo`  
`sudo pwsh-preview "% $args"`

- sudovi.ps1: `Edit-PrivilegedItem`  
`Invoke-Sudo vim [file]`


### Aliases

- Edit-Item: `vim`  
- Connect-Shell: `ssh`  
- Open-Item: `xdg-open`  
- ls: dir: `Get-ChildItem`  
- Edit-Profile: `Edit-Item $PROFILE`  
- Update-Computer: `flatpak update; sudo dnf upgrade --refresh`  


### To-Do

Things I want to try doing in Powershell.

- Wrapper for dnf
- Wrapper for systemctl  (**systemd :)** )
