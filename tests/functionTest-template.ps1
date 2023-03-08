BeforeAll {
    $commandFile = $PSCommandPath.Replace('.Tests.ps1', '.ps1') # get script being tested using name of the *.Tests.ps1 file
    . $commandFile # dot source file being tested
    $commandName = (Get-Item $commandFile).BaseName # file name without extension
    $command = Get-Command -Name $commandName -CommandType Function # get command
    $script:help = $command | Get-Help
}

Describe "Function: <commandName>" {
    BeforeAll {
        # mock commands to remove dependencies, like: Out-File, Get-Content, Invoke-RestMethod, etc.
        # define paramsets
    }

    Context "Help" {
        It 'Is found' {
            $help.Name | Should -Be $command.Name
        }

        It 'Has Description defined' {
            $help.description | Should -Not -BeNullOrEmpty
        }

        It 'Has at least one example' {
            $help.Examples | Should -Not -BeNullOrEmpty
        }
    }

    Context "Input" {
        # e.g. good input does not throw, bad input throws, multiple parameter sets (throw assertion requires command be in scriptblock)
    }

    Context "Execution" {
        # e.g. mocked command invoked X number of times
    }

    Context "Output" {
        # Should -Be, -Contain, -HaveCount, -Match
        # e.g. be expected output type, have properties, properties have values, etc.

        It 'Output type is defined' {
            $command.OutputType | Should -Not -BeNullOrEmpty
        }

        It 'Returns the object type defined in OutputType' {
            $commandName | Should -BeOfType $command.OutputType.Name
        } -Pending # remove pending after command parameters are set properly
    }
}