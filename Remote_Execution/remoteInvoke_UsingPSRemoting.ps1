

$Credential = Get-Credential
$UserName = $Credential.UserName
$Password = $Credential.GetNetworkCredential().Password
$HostName = [system.net.dns]::GetHostByAddress("10.189.118.0").HostName

#Invoke-Command -ComputerName $HostName -port 5985 -credential $Credential -ErrorAction Stop -ScriptBlock {Invoke-Expression -Command:"cmd.exe /c 'mkdir C:\Test'"}
#Invoke-Command -ComputerName $HostName -port 5985 -credential $Credential -ErrorAction Stop -ScriptBlock {Invoke-Expression -Command:"C:\Test\test.ps1"}
Invoke-Command -ComputerName $HostName -port 5985 -credential $Credential -ErrorAction Stop -ScriptBlock {Invoke-Expression -Command:"cmd.exe /c 'C:\Test\test.bat'"}

Write-Host "Before Sleep"
sleep 180
Write-Host "After Sleep"

Invoke-Command -ComputerName $HostName -port 5985 -credential $Credential -ErrorAction Stop -ScriptBlock {Invoke-Expression -Command:"cmd.exe /c 'C:\Test\runSlave.bat'"}
#$IPAdd= "10.189.126.98"
#[system.net.dns]::GetHostByAddress($IPAdd)
#[system.net.dns]::GetHostByAddress("10.189.118.0").HostName