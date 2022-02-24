'''
$filename is the name of the file
$filedate adds the date to the file name
$folderdate copies the file to a folder with the year/month
#options2 can be used with /xd to exclude entire directories
or /xf to exclude a file 
(/XD exclude-folder-1) (/XF filename-1.extension)

Place and run this file in the folder you want your backup
logs to be created and stored.
'''
$filename = "MainBackup"
$filedate = get-date -format "yy-MM-dd"
$folderdate = get-date -format "yy-MM-MMMM"
$curdate = get-date -format "yyyyMMdd"

$source = "C:\Users\Chad\Documents\Programming\Powershell\New"
$dest = "B:\Users\Chad\Documents\Programming\Powershell\New2"
$options = @("/x", "/s", "/tee", "/xc", "/xo", "/np", "/ndl", "/r:5", "/w:15", "/COPY:DAT", "/DCOPY:T")
$options2 = ""
$options3 = "/log+:.\Logs\$folderdate\$filedate$filename.log")
$cmdArgs = @("$source","$dest",$options,$options2,$options3)

#Checks if log folder + date folder exists and creates it if it doesn't
if (!(Test-Path $folderdate))
{
New-Item -ItemType directory -path .\Logs -Name $folderdate
}
else
{
write-host "Folder already exists"
}

robocopy @cmdArgs
pause