if (!$env:SCOOP_HOME) { $env:SCOOP_HOME = Resolve-Path (scoop prefix scoop) }

# Ensure manifest schema validation enumerates only bucket/**/*.json
$prevCI = $env:CI
$env:CI = $null
try {
    . "$env:SCOOP_HOME\test\Import-Bucket-Tests.ps1" -BucketPath $PSScriptRoot
} finally {
    $env:CI = $prevCI
}
