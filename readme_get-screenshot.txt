Function Get-Screenshot

<#
        .SYNOPSIS
         Takes a screenshot and writes it to a file.
        .DESCRIPTION
         The Get-Screenshot Function uses the System.Drawing .NET assembly to 
         take a screenshot, and then writes it to a file.
        .PARAMETER <Path>
         The path where the file will be stored. If a trailing backslash is used
         the operation will fail. See the examples for syntax.
        .PARAMETER <png>
         This optional switch will save the resulting screenshot as a PNG file.
         This is the default setting.
        .PARAMETER <jpeg>
         This optional switch will save the resulting screenshot as a JPEG file.
        .PARAMETER <bmp>
         This optional switch will save the resulting screenshot as a BMP file.
        .PARAMETER <gif>
         This optional switch will save the resulting screenshot as a GIF file.
         session.
        .EXAMPLE
         C:\PS>Get-Screenshot c:\screenshots
         
         This example will create a PNG screenshot in the directory 
         "C:\screenshots".
         
        .EXAMPLE
         C:\PS>Get-Screenshot c:\screenshot -jpeg
        
         This example will create a JPEG screenshot in the directory 
         "C:\screenshots".
        
        .EXAMPLE
         C:\PS>Get-Screenshot c:\screenshot -verbose
         
         This example will create a PNG screenshot in the directory 
         "C:\screenshots". This usage will also write verbose output to the 
         comsole (inlucding the full filepath and name of the resulting file).

	.Source
	 NAME......:  Get-Screenshot
         AUTHOR....:  Joe Glessner
         LAST EDIT.:  12MAY11
         CREATED...:  11APR11
        .LINK
         http://joeit.wordpress.com/

	.Changes
	 - added german time format to the filename
	 - added timer selection
	 - added folder selection
#>