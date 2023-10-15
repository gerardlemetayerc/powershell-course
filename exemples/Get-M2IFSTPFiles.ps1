function Get-M2ISFTPFiles
{
    param(
        [string]$servername,
        [string]$path = "/home/charles/bkp",
        [PSCredential]$credential,
        [string]$databaseServer,
        [string]$dbname
    )

    $session = New-SFTPSession -ComputerName $servername -Credential $credential -AcceptKey

    $sftpFiles = Get-SFTPChildItem -Recurse -SFTPSession $session -Path $path | 
                 Where-Object {-not $_.IsDirectory} |
                 Select-Object FullName, Name, 
                 @{Name="TimeStampFromName";Expression={
                     $_.Name -match "\d{4}-\d{2}-\d{2}" | Out-Null; $matches[0]
                 }},
                 @{Name="DBName";Expression={ ($_.Name -split "-")[0] }},
                 @{Name="Server";Expression={ ($_.FullName -split "/")[4] }}

    # Combine filters
    $filteredFiles = $sftpFiles | Where-Object {
        ( -not $databaseServer -or $_.Server -like $databaseServer ) -and
        ( -not $dbname -or $_.DBName -like $dbname )
    }

    return $filteredFiles | Sort Server, DBName, TimeStampFromName
}
