$env:PATH += ":$env:HOME/.local/bin:$env:HOME/.cargo/bin" # Enables Python/Rust user-installed binaries (like sharexin or toot)
$SCRIPT_PATH = "$env:HOME/Git/powershell-wtf"

# Oh-My-Posh theming
Import-Module $SCRIPT_PATH/WTF.psm1
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Impact

# Added for functionality similar to history searching used in FiSH Shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function Complete

New-Alias Edit-Item vim # lol
New-Alias Connect-Shell ssh
New-Alias Open-Item xdg-open
New-Alias ls dir # why use GNU ls when Get-ChildItem/dir exists
# (although I prefer exa on FiSH shell)
