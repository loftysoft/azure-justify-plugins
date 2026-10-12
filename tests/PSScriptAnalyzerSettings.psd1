@{
  Severity = @('Error', 'Warning', 'Information')
  IncludeDefaultRules = $true
  ExcludeRules = @('PSProvideCommentHelp')
  Rules = @{
    PSUseConsistentIndentation = @{
      Enable = $true
      IndentationSize = 2
      Kind = 'space'
      PipelineIndentation = 'IncreaseIndentationForFirstPipeline'
    }
    PSUseConsistentWhitespace = @{
      Enable = $true
      CheckInnerBrace = $true
      CheckOpenBrace = $true
      CheckOpenParen = $true
      CheckOperator = $true
      CheckPipe = $true
      CheckSeparator = $true
      CheckParameter = $false
    }
    PSPlaceOpenBrace = @{
      Enable = $true
      OnSameLine = $true
      NewLineAfter = $true
      IgnoreOneLineBlock = $true
    }
    PSPlaceCloseBrace = @{
      Enable = $true
      NewLineAfter = $false
      IgnoreOneLineBlock = $true
      NoEmptyLineBefore = $true
    }
    PSAvoidUsingCmdletAliases = @{
      Enable = $true
    }
  }
}
