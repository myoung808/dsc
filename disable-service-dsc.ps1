# Based on https://docs.microsoft.com/en-us/windows-server/security/windows-services/security-guidelines-for-disabling-system-services-in-windows-server

$ConfigurationData = @{
    AllNodes =
    @(
        @{
           NodeName = 'localhost'
           Services = @(
               @{ Name = "AxInstSV"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "bthserv"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
#               @{ Name = "CDPUserSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
#               @{ Name = "PimIndexMaintenanceSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "dmwappushservice"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "MapsBroker"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "lfsvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "SharedAccess"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "lltdsvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "wlidsvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "NgcSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "NgcCtnrSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "NcbService"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "PhoneSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "Spooler"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "PrintNotify"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "PcaSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "QWAVE"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "RmSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "SensorDataService"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "SensrSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "SensorService"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "ShellHWDetection"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "ScDeviceEnum"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "SSDPSRV"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "WiaRpc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               #@{ Name = "OneSyncSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable; Not in Windows Server 2019
               @{ Name = "TabletInputService"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "upnphost"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
#               @{ Name = "UserDataSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
#               @{ Name = "UnistoreSvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "WalletService"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "Audiosrv"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "AudioEndpointBuilder"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "FrameServer"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "stisvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "wisvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "icssvc"; StartupType = "Disabled"; State = "Stopped" }, # OK to disable
               @{ Name = "WpnService"; StartupType = "Disabled"; State = "Stopped" } # OK to disable
#               @{ Name = "WpnUserService"; StartupType = "Disabled"; State = "Stopped" } # OK to disable
               #@{ Name = "XblAuthManager"; StartupType = "Disabled"; State = "Stopped" }, # Should disable; Not in Windows Server 2019
               #@{ Name = "XblGameSave"; StartupType = "Disabled"; State = "Stopped" } # Should disable; Not in Windows Server 2019
           )
        }
    )
}

Configuration disable-service {
    Import-DscResource -ModuleName PSDesiredStateConfiguration -Name Service

    Node localhost {
        foreach ($s in $Node.Services)
        {
            service $s.Name
            {
                Name = $s.Name;
                StartupType = $s.StartupType;
                State = $s.State

            }
        }
    }
}
disable-service -ConfigurationData $ConfigurationData