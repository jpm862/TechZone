<#
.SYNOPSIS
    Basic language syntax samples
.DESCRIPTION
	
	
.NOTES
    File Name  : Basics_Powershell.ps1
    Author     : Janice McCullough
    Requires   : PowerShell Version 3.0
.USEFUL LINKS
	
.EXAMPLE
#>
cls

#declare variables
$name = "Peter"
$veggie = " Pumpkin"
$action = " Eater"

$character = $name + $veggie + $action
Write-host $character

Write-Host
Write-Host "Done"