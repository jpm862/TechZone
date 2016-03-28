<#
.SYNOPSIS
    Registry manipulation via standard powershell
.DESCRIPTION
	Samples to read, write to registry using standard powershell commands
	
	This isn't my preferred method for scripting the registry, but it is the fastest 
	way to access the registry from the command line.  When scripting, I typically 
	use WMI.  It is flexible and robust and has the best remoting capabilities of 
	any of the technologies I've used.
	
.NOTES
    File Name  : Registry_Powershell.ps1
    Author     : Janice McCullough
    Requires   : PowerShell Version 3.0
.LINK
	https://technet.microsoft.com/en-us/library/dd315394.aspx
.EXAMPLE
#>
cls

#create a registry key for playing in
$regKey = "HKCU:\JPMTechZonePS"

New-Item -Path $regKey -ItemType Registry -Force | Out-Null

#add some values to the new reg key
New-ItemProperty -Path $regKey -Name "StringTest" -Value "Hello World!" -PropertyType String | Out-Null
New-ItemProperty -Path $regKey -Name "DWordTest" -Value 1 -PropertyType dword | Out-Null
<#   

	property type values
		Binary
		DWord
		ExpandString
		MultiString
		String
		QWord
#>


#get values from the registry
$data = Get-ItemProperty -Path $regKey -Name "StringTest"
Write-Host $data.StringTest
$data = Get-ItemProperty -Path $regKey -Name "DWordTest"
Write-Host $data.DWordTest

#Stopping to check the registry
$msg = "Stopping to check registry entries were created"
$result = [System.Windows.Forms.MessageBox]::Show($msg, "Continue?", [System.Windows.Forms.MessageBoxButtons]::OK)

#delete one registry entry
Remove-ItemProperty -Path $regKey -Name "DwordTest"
$msg = "Stopping to check registry entry was deleted"
$result = [System.Windows.Forms.MessageBox]::Show($msg, "Continue?", [System.Windows.Forms.MessageBoxButtons]::OK)

Remove-Item -Path $regKey

Write-Host ""
Write-Host "Done"