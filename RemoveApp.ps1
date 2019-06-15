& C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe -Command {Import-Module WebAdministration; Set-ItemProperty 'IIS:\sites\Default Web Site' -Name physicalPath -Value C:\inetpub\wwwroot}

& C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe -Command { Remove-Item –path C:\NetCoreApp\publish –recurse}