# Based on https://docs.microsoft.com/en-us/windows-server/security/windows-services/security-guidelines-for-disabling-system-services-in-windows-server
# "OneSyncSvc", "XblAuthManager", "XblGameSave" don't seem to exist in Windows Server 2019

Configuration disable-service {
    Import-DscResource -ModuleName PSDesiredStateConfiguration -Name ServiceSet

    Node localhost {
        ServiceSet DisableService {
            Name = @( "AxInstSV", "bthserv", "CDPUserSvc", "PimIndexMaintenanceSvc", "dmwappushservice", "MapsBroker", "lfsvc", "SharedAccess", "lltdsvc", "wlidsvc", "NgcSvc", "NgcCtnrSvc", "NcbService", "PhoneSvc", "Spooler", "PrintNotify", "PcaSvc", "QWAVE", "RmSvc", "SensorDataService", "SensrSvc", "SensorService", "ShellHWDetection", "ScDeviceEnum", "SSDPSRV", "WiaRpc", "TabletInputService", "upnphost", "UserDataSvc", "UnistoreSvc", "WalletService", "Audiosrv", "AudioEndpointBuilder", "FrameServer", "stisvc", "wisvc", "icssvc", "WpnService", "WpnUserService" )
            StartupType = "Disabled"
            State = "Stopped"

        }
    }
}
disable-service