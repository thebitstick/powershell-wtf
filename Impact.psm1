#requires -Version 2 -Modules posh-git

$TextInfo = (Get-Culture).TextInfo

function Write-Theme {
    param(
        [bool]
        $lastCommandFailed,
        [string]
        $with
    )

    # write user
    $user = $TextInfo.ToTitleCase($sl.CurrentUser)
    if (Test-NotDefaultUser($user)) {
        $prompt += Write-Prompt -Object "$user" -ForegroundColor $sl.Colors.PromptHighlightColor
        # write at (devicename)
        $device = $TextInfo.ToTitleCase($(Get-ComputerName))
        $prompt += Write-Prompt -Object " at" -ForegroundColor $sl.Colors.PromptForegroundColor
        $prompt += Write-Prompt -Object " $device" -ForegroundColor $sl.Colors.GitDefaultColor
        # write in for folder
        $prompt += Write-Prompt -Object " in" -ForegroundColor $sl.Colors.PromptForegroundColor
    }
    # write folder
    $dir = Get-FullPath -dir $pwd
    $prompt += Write-Prompt -Object " $dir " -ForegroundColor $sl.Colors.AdminIconForegroundColor
    # check the last command state and indicate if failed
    $foregroundColor = $sl.Colors.PromptHighlightColor
    If ($lastCommandFailed) {
        $foregroundColor = $sl.Colors.CommandFailedIconForegroundColor
    }

    if ($with) {
        $prompt += Write-Prompt -Object "$($with.ToUpper()) " -BackgroundColor $sl.Colors.WithBackgroundColor -ForegroundColor $sl.Colors.WithForegroundColor
    }

    $prompt += Write-Prompt -Object $sl.PromptSymbols.PromptIndicator -ForegroundColor $foregroundColor
    $prompt += ' '
    $prompt
}

$sl = $global:ThemeSettings #local settings
$sl.PromptSymbols.PromptIndicator = ">"
$sl.Colors.PromptHighlightColor = [ConsoleColor]::Blue
$sl.Colors.PromptForegroundColor = [ConsoleColor]::White
$sl.Colors.PromptHighlightColor = [ConsoleColor]::Blue
$sl.Colors.WithForegroundColor = [ConsoleColor]::Red
$sl.Colors.WithBackgroundColor = [ConsoleColor]::Magenta
