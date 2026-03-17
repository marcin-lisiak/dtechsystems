$sourceDir = "c:\Users\Marcin\Documents\STRONA D-TECH\DTECHSystems\img\Soteria\Realizacje"
$destDir = "$sourceDir\thumbnails"
New-Item -ItemType Directory -Force -Path $destDir | Out-Null

Add-Type -AssemblyName System.Drawing
$files = Get-ChildItem -Path $sourceDir -Filter *.jpg -File
foreach ($file in $files) {
    try {
        $img = [System.Drawing.Image]::FromFile($file.FullName)
        
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
        
        $destPath = Join-Path $destDir $file.Name
        $bmp.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
        
        Write-Host "Resized $($file.Name)"
    }
    finally {
        if ($null -ne $graph) { $graph.Dispose() }
        if ($null -ne $bmp) { $bmp.Dispose() }
        if ($null -ne $img) { $img.Dispose() }
    }
}
