'==========================================================================
' SYNOPSIS
' 	Registry manipulation via vbScript & Wscript
'
' DESCRIPTION
' 	Samples to read, write to registry using standard powershell commands
'	
'	This isn't my preferred method for scripting the registry.  WScript is quite
'  		limited and doesn't have an enumeration function.  See WMI for the most robust method
'
' NOTES 
'    File Name  : Registry_Wscript.vbs
'    Author     : Janice McCullough
'    Requires   : Wscript 5.6

' USEFUL LINKS:
'	https://msdn.microsoft.com/en-us/library/ahcz2kh6(v=vs.84).aspx
'			
'==========================================================================
option explicit

Dim objShell 'Windows Script Host Shell object
Set objShell = CreateObject("WScript.Shell")

dim regKey, newEntry, data


'create a registry key for playing in - the final backslash is what identifies this as a registry key rather than a registry values
regKey = "HKCU\JPMTechZoneVB\"
objShell.RegWrite regKey, ""

'add some values to the new reg key
newEntry = regkey + "StringTest"
objShell.RegWrite newEntry, "Hello World!", "REG_SZ"
objShell.RegWrite regkey + "DWordTest", 1, "REG_DWORD"

'this one creates the new subkey and registry entry in a single call
objshell.RegWrite regkey + "Subkey\StringTest", "Hello World 2", "REG_SZ"

'	property type values that work with wscript registry manipulation
'		REG_SZ
'		REG_EXPAND_SZ
'		REG_DWORD
'		REG_BINARY

'get values from the registry
data = objShell.RegRead(newEntry)
wscript.echo "StringTest=" + data
data = objShell.RegRead(regkey & "DWordTest")
wscript.echo "DWordTest=" & data

objshell.Popup "Stopping to check the registry"

'deleting the registry info - here is where wscript is weak.  You need to remove each subkey manually
objShell.regDelete regkey + "DWordTest"
'objShell.RegDelete newEntry

'objShell.RegDelete regKey + "Subkey\StringTest"
objshell.RegDelete regkey + "Subkey\"
objShell.regDelete regKey



wscript.echo ""
wscript.echo "Done"