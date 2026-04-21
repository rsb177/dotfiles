$packages = @(
    "eza-community.eza"
)

$packages | ForEach-Object {
    Write-Host "Installing $_..."
    winget install --id $_ --silent --accept-package-agreements --accept-source-agreements
}
