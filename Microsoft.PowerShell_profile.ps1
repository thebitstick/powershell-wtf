$env:PATH += ":$env:HOME/.local/bin:$env:HOME/.cargo/bin"

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Impact

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function Complete

New-Alias Get-Computer $env:HOME/.local/share/powershell/Scripts/uname.ps1
New-Alias Get-DiskUsage $env:HOME/.local/share/powershell/Scripts/df.ps1
New-Alias Edit-Item vim
New-Alias Connect-Shell ssh

function ~ {
	Set-Location $env:HOME
}

function .. {
	Set-Location ..
}

function Edit-Profile {
	Edit-Item $PROFILE
}

function Update-Computer {
	flatpak update
	sudo dnf upgrade --refresh
}

function Edit-PrivilegedItem {
	param(
		[Parameter(Mandatory=$true, Position=1)]
		[string]$Item
	)
	Elevate-Privilege vim $Item
}

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

function Invoke-Sudo {
	& /usr/bin/env sudo pwsh -nologo -command "& $args"
}
