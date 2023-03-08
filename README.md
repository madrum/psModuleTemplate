# PowerShell Module Template project
As a DevOps Engineer,
I want a working example of a medium-sized PowerShell script module,
So that I can copy it, in whole or part, into new or existing projects and customized as needed.

## Acceptance Criteria
* [x] Uses standard script module folder structure
  * Public dir for public functions, variables
  * Private dir for private functions, variables
  * Tests dir for general Pester tests
    * Tests for individual functions will be in same dir as function's .ps1 file
* [x] Manifest script (.psm1) dot sources all .ps1 files and exports public functions and variables
* [ ] Implements Pester tests for individual functions
* [ ] Implements Pester tests for all functions
* [ ] Implements PSScriptAnalyzer via Pester test

## Getting Started
```powershell
# Import Module
Import-Module ../psModuleTemplate -Force -Verbose
# Get functions in module
Get-Command -CommandType Function -Module psModuleTemplate
```

## How-to: Create New PowerShell Module
* See [doc](docs/create-ps-module.md) for details on creating a new PowerShell module, similar to how this module was created.
