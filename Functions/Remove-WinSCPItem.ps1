﻿<#
.SYNOPSIS
    Removes and item from an active WinSCP Session.
.DESCRIPTION
    Removes and item, File or Directory from a remote sources.  This action will recurse if a the $Path value is a directory.
.INPUTS.
    WinSCP.Session.
.OUTPUTS.
    None.
.PARAMETER WinSCPSession
    A valid open WinSCP.Session, returned from Open-WinSCPSession.
.PARAMETER Path
    Full path to remote directory followed by slash and wildcard to select files or subdirectories to remove. 
.EXAMPLE
    PS C:\> Open-WinSCPSession -SessionOptions (New-WinSCPSessionOptions -Hostname myftphost.org -Username ftpuser -password "FtpUserPword" -Protocol Ftp) | Remove-WinSCPItem -Path "rDir/rFile.txt"

    Removals                  Failures IsSuccess
    --------                  -------- ---------
    {/rDir/rSubDir/rFile.txt} {}       True
.EXAMPLE
    PS C:\> $session = New-WinSCPSessionOptions -Hostname myftphost.org -Username ftpuser -password "FtpUserPword" -SshHostKeyFingerprint "ssh-rsa 1024 xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx" | Open-WinSCPSession
    PS C:\> Remove-WinSCPItem -WinSCPSession $session -Path "rDir/rFile.txt"

    Removals                  Failures IsSuccess
    --------                  -------- ---------
    {/rDir/rSubDir/rFile.txt} {}       True
.NOTES
    If the WinSCPSession is piped into this command, the connection will be disposed upon completion of the command.
.LINK
    http://dotps1.github.io/WinSCP
.LINK
    http://winscp.net/eng/docs/library_session_removefiles
#>
Function Remove-WinSCPItem
{
    [CmdletBinding(SupportsShouldProcess = $true,
                   ConfirmImpact = 'High')]
    [OutputType([Void])]

    Param
    (
        [Parameter(Mandatory = $true,
                   ValueFromPipeLine = $true)]
        [ValidateScript({ if ($_.Open)
            { 
                return $true 
            }
            else
            { 
                throw 'The WinSCP Session is not in an Open state.' 
            } })]
        [WinSCP.Session]
        $WinSCPSession,

        [Parameter(Mandatory = $true)]
        [String[]]
        $Path
    )

    Begin
    {
        $sessionValueFromPipeLine = $PSBoundParameters.ContainsKey('WinSCPSession')
    }

    Process
    {
        foreach ($item in $Path.Replace('\','/'))
        {
            if ($PSCmdlet.ShouldProcess($item))
            {
                $results = $WinSCPSession.RemoveFiles($item)

                if (-not ($results.IsSuccess))
                {
                    Write-Error -Message $results.Failures
                }
                else
                {
                    $results
                }
            }
        } 
    }

    End
    {
        if (-not ($sessionValueFromPipeLine))
        {
            Remove-WinSCPSession -WinSCPSession $WinSCPSession
        }
    }
}