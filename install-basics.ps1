# function User-Answered-Yes-To {
#     param(
# 		[Parameter(Mandatory)]
# 		[string] $Question
# 	)
#
#     $Input = Read-Host $Question, "[y/n]"
#
#     return $Input -eq "y"
# }

function Reload-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") 
}

# Optional: Needed to run a remote script the first time
echo "========== Setting execution policy =========="
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

$null = scoop --version
$null = $?

If (!($?)) {
    echo "========== Installing scoop =================="
    iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
    Reload-Path
}

$null = 7z
$null = $?

If (!($?)) {
    echo "========== Installing 7zip ==================="
    scoop install 7zip
    Reload-Path
}

$null = git --version
$null = $?

If (!($?)) {
    echo "========== Installing Git ===================="
    scoop install git
    Reload-Path
}

$null = fzf --version
$null = $?

If (!($?)) {
    echo "========== Installing Fzf ===================="
    scoop install fzf
    Reload-Path
}
