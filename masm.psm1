function Build-Assembly {
<#
	.SYNOPSIS
	  Simplifies the linkage and assembly on Microsoft Assembly programs.
	.DESCRIPTION
	  Uses the masm assembler through Wine to assemble Assembly programs.
	.INPUTS
	  One Microsoft Assembly program file.
	.OUTPUTS
	  If no error, then an executable is produced.
	.EXAMPLE
	  Build-Assembly -Path AddTwo.asm
#>

  #Requires -Version 6.0

  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [string]$Path
  )

  $ErrorActionPreference = 'Stop'

  Set-Variable -Name WINEPREFIX -Value "$env:HOME/.wine"

  New-Variable -Name FileName
  New-Variable -Name Extension

  $FileName = (Get-Item $Path).BaseName
  $Extension = (Get-Item $Path).Extension

  if ($Extension -ne ".asm") {
    Write-Error "Input a valid MASM file."
  }

  wine ml -nologo -c -coff -Zi "$Path"

  wine link /NOLOGO /SUBSYSTEM:CONSOLE /ENTRY:main /LIBPATH:'C:\Irvine' irvine32.lib kernel32.lib user32.lib "" $FileName".obj"
}
