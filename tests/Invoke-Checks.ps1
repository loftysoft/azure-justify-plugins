#Requires -Version 7.4
<#
.SYNOPSIS
Runs all Pester tests and PSScriptAnalyzer, and exits non-zero on any problem.
#>
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
Import-Module Pester -MinimumVersion 5.7
Import-Module PSScriptAnalyzer

$config = New-PesterConfiguration
$config.Run.Path = './tests'
$config.Run.PassThru = $true
$config.Output.Verbosity = 'Normal'
$tests = Invoke-Pester -Configuration $config

$files = git ls-files --cached --others --exclude-standard -- '*.ps1' '*.psm1' '*.psd1'
$issues = $files | ForEach-Object { Invoke-ScriptAnalyzer -Path $_ -Settings ./tests/PSScriptAnalyzerSettings.psd1 }
if ($issues) {
  $issues | Format-Table -AutoSize ScriptName, Line, RuleName, Message | Out-String -Width 200 | Write-Output
}

Write-Output "Tests: $($tests.PassedCount) passed, $($tests.FailedCount) failed. Analyzer: $(@($issues).Count) issues."
if ($tests.Result -ne 'Passed' -or $issues) {
  exit 1
}
