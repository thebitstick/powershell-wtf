function Edit-Item {
<#
	.SYNOPSIS
	    Opens an Item with the default $EDITOR.
	.DESCRIPTION
	    Edit-Item will use the executable name in $EDITOR to open an Item parameter for editing.
	.PARAMETER Item
	.INPUTS
	    An item (preferrably text).
	.EXAMPLE
	    Edit-Item xd.txt
	.EXAMPLE
	    Edit-Item config.ini
#>

  #Requires -Version 6.0

  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true,Position = 1)]
    [string]$Item
  )

  & $EDITOR "$Item"
}

function Edit-PrivilegedItem {
<#
        .SYNOPSIS
            Allows Editing of Administrator Configuration Files.
        .DESCRIPTION  
            Calls Invoke-Sudo with the default editor $EDITOR to edit a given file as the superuser.  
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

  Invoke-Sudo "$EDITOR" $Item
}

function New-PrivilegedItem {
<#
	.SYNOPSIS
	    Calls New-Item with Invoke-Sudo
	.EXAMPLE
	    New-PrivilegedItem -ItemType File /var/lib/flatpak/override/global
	    New-PrivilegedItem -ItemType Directory C:\etc\dpkg\xd.conf
#>

  #Requires -Version 6.0

  if (!$args) {
    Write-Error -Message "Invalid input. Must contain arguments or item."
    return
  }

  Invoke-Sudo New-Item "$args"
}

function Remove-PrivilegedItem {
<#
        .SYNOPSIS
            Calls Remove-Item with Invoke-Sudo
        .EXAMPLE
            Remove-PrivilegedItem /var/lib/flatpak/override/global
            Remove-PrivilegedItem C:\etc\dpkg\xd.conf
#>

  #Requires -Version 6.0

  if (!$args) {
    Write-Error -Message "Invalid input. Must contain arguments or item."
    return
  }

  Invoke-Sudo Remove-Item "$args"
}

function Clear-PrivilegedItem {
<#
        .SYNOPSIS
            Calls Clear-Item with Invoke-Sudo
        .EXAMPLE
            Clear-PrivilegedItem /var/lib/flatpak/override/global
            Clear-PrivilegedItem C:\etc\dpkg\xd.conf
#>

  #Requires -Version 6.0

  if (!$args) {
    Write-Error -Message "Invalid input. Must contain arguments or item."
    return
  }

  Invoke-Sudo Clear-Item "$args"
}

function Copy-PrivilegedItem {
<#
        .SYNOPSIS
            Calls Copy-Item with Invoke-Sudo
        .EXAMPLE
            Copy-PrivilegedItem /var/lib/flatpak/override/global C:\etc\dpkg\xd.conf
            Copy-PrivilegedItem C:\etc\dpkg\xd.conf /var/lib/flatpak/override/global
#>

  #Requires -Version 6.0

  if (!$args) {
    Write-Error -Message "Invalid input. Must contain arguments or item."
    return
  }

  Invoke-Sudo Copy-Item "$args"
}

function Get-PrivilegedItem {
<#
        .SYNOPSIS
            Calls Get-Item with Invoke-Sudo
        .EXAMPLE
            Get-PrivilegedItem /var/lib/flatpak/override/global
            Get-PrivilegedItem C:\etc\dpkg\xd.conf
#>

  #Requires -Version 6.0

  if (!$args) {
    Write-Error -Message "Invalid input. Must contain arguments or item."
    return
  }

  Invoke-Sudo Get-Item "$args"
}

function Move-PrivilegedItem {
<#
        .SYNOPSIS
            Calls Move-Item with Invoke-Sudo
	.EXAMPLE
	    Move-PrivilegedItem /var/lib/flatpak/overrides/global C:\etc\dpkg\xd.conf
#>

  #Requires -Version 6.0

  if (!$args) {
    Write-Error -Message "Invalid input. Must contain arguments or item."
    return
  }

  Invoke-Sudo Move-Item "$args"
}

function Set-PrivilegedItem {
<#
        .SYNOPSIS
            Calls Set-Item with Invoke-Sudo
        .EXAMPLE
            Set-PrivilegedItem -Path /var/lib/flatpak/override/global -Value "xd"
            Set-PrivilegedItem -Path C:\etc\dpkg\xd.conf -Value "xd"
#>

  #Requires -Version 6.0

  if (!$args) {
    Write-Error -Message "Invalid input. Must contain arguments or item."
    return
  }

  Invoke-Sudo Set-Item "$args"
}

function Invoke-PrivilegedItem {
<#
        .SYNOPSIS
            Calls Invoke-Item with Invoke-Sudo
        .EXAMPLE
            Invoke-PrivilegedItem /var/lib/flatpak/override/global
            Invoke-PrivilegedItem C:\etc\dpkg\xd.conf
#>

  #Requires -Version 6.0

  if (!$args) {
    Write-Error -Message "Invalid input. Must contain arguments or item."
    return
  }

  Invoke-Sudo Invoke-Item "$args"
}
