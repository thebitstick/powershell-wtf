param (
	[Parameter(ValueFromRemainingArguments=$true,Mandatory=$true)]
	[string[]]$args = $args
)

if (-not($args)) { Throw "Invoke-Sudo: You must supply commands"; }
else { /usr/bin/env sudo pwsh-preview -nologo -command "& $args"; }
