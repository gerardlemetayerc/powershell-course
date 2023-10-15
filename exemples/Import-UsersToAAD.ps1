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

    $SimpleChars = ('!ABCDEFGHKLMNPRSTUVWXYZ!abcdefghkmnprstuvwxyz!123456789!').ToCharArray()
    $ComplexChars = (33..122 | ForEach-Object {([char]$_).ToString()}).ToCharArray()

    $Chars = if ($Simple) { $SimpleChars } else { $ComplexChars }

    return ((Get-Random -Count $Length -InputObject $Chars) -join '')
}

function GenerateUserInfo {
    param($User)

    $SamAccountName = "{0}.{1}" -f $User.surname[0], ($User.name[0..10] -join "")
    $Mail = "{0}.{1}@testesgilab.onmicrosoft.com" -f $User.surname[0], ($User.name[0..10] -join "")
    $Name = "{0} {1}" -f $User.surname, $User.name

    return @{
        User           = $User
        SamAccountName = $SamAccountName
        Mail           = $Mail
        Name           = $Name
        Password       = Get-RandomPassword -Length 15
    }
}

$CSV | ForEach-Object {
    $UserInfo = GenerateUserInfo -User $_

    # Create AzureAD User
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = $UserInfo.Password

    New-AzureADUser -AccountEnabled $true -DisplayName $UserInfo.Name -GivenName $_.surname -Surname $_.name -UserPrincipalName $UserInfo.Mail -MailNickName $UserInfo.SamAccountName -PasswordProfile $PasswordProfile

    # Create AD User (assuming you'd still like to have this)
    New-ADUser -path "OU=Test,DC=Test,DC=lab" -Name $UserInfo.Name -Surname $_.name -GivenName $_.surname -AccountPassword $(ConvertTo-SecureString -Force -AsPlainText $UserInfo.Password) -Enabled $true -SamAccountName $UserInfo.SamAccountName
}