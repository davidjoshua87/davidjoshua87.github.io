# PowerShell script to take mobile screenshot of website
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Function to take mobile screenshot
function Take-MobileScreenshot {
    param(
        [string]$Url,
        [string]$OutputFile
    )

    try {
        # Get primary screen dimensions
        $screen = [System.Windows.Forms.Screen]::PrimaryScreen
        $bounds = $screen.Bounds

        # Create mobile-sized area (iPhone dimensions)
        $mobileWidth = 375
        $mobileHeight = 812
        $startX = ($bounds.Width - $mobileWidth) / 2
        $startY = ($bounds.Height - $mobileHeight) / 2

        # Open browser in mobile view
        Start-Process "https://davidjoshua87.github.io/"
        Start-Sleep -Seconds 5

        # Get the mobile viewport area
        $mobileBounds = [System.Drawing.Rectangle]::FromLTRB($startX, $startY, $startX + $mobileWidth, $startY + $mobileHeight)
        $bitmap = New-Object System.Drawing.Bitmap($mobileBounds.Width, $mobileBounds.Height)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)

        # Copy mobile area
        $graphics.CopyFromScreen($mobileBounds.Location, [System.Drawing.Point]::Empty, $mobileBounds.Size)

        # Save mobile screenshot
        $bitmap.Save($OutputFile, [System.Drawing.Imaging.ImageFormat]::Png)

        # Cleanup
        $graphics.Dispose()
        $bitmap.Dispose()

        Write-Host "Mobile screenshot saved to: $OutputFile"
        return $true
    }
    catch {
        Write-Host "Error taking mobile screenshot: $_"
        return $false
    }
}

# Take mobile screenshot
Write-Host "Taking mobile screenshot..."
$mobileResult = Take-MobileScreenshot -Url "https://davidjoshua87.github.io/" -OutputFile "Screen Shot Mobile Version.png"

if ($mobileResult) {
    Write-Host "Mobile screenshot completed successfully!"
} else {
    Write-Host "Mobile screenshot failed. Please try manual method."
}

Write-Host "Please close the browser window that opened."