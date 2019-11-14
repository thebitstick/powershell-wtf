<#
	.SYNOPSIS
	    Allows Editing of Administrator Configuration Files
	.DESCRIPTION
	    Calls Invoke-Sudo with the editor vim to edit a given file as the superuser
	.PARAMETER Item
	    Item to edit
	.INPUTS
	    Items to Edit
	.EXAMPLE
	    Edit-PrivilegedItem /etc/passwd
#>

#Requires -Version 6.0

[CmdletBinding()]
param(
	[Parameter(Mandatory = $true, Position = 1)]
	[string]$Item
)

Invoke-Sudo vim $Item
