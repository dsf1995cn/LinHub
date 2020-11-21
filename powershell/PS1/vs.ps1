#############################################

#Warm up VS for the first time

#Usage:

# WarmUpVS.ps1 -vsVersion [vsVersion]

#Parameters:

# vsVersion:     The vsVersion, could be VS100 or VS110

#############################################

#function warmUpVS {

 

    Param([string]$vsVersion)

    $error.clear()
    programFilesFolder=env:ProgramFiles
    
    myCmdFolder=Split−PathMyInvocation.MyCommand.Path
    
    commonTaskFolder=myCmdFolder
    
    logScript=Join−Path−PathcommonTaskFolder -ChildPath "log.ps1"
    
    # $logScript -information "Start 'WarmUpVS'"
    #progPath: Default installation path for VS
    progPath=null 
    if ($vsVersion -eq "VS100")
    
    {
    
        #env:progPath=Join−Path−Pathenv:ProgramFiles -ChildPath "Microsoft Visual Studio 10.0\Common7\IDE"
    
        $progPath = "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE"
    
    }
    
    elseif ($vsVersion -eq "VS110")
    
    {
    
        #env:progPath=Join−Path−Pathenv:ProgramFiles -ChildPath "Microsoft Visual Studio 11.0\Common7\IDE"
    
        $progPath = "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE";
    
    }
    
    else
    
    {
    
        throw "Unknown vsVersion: $vsVersion"
    
    }
    
    try
    
    {
    
             #& $logScript -information "Start creating VS instance"
    
             $oldLocation = get-location
    
             set-location $progPath
    
             Start-Process -filepath ".\devenv.exe" -ArgumentList "/resetsettings .\Profiles\General.vssettings"
    
        #$vsHandler = Get-Process | where {$_.MainWindowTitle -Like "*Microsoft Visual Studio*"}
    
        #$vsHandler = Get-Process -filter "name='devenv.exe'"
    
        Start-Sleep -s 20
    
        set-location $oldLocation
    
        #closeMessage=vsHandler.CloseMainWindow()
    
        Stop-Process -Name "devenv" -Force
    
            
    
             #& $logScript -information "End VS quitting"
    
    }
    
    catch [Exception]
    
    {
    
             #& logScript−information"WarmUpVSfailsforexception:_"
    
        return 0
    
    }
    
     
    
    #& $logScript -information "End 'WarmUpVS' succeeded"
    
    #}