Configuration Bootstrap {
    Import-DscResource -ModuleName PSDesiredStateConfiguration -Name Registry, Script

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
            GetScript = { @{ Result = ( Get-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP ).Enabled } }
        }

        Script EnableICMPFirewallRule {
            SetScript = { Enable-NetFirewallRule -Name vm-monitoring-icmpv4 }
            TestScript = { ( Get-NetFirewallRule -Name vm-monitoring-icmpv4 ).Enabled }
            GetScript = { @{ Result = ( Get-NetFirewallRule -Name vm-monitoring-icmpv4 ).Enabled } }
        }
    }
}
Bootstrap