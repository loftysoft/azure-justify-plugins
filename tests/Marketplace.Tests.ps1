Describe 'Marketplace' {
  It 'lists at least one plugin' {
    (Get-Content ./.claude-plugin/marketplace.json -Raw | ConvertFrom-Json).plugins | Should -Not -BeNullOrEmpty
  }

  It 'has a plugin.json for <name> at <source> with the same name and description' -ForEach (Get-Content ./.claude-plugin/marketplace.json -Raw | ConvertFrom-Json -AsHashtable).plugins {
    $manifest = Get-Content "$source/.claude-plugin/plugin.json" -Raw | ConvertFrom-Json
    $manifest.name | Should -Be $name
    $manifest.description | Should -Be $description
  }

  It 'has a name matching its folder and a description in <_>' -ForEach (Get-ChildItem ./*/skills/*/SKILL.md).FullName {
    $frontMatter = (Get-Content $_ -Raw) -split '(?m)^---\s*$' | Select-Object -Index 1
    $frontMatter | Should -Match "(?m)^name: $(Split-Path (Split-Path $_) -Leaf)\s*$"
    $frontMatter | Should -Match '(?m)^description: \S'
  }
}
