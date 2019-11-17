$env:PATH += ":$env:HOME/.local/bin:$env:HOME/.cargo/bin" # Enables Python/Rust user-installed binaries (like sharexin or toot)
$WTF_MODULE = "$env:HOME/Git/powershell-wtf/WTF.psm1"
$WTF_PATH = "$env:HOME/Git/powershell-wtf/"

# Oh-My-Posh theming
Import-Module $WTF_MODULE
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Impact

# Added for functionality similar to history searching used in FiSH Shell
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$true

Set-Alias Edit-Item vim # lol
Set-Alias Connect-Shell ssh
Set-Alias Open-Item xdg-open
Set-Alias Emulate-Console wineconsole
Set-Alias Compile-C++ g++
Set-Alias Compile-Assembly masm
Set-Alias Compile-Rust rustc
Set-Alias ls dir # why use GNU ls when Get-ChildItem/dir exists
# (although I prefer exa on FiSH shell)
