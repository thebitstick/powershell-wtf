param (
	[Parameter(ValueFromRemainingArguments=$true,Mandatory=$true)]
	[string[]]$args = $args
)

/usr/bin/env sudo pwsh-preview -nologo -command "& $args";
