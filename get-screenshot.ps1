##--------------------------------------------------------------------------
    ##  FUNCTION.......:  Get-Screenshot
    ##  PURPOSE........:  Takes a screenshot and saves it to a file.
    ##  REQUIREMENTS...:  PowerShell 2.0
    ##  NOTES..........:  
    ##--------------------------------------------------------------------------
    Function Get-Screenshot {
              [CmdletBinding()]             
            Param (                        
                    [Parameter(Mandatory=$True, 
                        Position=0,                           
                        ValueFromPipeline=$false,             
                        ValueFromPipelineByPropertyName=$false)]  
                    [String]$Path,
                    [Switch]$jpeg,
                    [Switch]$bmp,
                    [Switch]$gif
                )#End Param
        $asm0 = [System.Reflection.Assembly]::LoadWithPartialName(`
            "System.Drawing")
        Write-Verbose "Assembly loaded: $asm0"
        $asm1 = [System.Reflection.Assembly]::LoadWithPartialName(`
            "System.Windows.Forms")
        Write-Verbose "Assembly Loaded: $asm1"
        $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
        $Bitmap = New-object System.Drawing.Bitmap $screen.width,$screen.height
        $Size = New-object System.Drawing.Size $screen.width,$screen.height
        $FromImage = [System.Drawing.Graphics]::FromImage($Bitmap)
        $FromImage.copyfromscreen(0,0,0,0, $Size,
            ([System.Drawing.CopyPixelOperation]::SourceCopy))
        $Timestamp = get-date -uformat "%d_%m_%Y_@_%H%M_%S"
        If ([IO.Directory]::Exists($Path)) { 
            Write-Verbose "Directory $Path already exists."
        }#END: If ([IO.Directory]::Exists($Path))
        Else { 
            [IO.Directory]::CreateDirectory($Path) | Out-Null
            Write-Verbose "Folder $Path does not exist, creating..."
        }#END: Else
        If ($jpeg) {
            $FileName = "\$($Timestamp)_screenshot.jpeg"
            $Target = $Path + $FileName
            $Bitmap.Save("$Target",
                ([system.drawing.imaging.imageformat]::Jpeg));
        }#END: If ($jpeg)
        ElseIf ($bmp) {
            $FileName = "\$($Timestamp)_screenshot.bmp"
            $Target = $Path + $FileName
            $Bitmap.Save("$Target",
                ([system.drawing.imaging.imageformat]::Bmp));
        }#END: If ($bmp)
        ElseIf ($gif) {
            $FileName = "\$($Timestamp)_screenshot.gif"
            $Target = $Path + $FileName
            $Bitmap.Save("$Target",
                ([system.drawing.imaging.imageformat]::Gif));
        }
        Else {
            $FileName = "$($Timestamp)_screenshot.png"
            $Target = $Path + $FileName
            $Bitmap.Save("$Target",
                ([system.drawing.imaging.imageformat]::Png));
        }#END: Else
        Write-Verbose "File saved to: $target"
    }#END: Function Get-Screenshot
    #mycode Repeatfunction Screenshoterstellung / Bestimmung der Zeit in Sekunden
    $timeinterval = Read-Host "Bestimme Zeitinterfall in Sekunden"
    $Path = Read-Host "Bestimme Pfad Bsp.:(C:\temp\)"
    Write-Host = "Abrechen mit CTRL-C"
    for (;;){$repeat++; Start-Sleep -Seconds $timeinterval;Get-Screenshot $Path}