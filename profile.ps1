# Load oh-my-posh theme
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\onehalf.minimal.omp.json" | Invoke-Expression


# PSReadLine options
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -BellStyle None

# PSReadLine keybindings
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+k -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord Ctrl+j -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+n -Function AcceptSuggestion


# Fzf related
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider "Ctrl+f" -PSReadlineChordReverseHistory "Ctrl+r"


# Icons
Import-Module -Name Terminal-Icons


# Aliases
function sudo { start-process pwsh -verb runAs }

function upDir { Set-Location .. }

Set-Alias -Name cl -Value clear
Set-Alias -Name .. -Value upDir
Set-Alias g git


# Env variables
setx DOTNET_CLI_TELEMETRY_OPTOUT 1
