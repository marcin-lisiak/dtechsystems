$sourceDir = "c:\Users\Marcin\Documents\STRONA D-TECH\DTECHSystems\img\Soteria\Realizacje"
$destDir = "$sourceDir\thumbnails"
New-Item -ItemType Directory -Force -Path $destDir | Out-Null
Add-Type -AssemblyName System.Drawing

$newFiles = @("brama_zamknieta.jpg", "brama-otwarta.jpg")
foreach ($fname in $newFiles) {
    $filePath = Join-Path $sourceDir $fname
    $img = $null
    $bmp = $null
    $graph = $null
    try {
        $img = [System.Drawing.Image]::FromFile($filePath)
        $width = 600
        $ratio = $width / $img.Width
        $height = [int]($img.Height * $ratio)
        $bmp = New-Object System.Drawing.Bitmap $width, $height
        $graph = [System.Drawing.Graphics]::FromImage($bmp)
        $graph.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graph.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
        $graph.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $rect = New-Object System.Drawing.Rectangle 0, 0, $width, $height
        $graph.DrawImage($img, $rect)
        $destPath = Join-Path $destDir $fname
        $bmp.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
        Write-Host "Resized: $fname"
    } finally {
        if ($null -ne $graph) { $graph.Dispose() }
        if ($null -ne $bmp) { $bmp.Dispose() }
        if ($null -ne $img) { $img.Dispose() }
    }
}
Write-Host "Done"
