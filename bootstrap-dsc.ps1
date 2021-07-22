Configuration Bootstrap {
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

    Import-DscResource -ModuleName PSDesiredStateConfiguration -Name Registry

    Node localhost {
        Registry EnableRDP {
            Ensure = "Present"
            Key = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server"
            ValueName = "fDenyTSConnections"
            ValueData = "0"
            ValueType = "Dword"
        }

        Script EnableRDPFirewallRule {
            SetScript = { Enable-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP }
            TestScript = { ( Get-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP ).Enabled }
            GetScript = { @{ Result = (Get-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP).Enabled } }
        }
    }
}
Bootstrap