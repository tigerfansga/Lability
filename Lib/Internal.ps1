function ResolvePathEx {
<#
    .SYNOPSIS
        Resolves the wildcard characters in a path, and displays the path contents, ignoring non-existent paths.
    .DESCRIPTION
        The Resolve-Path cmdlet interprets the wildcard characters in a path and displays the items and containers at
        the location specified by the path, such as the files and folders or registry keys and subkeys.
#>
    [CmdletBinding()]
    [OutputType([System.String])]
    param (
        [Parameter(Mandatory)] [System.String] $Path
    )
    process {
        try {
            $expandedPath = [System.Environment]::ExpandEnvironmentVariables($Path);
            $resolvedPath = Resolve-Path -Path $expandedPath -ErrorAction Stop;
            $Path = $resolvedPath.ProviderPath;
        }
        catch [System.Management.Automation.ItemNotFoundException] {
            $Path = [System.Environment]::ExpandEnvironmentVariables($_.TargetObject);
            $Error.Remove($Error[-1]);
        }
        return $Path;
    } #end process
} #end function ResolvePathEx

function InvokeExecutable {
<#
    .SYNOPSIS
        Runs an executable and redirects StdOut and StdErr.
#>
    [CmdletBinding()]
    [OutputType([System.Int32])]
    param (
        # Executable path
        [Parameter(Mandatory)] [ValidateNotNullOrEmpty()] [System.String] $Path,
        # Executable arguments
        [Parameter(Mandatory)] [ValidateNotNull()] [System.Array] $Arguments,
        # Redirected StdOut and StdErr log name
        [Parameter()] [ValidateNotNullOrEmpty()] [System.String] $LogName = ('{0}.log' -f $Path)
    )
    process {
        $processArgs = @{
            FilePath = $Path;
            ArgumentList = $Arguments;
            Wait = $true;
            RedirectStandardOutput = '{0}\{1}-StdOut.log' -f $env:temp, $LogName;
            RedirectStandardError = '{0}\{1}-StdErr.log' -f $env:temp, $LogName;
            NoNewWindow = $true;
            PassThru = $true;
        }
        Write-Debug -Message ($localized.RedirectingOutput -f 'StdOut', $processArgs.RedirectStandardOutput);
        Write-Debug -Message ($localized.RedirectingOutput -f 'StdErr', $processArgs.RedirectStandardError);
        WriteVerbose ($localized.StartingProcess -f $Path, [System.String]::Join(' ', $Arguments));
        $process = Start-Process @processArgs;
        if ($process.ExitCode -ne 0) { WriteWarning ($localized.ProcessExitCode -f $Path, $process.ExitCode);}
        else { WriteVerbose ($localized.ProcessExitCode -f $Path, $process.ExitCode); }
        ##TODO: Should this actually return the exit code?!
    } #end process
} #end function InvokeExecutable

function GetFormattedMessage {
<#
    .SYNOPSIS
        Generates a formatted output message.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.String] $Message
    )
    process {
        if (($labDefaults.CallStackLogging) -and ($labDefaults.CallStackLogging -eq $true)) {
            $parentCallStack = (Get-PSCallStack)[1]; # store the parent Call Stack        
            $functionName = $parentCallStack.FunctionName;
            $lineNumber = $parentCallStack.ScriptLineNumber;
            $scriptName = ($parentCallStack.Location -split ':')[0];
            $formattedMessage = '[{0}] [Script:{1}] [Function:{2}] [Line:{3}] {4}' -f (Get-Date).ToLongTimeString(), $scriptName, $functionName, $lineNumber, $Message;
        }
        else {
            $formattedMessage = '[{0}] {1}' -f (Get-Date).ToLongTimeString(), $Message;
        }
        return $formattedMessage;
    } #end process
} #end function GetFormattedMessage

function WriteVerbose {
<#
    .SYNOPSIS
        Wrapper around Write-Verbose that adds a timestamp and/or call stack information to the output.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.String] $Message
    )
    process {
        $verboseMessage = GetFormattedMessage -Message $Message;
        Write-Verbose -Message $verboseMessage;
    }
} #end function WriteVerbose

function WriteWarning {
<#
    .SYNOPSIS
        Wrapper around Write-Warning that adds a timestamp and/or call stack information to the output.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.String] $Message
    )
    process {
        $warningMessage = GetFormattedMessage -Message $Message;
        Write-Warning -Message $warningMessage;
    }
} #end function WriteWarning
