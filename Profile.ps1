if ($env:EDITOR) {
  $EDITOR = "$env:EDITOR"
} else {
  $EDITOR = "/usr/bin/nvim"
}

New-PSDrive -Name C -PSProvider FileSystem -Root / > /dev/null
$env:PATH += ":$env:HOME/.local/bin:$env:HOME/.cargo/bin" # Enables Python/Rust user-installed binaries (like sharexin or toot)
$SYSTEM_MODULE = "$env:HOME/Git/powershell-systemctl/Systemctl.psm1"
$ITEM_MODULE = "$env:HOME/Git/powershell-wtf/Item.psm1"
$WTF_MODULE = "$env:HOME/Git/powershell-wtf/WTF.psm1"
$WTF_PATH = "$env:HOME/Git/powershell-wtf/"

Import-Module $SYSTEM_MODULE
Import-Module $ITEM_MODULE
Import-Module $WTF_MODULE
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Impact

# Added for functionality similar to history searching used in FiSH Shell
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$true

Set-Alias Connect-Shell ssh
Set-Alias Build-C++ g++
Set-Alias Build-Rust rustc
Set-Alias ls Get-ChildItem
Set-Alias touch New-Item
Set-Alias rm Remove-Item
Set-Alias clear Clear-Host
Set-Alias cat Get-Content
Set-Alias cp Copy-Item
