# PowerShell script to take screenshot of website
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Function to take screenshot
function Take-Screenshot {
    param(
        [string]$Url,
        [string]$OutputFile,
        [int]$Width = 1366,
        [int]$Height = 768,
        [int]$WaitTime = 3
    )

    try {
        # Start IE browser
        $ie = New-Object -ComObject InternetExplorer.Application
        $ie.Visible = $false
        $ie.Navigate($Url)

        # Wait for page to load
        Start-Sleep -Seconds $WaitTime

        # Get screen dimensions
        $bounds = [System.Drawing.Rectangle]::FromLTRB(0, 0, $Width, $Height)
        $bitmap = New-Object System.Drawing.Bitmap($bounds.Width, $bounds.Height)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)

        # Copy screen
        $graphics.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size)

        # Save screenshot
        $bitmap.Save($OutputFile, [System.Drawing.Imaging.ImageFormat]::Png)

        # Cleanup
        $graphics.Dispose()
        $bitmap.Dispose()
        $ie.Quit()

        Write-Host "Screenshot saved to: $OutputFile"
        return $true
    }
    catch {
        Write-Host "Error taking screenshot: $_"
        return $false
    }
}

# Take desktop screenshot
Write-Host "Taking desktop screenshot..."
$desktopResult = Take-Screenshot -Url "https://davidjoshua87.github.io/" -OutputFile "Screen Shot Full Website.png" -Width 1366 -Height 768

if ($desktopResult) {
    Write-Host "Desktop screenshot completed successfully!"
} else {
    Write-Host "Desktop screenshot failed. Please try manual method."
}