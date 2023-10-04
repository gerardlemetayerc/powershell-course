function Get-M2ISFTPFiles
{
    param(
        $servername,
        $path = "/home/charles/bkp",
        $credential,
        $databaseServer,
        $dbname
    )

    $session = New-SFTPSession -ComputerName $servername -Credential $credential -AcceptKey

    $sftpFiles = Get-SFTPChildItem -Recurse -SFTPSession $session -Path $path | Where-Object {-not($_.IsDirectory)}
    $sftpFilesWithAddColumn = $sftpFiles | Select FullName, Name, 
        @{Name="TimeStampFromName";Expression={$_.Name -match "\d{4}-\d{2}-\d{2}" | Out-Null;$matches[0]}},
        @{Name="DBName";Expression={($_.Name -split("-"))[0]}},
        @{Name="Server";Expression={($_.FullName -split("/"))[4]}}
    
    if($databaseServer){
        $sftpFilesWithAddColumn = $sftpFilesWithAddColumn | Where-Object Server -like $databaseServer
    }

    if($dbname){
        $sftpFilesWithAddColumn = $sftpFilesWithAddColumn | Where-Object DBName -like $dbname
    }
    # (($sftpFilesWithAddColumn | Group DBName, Server)[2].Group | Sort -Descending TimeStampFromName | select -First 1).FullName
    return $sftpFilesWithAddColumn | Sort Server, DBName, TimeStampFromName
}
