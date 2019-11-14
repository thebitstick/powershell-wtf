<#
	.SYNOPSIS
	    Formats value of Csv-formated df output as a table
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
