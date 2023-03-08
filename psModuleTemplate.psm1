$scriptPath = Split-Path $MyInvocation.MyCommand.Path
$psModule = $ExecutionContext.SessionState.Module
$psModuleRoot = $psModule.ModuleBase # $psModuleRoot can be used in module scripts to reference module root directory.
Write-Verbose "PS module root: $psModuleRoot"

# Dot source public/private functions, excluding tests
$publicFunctions = @(Get-ChildItem -Path "$scriptPath\public" -Filter *.ps1 -Exclude *.Tests.ps1 -Recurse -ErrorAction SilentlyContinue)
$privateFunctions = @(Get-ChildItem -Path "$scriptPath\private" -Filter *.ps1 -Exclude *.Tests.ps1 -Recurse -ErrorAction SilentlyContinue)

$allFunctions = $publicFunctions + $privateFunctions
foreach ($function in $allFunctions) {
    try {
        . $function.FullName
    } catch {
        throw ('Unable to dot source {0}' -f $function.FullName)
    }
}

# Exporting functions here is much easier than manually updating psd1 file with functions to export.
Export-ModuleMember -Function $publicFunctions.BaseName # -Variable @() -Alias @()
