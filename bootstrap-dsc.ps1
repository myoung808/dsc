Configuration EnableRDP {
    Node localhost {
        Registry fDenyTSConnections {
            Ensure = "Present"
            Key = "HKLM:\SYSTEM\CurentControlSet\Control\Terminal Server"
            ValueName = "fDenyTSConnections"
            ValueData = "0"
            ValueType = "Dword"
        }
    }
}
EnableRDP