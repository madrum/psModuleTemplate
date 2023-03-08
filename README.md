# PowerShell Module Template project
As a DevOps Engineer,
I want a working example of a medium-sized PowerShell script module,
So that I can copy it, in whole or part, into new or existing projects and customized as needed.

## Acceptance Criteria
* Uses standard script module folder structure
  * Public dir for public functions, variables
  * Private dir for private functinos, variables
  * Tests dir for Pester tests
    * Tests for individual functions will be in same dir as function's PS1 file
  * Do *NOT* create *.psd1 file, as that interferes with the method used to dot source
* Implements Pester tests for individual functions
* Implements Pester tests for all functions
* Implements PSScriptAnalyzer via Pester test

## Getting Started
```powershell
# Import Module
Import-Module ../psModuleTemplate -Force -Verbose
# Get functions in module
Get-Command -CommandType Function -Module psModuleTemplate
```

## How-to: Create New PowerShell Module
* See [doc](docs/create-ps-module.md) for details on creating a new PowerShell module, similar to how this module was created.
