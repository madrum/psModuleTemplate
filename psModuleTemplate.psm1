 = Split-Path System.Management.Automation.InvocationInfo.MyCommand.Path
 = System.Management.Automation.EngineIntrinsics.SessionState.Module
 = .ModuleBase # can be used in other module scripts
Write-Verbose "PS module root: "
# C:\Users\MichaelDrum\Documents\PowerShell\Modules;C:\Program Files\PowerShell\Modules;c:\program files\powershell\7\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules;c:\Users\MichaelDrum\.vscode\extensions\ms-vscode.powershell-2023.2.1\modules should be same as 

# Dot source public/private functions, excluding tests
 = @(Get-ChildItem -Path "\public" -Filter *.ps1 -Exclude *.Tests.ps1 -Recurse -ErrorAction SilentlyContinue)
 = @(Get-ChildItem -Path "\private" -Filter *.ps1 -Exclude *.Tests.ps1 -Recurse -ErrorAction SilentlyContinue)

 =  + 
foreach ( in ) {
    try {
        . .FullName
    } catch {
        throw ('Unable to dot source {0}' -f .FullName)
    }
}

# exporting functions here is much easier than manually updating psd1 file with function to export
Export-ModuleMember -Function .BaseName # -Variable @() -Alias @()
