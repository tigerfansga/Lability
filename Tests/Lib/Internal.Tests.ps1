#requires -RunAsAdministrator
#requires -Version 4

$moduleName = 'VirtualEngineLab';
if (!$PSScriptRoot) { # $PSScriptRoot is not defined in 2.0
    $PSScriptRoot = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
}
$repoRoot = (Resolve-Path "$PSScriptRoot\..\..").Path;

Import-Module (Join-Path -Path $RepoRoot -ChildPath "$moduleName.psm1") -Force;

Describe 'Internal' {
    
    InModuleScope $moduleName {

        Context 'Validates "ResolvePathEx" method' {
            
            It 'Resolves existing home path' {
                (Get-PSProvider -PSProvider 'FileSystem').Home = (Get-PSDrive -Name TestDrive).Root;
                $fileSystemPath = (Get-PSProvider -PSProvider 'FileSystem').Home;
                $psPath = '~';
                                
                ResolvePathEx -Path $psPath | Should Be $fileSystemPath;
            }

            It 'Resolves non-existent home path' {
                (Get-PSProvider -PSProvider 'FileSystem').Home = (Get-PSDrive -Name TestDrive).Root;
                $fileSystemPath = '{0}\HopefullyThisPathDoesNotExist' -f (Get-PSProvider -PSProvider 'FileSystem').Home;
                $psPath = '~\HopefullyThisPathDoesNotExist';
                                
                ResolvePathEx -Path $psPath | Should Be $fileSystemPath;
            }

        } #end context Validates "ResolvePathEx" method

        Context 'Validates "InvokeExecutable" method' {

            It 'Calls "Start-Process" with correct process path' {
                $testProcess = 'Test.exe';
                $testArguments = @('/Arg1','-Arg2');
                $testExitCode = 0;
                Mock Start-Process -ParameterFilter { $FilePath -eq $testProcess } -MockWith { return [PSCustomObject] @{ ExitCode = $testExitCode; } }

                InvokeExecutable -Path 'Test.exe' -Arguments $testArguments;
                Assert-MockCalled Start-Process -ParameterFilter { $FilePath -eq $testProcess } -Scope It;
            }

            It 'Calls "Start-Process" with correct arguments' {
                $testProcess = 'Test.exe';
                $testArguments = @('/Arg1','-Arg2');
                $testExitCode = 0;
                Mock Start-Process -ParameterFilter { $ArgumentList.Count -eq 2 } -MockWith { return [PSCustomObject] @{ ExitCode = $testExitCode; } }

                InvokeExecutable -Path 'Test.exe' -Arguments $testArguments;
                Assert-MockCalled Start-Process -ParameterFilter { $ArgumentList.Count -eq 2 } -Scope It;
            }

            It 'Waits for "Start-Process" to exit' {
                $testProcess = 'Test.exe';
                $testArguments = @('/Arg1','-Arg2');
                $testExitCode = 0;
                Mock Start-Process -ParameterFilter { $Wait -eq $true } -MockWith { return [PSCustomObject] @{ ExitCode = $testExitCode; } }

                InvokeExecutable -Path 'Test.exe' -Arguments $testArguments;
                Assert-MockCalled Start-Process -ParameterFilter { $Wait -eq $true } -Scope It;
            }

            It 'Warns when process exits with non-zero exit code' {
                $testProcess = 'Test.exe';
                $testArguments = @('/Arg1','-Arg2');
                $testExitCode = 1;
                Mock Start-Process -ParameterFilter { $Path -eq $testProcess } -MockWith { return [PSCustomObject] @{ ExitCode = $testExitCode; } }

                { InvokeExecutable -Path 'Test.exe' -Arguments $testArguments -WarningAction Stop 3>&1 } | Should Throw;
            }
            
        } #end context Validates "InvokeExecutable" method

        Context 'Validates "GetFormattedMessage" method' {
        
            It 'Does not return call stack information when "$labDefaults.CallStackLogging" = "$null"' {
                $labDefaults = @{ }
                $testMessage = 'This is a test message';

                $message = GetFormattedMessage -Message $testMessage;

                $message -match '\] \[' | Should Be $false;
            }
            
            It 'Does not return call stack information when "$labDefaults.CallStackLogging" = "$false"' {
                $labDefaults = @{ CallStackLogging = $false; }
                $testMessage = 'This is a test message';

                $message = GetFormattedMessage -Message $testMessage;

                $message -match '\] \[' | Should Be $false;
            }
            
            It 'Returns call stack information when "$labDefaults.CallStackLogging" = "$true"' {
                $labDefaults = @{ CallStackLogging = $true; }
                $testMessage = 'This is a test message';

                $message = GetFormattedMessage -Message $testMessage;

                $message -match '\] \[' | Should Be $true;
            }
        
        } #end context Validates "GetFormattedMessage" method

        Context 'Validates "WriteVerbose" method' {
            
            It 'Calls "GetFormattedMessage" method' {
                $testMessage = 'This is a test message';
                Mock GetFormattedMessage -ParameterFilter { $Message -match $testMessage } -MockWith { return $testMessage; }

                WriteVerbose -Message $testMessage;

                Assert-MockCalled GetFormattedMessage -ParameterFilter { $Message -match $testMessage } -Scope It;
            }

            It 'Calls "Write-Verbose" method with test message' {
                $testMessage = 'This is a test message';
                Mock Write-Verbose -ParameterFilter { $Message -match "$testMessage`$" } -MockWith { }
                
                WriteVerbose -Message $testMessage;
                
                Assert-MockCalled Write-Verbose -ParameterFilter { $Message -match $testMessage } -Scope It;
            }

        } #end context Validates "WriteVerbose" method

        Context 'Validates "WriteWarning" method' {
            
            It 'Calls "GetFormattedMessage" method' {
                $testMessage = 'This is a test message';
                Mock GetFormattedMessage -ParameterFilter { $Message -match $testMessage } -MockWith { return $testMessage; }

                WriteVerbose -Message $testMessage;

                Assert-MockCalled GetFormattedMessage -ParameterFilter { $Message -match $testMessage } -Scope It;
            }

            It 'Calls "Write-Warning" method with test message' {
                $testMessage = 'This is a test message';
                Mock Write-Warning -ParameterFilter { $Message -match "$testMessage`$" } -MockWith { }
                WriteWarning -Message $testMessage;
                Assert-MockCalled Write-Warning -ParameterFilter { $Message -match $testMessage } -Scope It;
            }

        } #end context Validates "WriteVerbose" method

    } #end InModuleScope

} #end describe Internal
