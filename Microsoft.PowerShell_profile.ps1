$env:PATH += ":$env:HOME/.local/bin:$env:HOME/.cargo/bin" # Enables Python/Rust user-installed binaries (like sharexin or toot)

# Oh-My-Posh theming
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Impact

# Added for functionality similar to history searching used in FiSH Shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function Complete

New-Alias Get-Computer $env:HOME/.local/share/powershell/Scripts/uname.ps1
New-Alias Get-DiskUsage $env:HOME/.local/share/powershell/Scripts/df.ps1
New-Alias Edit-Item vim # lol
New-Alias Connect-Shell ssh
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

function Edit-PrivilegedItem {
	param(
		[Parameter(Mandatory=$true, Position=1)]
		[string]$Item
	)
	Invoke-Sudo vim $Item
}

# Useful when using a Surface device and you need to ensure usage of the Surface Linux kernel
function Get-DefaultKernel {
	class Kernel {
		[string]$Name
		[string]$Location
	}

	$kern = [Kernel]::New()
	$out = (Elevate-Privilege grubby --default-kernel)

	$kern.Name = Split-Path $out -leaf
	$kern.Location = $out

	$kern
}

# Takes args and calls a new shell with sudo
function Invoke-Sudo {
	& /usr/bin/env sudo pwsh -nologo -command "& $args"
}
