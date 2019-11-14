<#
	.SYNOPSIS
	    Wrapper for Superuser Do (sudo)
	.DESCRIPTION
	    Takes mandatory parameters provided and Invokes the sudo command
	.INPUTS
	    Mandatory parameters as commands
	.EXAMPLE
	    Invoke-Sudo dnf install pwsh-preview
	.EXAMPLE
	    Invoke-Sudo rm -rf /c/system32
#>

#Requires -Version 6.0

[CmdletBinding()]
param (
	[Parameter(ValueFromRemainingArguments = $true, Mandatory = $true)]
	[string[]]$args = $args
)

/usr/bin/env sudo pwsh-preview -nologo -command "& $args"
