# WinSCP PowerShell Module Wrapper

[![Build status](https://ci.appveyor.com/api/projects/status/dgoq6w2xsfh52m6h?svg=true)](https://ci.appveyor.com/project/dotps1/winscp)

# MAJOR OVERHAUL IN PROGRESS
I have been revisiting this module as of late, add making some major changes, they will be released when the WinSCP Assembly 5.10 is released.  Here are some of the key points as of 2017-07-01:

1. New functions:
    * Get-WinSCPSession
    * Get-WinSCPSshHostKeyFingerprint
    * New-WinSCPSessionOption
    * New-WinSCPTransferResumeSupport
2. The `New-WinSCPSession` has been split into two functions, most of the configurations for the session have been moved to the `New-WinSCPSessionOption` command.  This will mimic the functionality of `New-CimSessionOption` and `New-CimSession`.
    * `PS C:\> New-WinSCPSession -SessionOption (New-WinSCPSessionOption -HostName ftp.dotps1.github.io)`
3. The session is not longer auto disposed when passed in the pipeline, handling the session state is now your responsibility.
4. I am completely overhauling the help, and adding more examples using Sapiens Help Writer.
5. The `New-WinSCPSessionOption` defaults to using Anonymous authentication.
6. And much much more!


## Use at your own risk.

This module can be installed from the [PowerShellGet Gallery](https://www.powershellgallery.com/packages/WinSCP/),  You need [WMF 5](https://www.microsoft.com/en-us/download/details.aspx?id=44987) to use this feature.
```PowerShell
# Inspect
Save-Module -Name WinSCP -Path <Path>

# Install
Install-Module -Name WinSCP
```

## WinSCP Cmdlets

* [ConvertTo-WinSCPEscapedString](http://dotps1.github.io/WinSCP/ConvertTo-WinSCPEscapedString.html)
* [Get-WinSCPChildItem](http://dotps1.github.io/WinSCP/Get-WinSCPChildItem.html)
* [Get-WinSCPItem](http://dotps1.github.io/WinSCP/Get-WinSCPItem.html)
* [Get-WinSCPFileChecksum](http://dotps1.github.io/WinSCP/Get-WinSCPItemChecksum.html)
* Get-WinSCPSession
* Get-WinSCPSshHostKeyFingerprint
* [Invoke-WinSCPCommand](http://dotps1.github.io/WinSCP/Invoke-WinSCPCommand.html)
* [Move-WinSCPItem](http://dotps1.github.io/WinSCP/Move-WinSCPItem.html)
* [New-WinSCPItem](http://dotps1.github.io/WinSCP/New-WinSCPItem.html)
* [New-WinSCPItemPermission](http://dotps1.github.io/WinSCP/New-WinSCPItemPermission.html)
* [New-WinSCPSession](http://dotps1.github.io/WinSCP/New-WinSCPSession.html)
* New-WinSCPSessionOption
* [New-WinSCPTransferOption](http://dotps1.github.io/WinSCP/New-WinSCPTransferOption.html)
* New-WinSCPTransferResumeSupport
* [Receive-WinSCPItem](http://dotps1.github.io/WinSCP/Receive-WinSCPItem.html)
* [Remove-WinSCPItem](http://dotps1.github.io/WinSCP/Remove-WinSCPItem.html)
* [Remove-WinSCPSession](http://dotps1.github.io/WinSCP/Remove-WinSCPSession.html)
* [Rename-WinSCPItem](http://dotps1.github.io/WinSCP/Rename-WinSCPItem.html)
* [Send-WinSCPItem](http://dotps1.github.io/WinSCP/Send-WinSCPItem.html)
* [Start-WinSCPConsole](http://dotps1.github.io/WinSCP/Start-WinSCPConsole.html)
* [Sync-WinSCPPath](http://dotps1.github.io/WinSCP/Sync-WinSCPPath.html)
* [Test-WinSCPPath](http://dotps1.github.io/WinSCP/Test-WinSCPPath.html)


## Examples

Example 1:

```PowerShell
# Capture credentials.
$credential = Get-Credential

# Set the options to open the WinSCPSession with
$sessionOption = New-WinSCPSessionOption -HostName ftp.dotps1.github.io -Protocol Ftp -Credential $credential

# Open the session using the SessionOptions object.
# New-WinSCPSession sets the PSDefaultParameterValue of the WinSCPSession parameter for all other cmdlets to this WinSCP.Session object.
# You can set it to a variable if you would like, but it is only necessary if you will have more then one session open at a time.
New-WinSCPSession -SessionOption $sessionOption

# Use that session to create a new Directory.
New-WinSCPItem -Path './remoteDirectory' -ItemType Directory

# Upload a file to the directory.
Send-WinSCPItem -Path 'C:\localDirectory\localFile.txt' -Destination '/remoteDirectory/'

# Close the session object.
Remove-WinSCPSession
```

This is still a beta version, with most of the functionality available with WinSCP.

Check back regularly for updates.


This project is licensed with GNU GENERAL PUBLIC LICENSE.
