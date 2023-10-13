$CSV = Import-CSV -Delimiter "," -Path .\labs\1-powershell-base\resources\tp7_data.csv

Connect-AzureAD
function Get-RandomPassword {
    [CmdletBinding()]
    [OutputType([String])]
    Param
    (
        [Int]$Length = 14,

        [Switch][Bool]$Simple
    )

    Begin {
        $SimpleChars = ('!ABCDEFGHKLMNPRSTUVWXYZ!abcdefghkmnprstuvwxyz!123456789!').ToCharArray()
        $ComplexChars = (33..122 | ForEach-Object {([char]$_).ToString()}).ToCharArray()
    }

    Process {
        if ($Simple) {
            $Chars = $SimpleChars
        }
        else {
            $Chars = $ComplexChars
        }

        Write-Output -InputObject ((Get-Random -Count $Length -InputObject $Chars) -join '')
    }

    End {
    }
}

$columnPassword = @{
    Name  = "Password"
    Expression = {Get-RandomPassword -Length 15}
}

$columnSamAccountName = @{
    Name  = "SamAccountName"
    Expression = {"{0}.{1}" -f $PSItem.surname[0], ($PSItem.name[0..10] -join "")}
}

$columnMail = @{
    Name  = "Mail"
    Expression = {"{0}.{1}@testesgilab.onmicrosoft.com" -f $PSItem.surname[0], ($PSItem.name[0..10] -join "")}
}

$CSV = $CSV | Select-Object *, $columnPassword, $columnSamAccountName, $columnMail

$scriptBlock = {
    param($scriptBlockVar)

    $Name = "{0} {1}" -f $scriptBlockVar.surname, $scriptBlockVar.name
    New-ADUser -path "OU=Test,DC=Test,DC=lab" -Name $name -Surname $scriptBlockVar.name -GivenName $scriptBlockVar.surname -AccountPassword $(ConvertTo-SecureString -Force -AsPlainText $scriptBlockVar.Password) -Enabled $true -SamAccountName $scriptBlockVar.SamAccountName
}

foreach($line in $CSV){
    $Name = "{0} {1}" -f $line.surname, $line.name
    $PasswordProfile=New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password=$line.Password
    New-AzureADUser -AccountEnabled $true -DisplayName $Name -GivenName $line.surname -Surname $line.name -UserPrincipalName $line.Mail -MailNickName $line.SamAccountName -PasswordProfile $PasswordProfile
}