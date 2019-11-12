#!/usr/bin/env pwsh

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

$comp = [ComputerInfo]::New()

$comp.Kernel = (uname --kernel-name)
$comp.Hostname = (uname --nodename)
$comp.KernelRelease = (uname --kernel-release)
$comp.KernelVersion = (uname --kernel-version)
$comp.Hardware = (uname --machine)
$comp.Processor = (uname --processor)
$comp.Platform = (uname --hardware-platform)
$comp.OperatingSystem = (uname --operating-system)

$comp 
