#$Computer = "10.189.118.0"
#Invoke-Command -ComputerName $Computer -ScriptBlock { Start-Process cmd }
#start-process psexec
#& H:\PSTool\PsExec.exe \\10.189.118.0 cmd 

$Credential = Get-Credential
$UserName = $Credential.UserName
$Password = $Credential.GetNetworkCredential().Password
start-process H:\PSTool\PsExec.exe
H:\PSTool\PsExec.exe \\10.189.118.0 -u $UserName -p $Password -h cmd "echo Hello World"
