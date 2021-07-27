Configuration CISDSC {
    Import-DscResource -ModuleName CISDSC -Name CIS_Microsoft_Windows_Server_2019_Member_Server_Release_1809

    Node localhost {
        CIS_Microsoft_Windows_Server_2019_Member_Server_Release_1809 CISLevel1 {
            ExcludeList = @("1.1.2", "1.1.3", "18.2.5", "18.2.6", "2.3.1.5", "2.3.1.6", "2.3.6.5", "2.3.7.4", "2.3.7.5")
        }
    }
}
CISDSC