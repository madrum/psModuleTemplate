<#
.SYNOPSIS
    Example public function.
.DESCRIPTION
    Example public function that is accessible by end user.
.EXAMPLE
    PS> Test-Module
    Test-Module function
    Module root directory: <path to module>

    Returns string.
.NOTES
#>
function Test-Module {
    [CmdletBinding()]
    [OutputType([System.String])]
    param()

    return @"
Test-Module function
Module root directory: $psModuleRoot
"@
}
