$env:PATH += ":$env:HOME/.local/bin:$env:HOME/.cargo/bin" # Enables Python/Rust user-installed binaries (like sharexin or toot)

$SCRIPT_PATH = "$env:HOME/Git/powershell-wtf"

# Oh-My-Posh theming
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Impact

# Added for functionality similar to history searching used in FiSH Shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function Complete

#New-Alias Send-PSNotification notify-send # installed module, here to just keep track of
New-Alias Get-ComputerInfo $SCRIPT_PATH/uname.ps1
New-Alias Get-DiskUsage $SCRIPT_PATH/df.ps1
New-Alias Get-DefaultKernel $SCRIPT_PATH/grubby.ps1
New-Alias Invoke-Sudo $SCRIPT_PATH/sudo.ps1
New-Alias Edit-PrivilegedItem $SCRIPT_PATH/sudovi.ps1
New-Alias Edit-Item vim # lol
New-Alias Connect-Shell ssh
New-Alias Open-Item xdg-open
New-Alias ls dir # why use GNU ls when Get-ChildItem/dir exists
# (although I prefer exa on FiSH shell)

# These aren't implemented by default in Powershell
function ~ {
	Set-Location $env:HOME
} function .. {
	Set-Location ..
}

# Easy shortcut to the equivalent ~/.bashrc or ~/.zshrc or ~/.config/fish/config.fish
function Edit-Profile {
	Edit-Item $PROFILE
}

# I had made this function in FiSH Shell and it's useful for performing updates
function Update-Computer {
	flatpak update
	sudo dnf upgrade --refresh
}
