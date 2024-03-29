$wallpaperPath = "$HOME"
$wallpaperPath = $wallpaperPath+'\Downloads\bg.jpg'

Function Get-WallPaper(){
  param (
    $wallpaperPath = $wallpaperPath
  )

  $imgUrl = @('http://i.imgur.com/NJc5RAH.png',` #mouse
          'http://patenteux.com/Messy_desktop/messy_wallpaper-1920x1200.jpg',` #messy
          'https://www.pixelstalk.net/wp-content/uploads/2016/07/1920x1080-Naruto-Wallpapers-HD-620x349.jpg' #naruto
          )
  $output = $wallpaperPath
  $imgUrl = Get-Random -InputObject $imgUrl
  Remove-Item $wallpaperPath -Force -ErrorAction SilentlyContinue
  (New-Object System.Net.WebClient).DownloadFile("$imgUrl", "$output")
}

Function Set-WallPaper(){
  param (
    $wallpaperPath = $wallpaperPath
  )
  
  Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $wallpaperPath
  rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

Function Set-FlipScreen(){
  $wshell = New-Object -ComObject wscript.shell;
  $wshell.SendKeys('^%{DOWN}')
}

Function Invoke-Mischief(){
  $functionList = @('Get-WallPaper`; Set-WallPaper`;','Set-FlipScreen')
 Get-Random -InputObject $functionList
}

# Execute with powershell (iwr https://raw.githubusercontent.com/Wittionary/Lock-your-computer/master/lyc.ps1).Content
# Invoke-Mischief
Get-WallPaper
Set-WallPaper