# PowerShell Module Template project
As an Engineer,
I want a working example of a medium-sized PowerShell script module,
So that I can copy it, in whole or part, into new or existing projects and customized as needed.

## Acceptance Criteria
* Uses standard script module folder structure
  * Public dir for public functions, variables
  * Private dir for private functinos, variables
  * Tests dir for Pester tests
    * Tests for individual functions will be in same dir as function's PS1 file
* Implements Pester tests for individual functions
* Implements Pester tests for all functions
* Implements PSScriptAnalyzer via Pester test

## Getting Started
```powershell
# Import Module
Import-Module ../psModuleTemplate -Force -Verbose
```
