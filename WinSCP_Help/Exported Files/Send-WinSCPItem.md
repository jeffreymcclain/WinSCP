﻿# Send-WinSCPItem

## SYNOPSIS
Uploads one or more files from local directory to remote directory.

## SYNTAX

### Set 1
```
Send-WinSCPItem [-WinSCPSession] <Session> [-LocalPath] <String[]> [[-RemotePath] <String>] [[-TransferOptions] <TransferOptions>] [-Remove] [<CommonParameters>]
```

## DESCRIPTION
Uploads one or more files from local directory to remote directory.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\> Send-WinSCPItem -LocalPath ftpDoc3.txt


   Destination: \

IsSuccess FileName
--------- --------
True      ftpDoc3.txt
```

### EXAMPLE 2

```powershell
PS C:\> New-Item -Name NewItem.txt -ItemType File -Value "Hello World!"


    Directory: C:\


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----         7/5/2017   2:48 PM             12 NewItem.txt


PS C:\ Send-WinSCPItem -LocalPath NewItem.txt -Remove


   Destination: \

IsSuccess FileName
--------- --------
True      NewItem.txt
```

## PARAMETERS

### WinSCPSession
It represents a session and provides methods for manipulating remote files over SFTP, SCP or FTP session.

```yaml
Type: Session
Parameter Sets: Set 1
Aliases: 

Required: true
Position: 0
Default Value: 
Pipeline Input: True (ByValue)
```

### LocalPath
Full path to local file or directory to upload. Filename in the path can be replaced with Windows wildcard to select multiple files.

```yaml
Type: String[]
Parameter Sets: Set 1
Aliases: Path

Required: true
Position: 1
Default Value: 
Pipeline Input: True (ByPropertyName)
```

### RemotePath
Full path to upload the file to. When uploading multiple files, the filename in the path should be replaced with operation mask or omitted (path ends with slash).

```yaml
Type: String
Parameter Sets: Set 1
Aliases: Destination

Required: false
Position: 2
Default Value: 
Pipeline Input: false
```

### Remove
When set to true, deletes source local file(s) after transfer. Defaults to false.

```yaml
Type: SwitchParameter
Parameter Sets: Set 1
Aliases: 

Required: false
Position: named
Default Value: 
Pipeline Input: false
```

### TransferOptions
Transfer options. Defaults to null, what is equivalent to New-WinSCPTransferOption.

```yaml
Type: TransferOptions
Parameter Sets: Set 1
Aliases: 

Required: false
Position: 3
Default Value: 
Pipeline Input: false
```

### \<CommonParameters\>
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### WinSCP.Session
System.String[]


## OUTPUTS

### WinSCP.TransferOperationResult


## NOTES

## RELATED LINKS

[Online version:](https://dotps1.github.io/WinSCP/Send-WinSCPItem.html)

[WinSCP reference:](https://winscp.net/eng/docs/library_session_putfiles)


*Generated by:  PowerShell HelpWriter 2017 v2.1.35*