<#
	.SYNOPSIS
	    Formats the values of uname outputs as a table
	.DESCRIPTION
	    Stores multiple values of uname outputs in an object and displays the object as a table
	.OUTPUTS
	    Table-formatted uname -a
#>

#Requires -Version 6.0

[CmdletBinding()]
class ComputerInfo {
	[string]$Kernel
	[string]$Hostname
	[string]$KernelRelease
	[string]$KernelVersion
	[string]$Hardware
	[string]$Processor
	[string]$Platform
	[string]$OperatingSystem
}

$Comp = [ComputerInfo]::New()

$Comp.Kernel = (uname --kernel-name)
$Comp.Hostname = (uname --nodename)
$Comp.KernelRelease = (uname --kernel-release)
$Comp.KernelVersion = (uname --kernel-version)
$Comp.Hardware = (uname --machine)
$Comp.Processor = (uname --processor)
$Comp.Platform = (uname --hardware-platform)
$Comp.OperatingSystem = (uname --operating-system)

$Comp
