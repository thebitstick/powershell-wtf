<#
	.SYNOPSIS
	    Formats the output of querying the default kernel under GRUB as a table
	.DESCRIPTION
	    Takes the output of grubby after querying the default kernel under GRUB, then outputs
	.OUTPUTS
	    Value of default kernel under GRUB as an object containing it's filename and location
#>

#Requires -Version 6.0

[CmdletBinding()]
class Kernel {
	[string]$Name
        [string]$Location
}

$Kern = [Kernel]::New()
$Output = (Invoke-Sudo grubby --default-kernel)

$Kern.Name = Split-Path -Path $Output -Leaf
$Kern.Location = $Output

$Kern | Format-Table -Autosize
