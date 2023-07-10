# Template for Proactive Remediations

#Try-Catch for error handling
Try {
    # After you export the RegKey, be sure you copy/paste it HERE: https://reg2ps.azurewebsites.net/
    # This will create the detection script and the remediation script. 
    # Reg2CI (c) 2021 by Roger Zander

    if(-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\computer")){ Exit 1 };
	if(-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\intranet")){ Exit 1 };
	if(-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\trusted")){ Exit 1 };
	if(-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\internet")){ Exit 1 };
	if(-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\restricted")){ Exit 1 };
	
    if((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\computer' -Name 'https' -ea SilentlyContinue) -eq 0) {  } else { Exit 1 };
	if((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\intranet' -Name 'https' -ea SilentlyContinue) -eq 1) {  } else { Exit 1 };
	if((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\trusted' -Name 'https' -ea SilentlyContinue) -eq 2) {  } else { Exit 1 };
	if((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\internet' -Name 'https' -ea SilentlyContinue) -eq 3) {  } else { Exit 1 };
	if((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\website.com\restricted' -Name 'https' -ea SilentlyContinue) -eq 4) {  } else { Exit 1 };

}Catch{
    #captures and reports the exception errors of the script
    Write-Host $_.Exception
    Exit 2000
}