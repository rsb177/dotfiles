# Linux-like Shortcuts

function which($name)
{
    Get-Command $name | Select-Object -ExpandProperty Definition
}

