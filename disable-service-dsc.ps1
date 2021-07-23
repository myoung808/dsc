Configuration disable-service {
    Import-DscResource -ModuleName PSDesiredStateConfiguration -Name Service

    Node localhost {
        foreach ($s in $Node.Services)
        {
            service $s.Name
            {
                Name = $s.Name;
                StartupType = $s.StartType;
                State = $s.State

            }
        }
    }
}
disable-service