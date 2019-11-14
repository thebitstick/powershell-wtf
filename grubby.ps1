class Kernel {
	[string]$Name
        [string]$Location
}

$kern = [Kernel]::New()
$out = (Invoke-Sudo grubby --default-kernel)

$kern.Name = Split-Path $out -leaf
$kern.Location = $out

$kern
