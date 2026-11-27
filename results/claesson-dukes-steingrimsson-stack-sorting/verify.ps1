$ErrorActionPreference = 'Stop'

Add-Type -LiteralPath (Join-Path $PSScriptRoot 'counter.cs')
$previousOut = [Console]::Out
$buffer = [System.IO.StringWriter]::new()
try {
    [Console]::SetOut($buffer)
    [CdsNearTopCounter]::Run()
} finally {
    [Console]::SetOut($previousOut)
}

$lines = $buffer.ToString().TrimEnd() -split '\r?\n'
if ($lines[0] -cne 'marked orders: 39916800') {
    throw "Unexpected enumeration total: $($lines[0])"
}
$expected = @(Get-Content -LiteralPath (Join-Path $PSScriptRoot 'coefficients.csv'))
$actual = @($lines | Select-Object -Skip 1)
if (($actual -join "`n") -cne ($expected -join "`n")) {
    throw 'The enumerated coefficients do not match coefficients.csv'
}
Write-Output "$($lines[0]); coefficient table reproduced exactly."

python -B (Join-Path $PSScriptRoot 'verify.py')
if ($LASTEXITCODE -ne 0) { throw 'Exact coefficient verification failed' }
node (Join-Path $PSScriptRoot 'check-base.js')
if ($LASTEXITCODE -ne 0) { throw 'Direct sorting verification failed' }
