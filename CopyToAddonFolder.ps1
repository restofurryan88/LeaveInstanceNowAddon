param (
    [String]$addonsFolderPath
)

$pAddonsFolderPath = ""
$pAddonFolderName = "LeaveInstanceNow"
$pAddonFolderSource = ".\$pAddonFolderName\*"
if ([String]::IsNullOrWhiteSpace($addonsFolderPath)) {
    $pAddonsFolderPath = "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns"
}
else {
    $pAddonsFolderPath = $addonsFolderPath
}
Write-Host "Addons Folder Path: $pAddonsFolderPath"
$pDestinationFolder = Join-Path -Path $pAddonsFolderPath -ChildPath $pAddonFolderName

Write-Host "Copying files to '$pDestinationFolder'..."
if([System.IO.Directory]::Exists($pDestinationFolder)) {
    Remove-Item -Path $pDestinationFolder -Recurse
}
else {
    [System.IO.Directory]::CreateDirectory($pDestinationFolder)
}

Copy-Item $pAddonFolderSource -Destination $pDestinationFolder -Force -Recurse -Verbose