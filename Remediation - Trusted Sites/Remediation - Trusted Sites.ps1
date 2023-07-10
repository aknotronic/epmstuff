# Template for Proactive Remediations


#Try-Catch for error handling
Try {
    # After you export the RegKey, be sure you copy/paste it HERE: https://reg2ps.azurewebsites.net/
    # This will create the detection script and the remediation script. 
    # Reg2CI (c) 2021 by Roger Zander

    if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\computer") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\intranet" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\intranet") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\intranet" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\trusted") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\trusted" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\internet") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\internet" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\restricted") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\restricted" -force -ea SilentlyContinue };
	
    New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\computer' -Name 'https' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\intranet' -Name 'https' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\trusted' -Name 'https' -Value 2 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\internet' -Name 'https' -Value 3 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\restricted' -Name 'https' -Value 4 -PropertyType DWord -Force -ea SilentlyContinue;
    
}Catch{
    #captures and reports the exception errors of the script
    Write-Host $_.Exception
    Exit 2000
}