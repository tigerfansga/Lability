ConvertFrom-StringData -StringData @'    
    DownloadingResource             = Downloading resource '{0}' to '{1}'.
    DownloadingActivity             = Downloading '{0}'.
    DownloadStatus                  = {0:N0} of {1:N0} bytes ({2} %).
    UsingProxyServer                = Using proxy server '{0}'.
    CopyingResource                 = Copying resource '{0}' to '{1}'.
    MissingResourceFile             = Resource '{0}' does not exist.
    ResourceChecksumNotSpecified    = Resource '{0}' checksum was not specified.
    ResourceChecksumMatch           = Resource '{0}' checksum matches '{1}'.
    ResourceChecksumMismatch        = Resource '{0}' checksum does not match '{1}'.
    CalculatingResourceChecksum     = Calculating resource '{0}' checksum.
    WritingResourceChecksum         = Writing checksum '{0}' to resource '{1}'.
    CreatingDirectory               = Creating directory '{0}'.
    RemovingDirectory               = Removing directory '{0}'.
    DirectoryExists                 = Directory '{0}' already exists.
    RenamingPath                    = Renaming '{0}' to '{1}'.
    TestingPathExists               = Testing directory '{0}' exists.
    ExpandingArchive                = Expanding archive '{0}' to '{1}'.
    PendingRebootWarning            = A pending reboot is required. Please reboot the system and re-run the configuration.
    CheckingDscResource             = Checking DSC Resource '{0}\\{1}'.
    ImportingDscResource            = Importing DSC Resource '{0}\\{1}'.
    ImportingBundledDscResource     = Importing bundled DSC Resource '{0}\\{1}'.
    DscResourceAlreadyImported      = DSC Resource '{0}\\{1}' already imported.
    InvokingCommand                 = Invoking command '{0}'.
    SkippingCommand                 = Skipping command '{0}'.
    CommandParameter                = Command parameter: '{0}' = '{1}'.
    RedirectingOutput               = Redirecting {0} to '{1}'.
    StartingProcess                 = Starting process '{0} {1}'.
    ProcessExitCode                 = Process '{0}' exit code '{1}'.
    RepairingBootVolume             = Repairing boot volume '{0}:'.
    MountingDiskImage               = Mounting disk image '{0}'.
    ApplyingWindowsImage            = Applying Windows Image '{0}' to '{1}'.
    DismountingDiskImage            = Dismounting disk image '{0}'.
    RemovingDiskImage               = Removing disk image '{0}'.
    CreatingDiskImage               = Creating disk image '{0}'.
    InitializingDiskImage           = Initializing disk image '{0}'.
    CreatingDiskPartition           = Creating '{0}' disk partition.
    FormattingDiskPartition         = Formatting '{0}' disk partition.
    AddingImagePackage              = Adding package '{0}' to image '{1}'.
    AddingWindowsFeature            = Adding Windows feature(s) '{0}' to image '{1}'.
    AddingWindowsPackage            = Adding Windows package(s) '{0}' to image '{1}'.
    AddingDSCResourceModules        = Adding DSC resource modules to '{0}'.
    AddingDSCResource               = Adding DSC resource '{0}' (v{1}).
    AddingUnattendXmlFile           = Adding Unattend file '{0}'.
    CreatingBaselineSnapshot        = Creating baseline snapshot '{0}'.
    SnapshottingVirtualMachine      = Creating virtual machine '{0}' snapshot '{1}'.
    RemovingSnapshot                = Removing VM '{0}' snapshot '{1}'.
    AddingDscConfiguration          = Adding DSC file '{0}'.
    AddingBootStrapFile             = Adding BootStrap.ps1 file to '{0}'.
    AddingSetupCompleteCmdFile      = Adding SetupComplete.cmd to '{0}'.
    UsingCoreCLRSetupComplete       = Using CoreCLR 'SetupComplete.cmd'.
    UsingDefaultSetupComplete       = Using default 'SetupComplete.cmd'.
    AddingCertificate               = Adding {0} certificate '{1}'.
    CheckingForNodeFile             = Checking node configuration file '{0}'.
    TestingNodeConfiguration        = Testing node '{0}' configuration.
    SettingVMConfiguration          = Setting {0} configuration '{1}'.
    ResettingVMConfiguration        = (Re)setting {0} configuration '{1}'.
    TestingVMConfiguration          = Testing {0} configuration '{1}'.
    AddingVMCustomization           = Adding {0} customizations.
    AddingVMResource                = Adding {0} resources.
    RemovingNodeConfiguration       = Removing {0} configuration '{1}'.
    TestFailed                      = Testing '{0}' failed.
    NodeAlreadyConfigured           = Node '{0}' is already configured.
    NodeMissingOrMisconfigured      = Node '{0}' is missing or misconfigured.
    NodeForcedConfiguration         = Node '{0}' is already configured, but -Force was specified.
    StartingVirtualMachine          = Starting virtual machine '{0}'.
    WaitingForVirtualMachine        = Waiting '{0}' seconds for virtual machine '{1}'.
    StoppingVirtualMachine          = Stopping virtual machine '{0}'.
    RestoringVirtualMachineSnapshot = Restoring virtual machine '{0}' snapshot '{1}'.
    BaselineSnapshotName            = {0} Baseline Snapshot
    StartedHostConfigurationTest    = Started Lab host configuration test.
    FinishedHostConfigurationTest   = Finished Lab host configuration test.
    StartedHostConfiguration        = Started Lab host configuration.
    FinishedHostConfiguration       = Finished Lab host configuration.
    StartedLabConfigurationTest     = Started Lab configuration test.
    FinishedLabConfigurationTest    = Finished Lab configuration test.
    StartedLabConfiguration         = Started Lab configuration.
    FinishedLabConfiguration        = Finished Lab configuration.
    InjectingVMResource             = Injecting VM resource '{0}'.
    ExpandingIsoResource            = Expanding ISO resource '{0}'.
    CopyingFileResource             = Copying file resource '{0}'.
    ExpandingZipResource            = Expanding Zip archive '{0}'.
    ExtractingZipArchiveEntry       = Extracting Zip archive entry '{0}'.
    ClosingZipArchive               = Closing Zip archive '{0}'.
    ResolvedDestinationPath         = Resolved Zip destination path '{0}'.
    ResolvedSourcePath              = Resolved Zip source path '{0}'.
    EnterLocalAdministratorPassword = Enter the virtual machines' local administrator password.
    SettingAdministratorPassword    = Setting local administrator password to '{0}'.
    DownloadingAllRequiredMedia     = No media Id specified; downloading all required media.
    DownloadingAllRequiredHotfixes  = Downloading all required hotfixes.
    DownloadingAllDefinedResources  = No resource Id specified; downloading all defined resources.
    NoHotfixesSpecified             = No hotfixes were specified.
    NoMediaDefined                  = No media resources were defined.
    NoResourcesDefined              = No custom resources were defined.
    ProvideAdministratorPassword    = Please provide the local Administrator password.
    AddingCustomMediaEntry          = Adding '{0}' media entry.
    OverwritingCustomMediaEntry     = Overwriting existing '{0}' media entry.
    RemovingCustomMediaEntry        = Removing '{0}' media entry.
    SavingConfiguration             = Saving configuration '{0}'.
    PerformingOperationOnTarget     = Performing the operation '{0}' on target '{1}'.
    SettingVMDefaults               = Setting VM defaults.
    ResettingConfigurationDefaults  = Resetting '{0}' configuration settings to default.
    LocatingWimImageName            = Locating WIM image '{0}' name.
    LocatingWimImageIndex           = Locating WIM image '{0}' index.
    MediaFileCachingDisabled        = Caching of file-based media is disabled. Skipping media '{0}' download.
    CreatingQuickVM                 = Creating quick VM '{0}' using media '{1}'.
    RemovingQuickVM                 = Removing quick VM '{0}'.
    ResettingVM                     = Resetting VM '{0}'.

    NoCertificateFoundWarning       = No '{0}' certificate was found.
    CannotLocateLcmFileWarning      = Cannot locate LCM configuration file '{0}'. No DSC Local Configuration Manager configuration will be applied.
    SnapshotMissingWarning          = Snapshot '{0}' for virtual machine '{1}' is missing.
    NodeCustomMessageWarning        = [{0}] {1}
    TargetFileExistsWarning         = Target file '{0}' already exists.
    RemovingIncompleteImageWarning  = Removing incomplete image '{0}'.
    NoCustomMediaFoundWarning       = No custom media '{0}' registered.
    UnsupportedConfigurationWarning = Configuration '{0}' is not supported by {1}.
    ShouldProcessWarning            = Are you sure you want to perform this action?

    InvalidPathError                = {0} path '{1}' is invalid.
    InvalidDestinationPathError     = Invalid destination path '{0}' specified.
    InvalidImageArchitectureError   = Architecture '{0}' is invalid for operating system '{1}'.
    InvalidImageEditionError        = Edition '{0}' is invalid for operating system '{1}'.
    InvalidInternalSwitchIpError    = Internal switch IP address '{0}' is an invalid CIDR address.
    InvalidNetAdapterNameError      = Physical network adapter name '{0}' is invalid.
    UnsupportedUriSchemeError       = Uri scheme '{0}' is unsupported.
    CannotLocateDiskImageLetter     = Cannot the drive letter for disk image '{0}'. The parent disk image may be corrupted or recreate the master image.
    CannotLocateMediaError          = Cannot locate '{0}' media.
    CannotLocateNetworkError        = Cannot locate '{0}' network.
    MissingParameterError           = Missing required parameter '{0}'.
    ImageAlreadyExistsError         = Disk image '{0}' already exists.
    ResourceDownloadFailedError     = Resource download failed: {0}.
    DscResourceNotFoundError        = DSC module\\resource '{0}' not found.
    ResourceVersionMismatchError    = DSC module\\resource '{0}' version '{1}' is less than the required '{2}'.
    CannotFindCertificateError      = Cannot locate {0} certificate '{1}'.
    CannotLocateMofFileError        = Cannot locate node '{0}' file. No DSC configuration will be applied. Ensure the DSC configuration has been run successfully.
    CannotLocateNodeError           = Cannot locate node '{0}'.
    CannotSnapshotNodeError         = Cannot perform a snapshot operation on virtual machine '{0}' as it is not powered off. You can force the operation with the -Force switch.
    HostConfigurationTestError      = Host configuration test failed and may have a pending reboot.
    IncorrectPropertyTypeError      = Incorrect '{0}' property type. Property type must be '{1}'.
    CannotResolveResourceIdError    = Cannot resolve resource Id '{0}'.
    ExpandNotSupportedError         = Expand operation not supported on '{0}' file type.
    ImageNameRequiredError          = An image name is required for ISO and WIM media. Please specify the {0} parameter.
    MediaAlreadyRegisteredError     = Media Id '{0}' is already registered. Use {1} to override the existing media entry.
    CannotProcessCommandError       = Cannot process command because of one or more missing mandatory parameters: {0}.
    CannotBindArgumentError         = Cannot bind argument to parameter '{0}' because it is an empty string.
    StartMemLessThanMinMemError     = Startup memory '{0}' cannot be less than minimum memory '{1}'.
    StartMemGreaterThanMaxMemError  = Startup memory '{0}' cannot be greater than maximum memory '{1}'.
    SwitchDoesNotExistError         = Virtual switch '{0}' cannot be found.
'@