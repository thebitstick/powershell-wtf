# powershell-wtf

Dotfiles for Powershell use on Fedora Linux.


Really not sure why I'm using Powershell on Linux, and I'm not sure why YOU would want to, but if you're interested in object-oriented scripting, feel free to check out these scripts.


These mostly implement missing functionality on Linux for Powershell using \*nix commands.


- uname.ps1: Get-Computer  
Implements `uname -a` as a nice looking table

- df.ps1: Get-DiskUsage  
Implements `df -h` as a nice looking table


### To-Do

Things I want to try doing in Powershell.

- Wrapper for dnf
- Add command-line arguments for existing scripts (like `-?`)
- Wrapper for systemctl ( systemd :) )
- Wrapper for rustup
- Wrapper for GSettings (GNOME)
- **Adventurous** Re-engineer GNU Make :)
- Wrapper for xdg-open
