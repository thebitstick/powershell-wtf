#!/usr/bin/env pwsh

if ($args[0] -eq "-Path") {
	$disc = $(sudo df $args[1] --output=source,fstype,size,used,avail,pcent,file,target --human-readable | tr -s ' ' ',' | ConvertFrom-Csv);
} else {
	$disc = $(sudo df --output=source,fstype,size,used,avail,pcent,file,target --human-readable | tr -s ' ' ',' | ConvertFrom-Csv);
}

$table = New-Object System.Data.DataTable;

$filesystem = New-Object System.Data.DataColumn Filesystem;
$type = New-Object System.Data.DataColumn Type;
$size = New-Object System.Data.DataColumn Size;
$used = New-Object System.Data.DataColumn Used;
$avail = New-Object System.Data.DataColumn Available;
$pcent = New-Object System.Data.DataColumn Percentage;
$file = New-Object System.Data.DataColumn File;
$target = New-Object System.Data.DataColumn Target;

$table.Columns.Add($filesystem);
$table.Columns.Add($type);
$table.Columns.Add($size);
$table.Columns.Add($used);
$table.Columns.Add($avail);
$table.Columns.Add($pcent);
$table.Columns.Add($file);
$table.Columns.Add($target);

foreach ($disk in $disc) {
	$row = $table.NewRow();
	$row.Filesystem = $disk.Filesystem;
	$row.Type = $disk.Type;
	$row.Size = $disk.Size;
	$row.Used = $disk.Used;
	$row.Available = $disk.Avail;
	$row.Percentage = $disk."Use%";
	$row.File = $disk.File;
	$row.Target = $disk.Mounted;

	$table.Rows.Add($row);
}

$table | Format-Table -Autosize;
