function ~ {
<#
	.SYNOPSIS
	    Set's the location to $env:HOME, the default HOME directory
#>

  #Requires -Version 6.0

  Set-Location $env:HOME
}

function..{
<#
	.SYNOPSIS
	    Set's the location to a directory up a level
#>

  #Requires -Version 6.0

  Set-Location ..
}

function Edit-Profile {
<#
	.SYNOPSIS
	    Opens an editor for editing the default $PROFILE.
	.DESCRIPTION
	  Uses Edit-Item to edit the $PROFILE variable.
#>

  #Requires -Version 6.0

  Edit-Item $PROFILE
}

function Edit-WTF {
<#
	.SYNOPSIS
	    Opens an editor for editing the WTF Module.
	.DESCRIPTION
	    Uses Edit-Item to edit the $WTF_MODULE variable
#>

  #Requires -Version 6.0

  Edit-Item $WTF_MODULE
}

function Update-Computer {
<#
	.SYNOPSIS
	    Executes update function for Flatpak and Fedora DNF.
	.DESCRIPTION
	    Calls the update function for Flatpak and then executes the update function forFedora DNF as root.
#>

  #Requires -Version 6.0

  flatpak update
  sudo dnf upgrade --refresh
}

function Get-DiskUsage {
<#
	.SYNOPSIS
	    Formats value of Csv-formated df output as a table.
	.DESCRIPTION
	  Takes the value of specific fields from df, formats spaces as commas, and converts this data to proper Csv-Formated data. This data is then imported into a table constructed to take in this data. This table is then display.
	.PARAMETER PATH
	   Providing a path will locate where a specific folder is mounted from.
	.OUTPUTS
	   Formatted Table with data from df command.
	.EXAMPLE
	    Get-DiskUsage -Path /home
#>

  #Requires -Version 6.0

  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $false)]
    [string]$Path
  )

  $Disc = $(df $Path --output=source,fstype,size,used,avail,pcent,file,target --human-readable | tr -s ' ' ',' | ConvertFrom-Csv)

  $Table = New-Object -TypeName System.Data.DataTable

  $Filesystem = New-Object -TypeName System.Data.DataColumn Filesystem
  $Type = New-Object -TypeName System.Data.DataColumn Type
  $Size = New-Object -TypeName System.Data.DataColumn Size
  $Used = New-Object -TypeName System.Data.DataColumn Used
  $Avail = New-Object -TypeName System.Data.DataColumn Available
  $PCent = New-Object -TypeName System.Data.DataColumn Percentage
  $File = New-Object -TypeName System.Data.DataColumn File
  $Target = New-Object -TypeName System.Data.DataColumn Target

  $Table.Columns.Add($Filesystem)
  $Table.Columns.Add($Type)
  $Table.Columns.Add($Size)
  $Table.Columns.Add($Used)
  $Table.Columns.Add($Avail)
  $Table.Columns.Add($PCent)
  $Table.Columns.Add($File)
  $Table.Columns.Add($Target)

  foreach ($Disk in $Disc) {
    $row = $Table.NewRow()
    $row.Filesystem = $Disk.Filesystem
    $row.Type = $Disk.Type
    $row.Size = $Disk.Size
    $row.Used = $Disk.Used
    $row.Available = $Disk.Avail
    $row.Percentage = $Disk. "Use%"
    $row.File = $Disk.File
    $row.Target = $Disk.Mounted

    $Table.Rows.Add($row)
  }

  $Table | Format-Table -AutoSize
}

function Get-DefaultKernel {
<#
	.SYNOPSIS
	    Formats the output of querying the default kernel under GRUB as a table.
	.DESCRIPTION
	    Takes the output of grubby after querying the default kernel under GRUB, then outputs.
	.OUTPUTS
	    Value of default kernel under GRUB as an object containing it's filename and location.
#>

  #Requires -Version 6.0

  [CmdletBinding()]
  class Kernel{
    [string]$Name
    [string]$Location
  }

  $Kern = [Kernel]::new()
  $Output = (Invoke-Sudo grubby --default-kernel)

  $Kern.Name = Split-Path -Path $Output -Leaf
  $Kern.Location = $Output

  $Kern | Format-Table -AutoSize
}

function Invoke-Sudo {
<#
	.SYNOPSIS
	    Wrapper for Superuser Do (sudo).
	.DESCRIPTION
	    Takes mandatory parameters provided and Invokes the sudo command.
	.INPUTS
	    Mandatory parameters as commands.
	.EXAMPLE
	    Invoke-Sudo dnf install pwsh-preview.
	.EXAMPLE
	    Invoke-Sudo rm -rf /c/system32
#>

  #Requires -Version 6.0

  [CmdletBinding()]
  param(
    [Parameter(ValueFromRemainingArguments = $true,Mandatory = $true)]
    [string[]]$args = $args
  )

  /usr/bin/env sudo $env:SHELL -nologo -Command "& $args"
}

function Edit-PrivilegedItem {
<#
	.SYNOPSIS
	    Allows Editing of Administrator Configuration Files.
	.DESCRIPTION
	    Calls Invoke-Sudo with the editor vim to edit a given file as the superuser.
	.PARAMETER Item
	    Item to edit.
	.INPUTS
	    Items to Edit.
	.EXAMPLE
	    Edit-PrivilegedItem /etc/passwd
#>

  #Requires -Version 6.0

  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true,Position = 1)]
    [string]$Item
  )

  Invoke-Sudo vim $Item
}

function Get-ComputerInfo {
<#
	.SYNOPSIS
	    Formats the values of uname outputs as a table.
	.DESCRIPTION
	    Stores multiple values of uname outputs in an object and displays the object as a table.
	.OUTPUTS
	    Table-formatted uname -a.
#>

  #Requires -Version 6.0

  [CmdletBinding()]
  class ComputerInfo{
    [string]$Kernel
    [string]$Hostname
    [string]$KernelRelease
    [string]$KernelVersion
    [string]$Hardware
    [string]$Processor
    [string]$Platform
    [string]$OperatingSystem
  }

  $Comp = [ComputerInfo]::new()

  $Comp.Kernel = (uname --kernel-name)
  $Comp.Hostname = (uname --nodename)
  $Comp.KernelRelease = (uname --kernel-release)
  $Comp.KernelVersion = (uname --kernel-version)
  $Comp.Hardware = (uname --machine)
  $Comp.Processor = (uname --processor)
  $Comp.Platform = (uname --hardware-platform)
  $Comp.OperatingSystem = (uname --operating-system)

  $Comp
}
