Configuration PSGalleryModules
{
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    Import-DscResource -ModuleName PackageManagement

    PackageManagementSource SourceRepository
    {
        Ensure      = "Present"
        Name        = "MyNuget"
        ProviderName= "Nuget"
        SourceUri  = "http://nuget.org/api/v2/"
        InstallationPolicy ="Trusted"
    }

    PackageManagementSource PSGallery
    {
        Ensure      = "Present"
        Name        = "psgallery"
        ProviderName= "PowerShellGet"
        SourceUri   = "https://www.powershellgallery.com/api/v2"
        InstallationPolicy ="Trusted"
    }

    PackageManagement PSModuleCISDSC
    {
        Ensure               = "Present"
        Name                 = "CISDSC"
        Source               = "PSGallery"
        DependsOn            = "[PackageManagementSource]PSGallery"
    }

    PackageManagement PSModulePSWindowsUpdate
    {
        Ensure               = "Present"
        Name                 = "PSWindowsUpdate"
        Source               = "PSGallery"
        DependsOn            = "[PackageManagementSource]PSGallery"
    }

}
PSGalleryModules