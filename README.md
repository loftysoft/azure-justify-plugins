# azure-justify plugins

Claude Code plugins from Loftysoft that help decide whether an Azure workload's architecture,
resilience and cost are justified by its business context.

| Plugin | What it does |
| --- | --- |
| `collect` | Placeholder: will list the Azure resources in a Service Group and write a report. |

The plugins only read from Azure. They run with your own Azure sign-in, and what they collect stays
on your machine.

## Prerequisites

- Claude Code.
- PowerShell 7.4 or later.
- The `Az.Accounts` and `Az.ResourceGraph` PowerShell modules.

## Setup

Install the PowerShell modules and sign in to Azure:

```powershell
Install-PSResource Az.Accounts, Az.ResourceGraph -Scope CurrentUser
Connect-AzAccount
```

In Claude Code, add this repository as a marketplace and install a plugin:

```text
/plugin marketplace add loftysoft/azure-justify-plugins
/plugin install collect@azure-justify-plugins
```

`collect` is a placeholder for now. Run `/collect:snapshot` and it says what is coming. It does not
read Azure yet, so the PowerShell modules and the Azure sign-in are only needed once it does.

## Working folder

Run Claude Code from a folder of your own. The plugins write what they collect under `local/` in that
folder. If the folder is a git repository, add `local/` to its `.gitignore`, so collected data is
never committed.

## Development

Install the test and lint modules:

```powershell
Install-PSResource Pester -Version '[5.7,6.0)' -Scope CurrentUser
Install-PSResource PSScriptAnalyzer -Version '[1.25,2.0)' -Scope CurrentUser
```

Run all tests and the analyzer from the repository root:

```powershell
./tests/Invoke-Checks.ps1
```
