<#
.SYNOPSIS
    Example private function.
.DESCRIPTION
    Example private function that is only accessible by functions within this module.
.EXAMPLE
    PS> Test-PrivateFunction
    Test-PrivateFunction function

    Returns string.
.NOTES
#>
function Test-PrivateFunction {
    [CmdletBinding()]
    [OutputType([System.String])]
    param()

    return "Test-PrivateFunction function"
}