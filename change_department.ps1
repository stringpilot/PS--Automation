<#

Tasks:
    OU name when the script runs
    Department name when the script runs
    Display more info (Write-host/Read-Host)
    Try-Catch block to display error message (NICE version)
    Comment to assist on script

#>

$i=0
$sUser = $null
$Dep = $null
$readOU = Read-Host "Enter [OU] for query: "
$dcName = Read-Host "Enter DC name please: "
$dcExtension = Read-Host "Enter the exension type of DC, EX. com, org, io etc"


#Enter OU name and search for it
#looping

Try{
    
$sUser = Get-ADUser -Filter * -SearchBase "OU=$readOU,DC=$dcName,DC=$dcExtension" -ErrorAction Stop    
}
Catch
{
    Write-Host "*************** ***** ***** ***** ***"
    Write-Host "*************** ***** ***** ***** ***"
    Write-Host "*************** ***** ***** ***** ***"
    Write-Host "*************** ***** ***** ***** ***"
    Write-Host "*************** ***** ***** ***** ***"
    Write-Host "***OU Name is NOT Identified/ GET GOOD* ***"
    Write-Host "*************** ***** ***** ***** ***"
    Write-Host "*************** ***** ***** ***** ***"
    Write-Host "*************** ***** ***** ***** ***"
}

Write-Host $sUser.Count "Users are found"

Try
{

    if($sUser.count -gt 0)
    {
        $Dep = Read-Host "Enter Department Name Here: " 
        $Dep=$Dep.Trim()
        if($Dep -eq "")
        {
            Write-Host "****************"
            Write-Host "****************"
            Write-Host "*****Department name cannot be null***"
            Write-Host "****************"
            Write-Host "****************"
        }
    
            forEach ($user in $sUser)
            {
            Set-ADUser $user -Department $Dep
            $i++
            }
        Write-Host "*********###*#*#*#**#*#*#*#*#*#*#*"
        Write-Host "Script Executed"
        Write-Host "*********###*#*#*#**#*#*#*#*#*#*#*"

    }

}
catch
{
Write-Host "****** ***** **** *** ***"
Write-Host "******* ***** *** *****"
Write-Host "***** *** **** *** *** **"
Write-Host "Department Search Failed Fix the issue"
Write-Host "****** ***** **** *** ***"
Write-Host "******* ***** *** *****"
Write-Host "***** *** **** *** *** **"
}


write-host $i "Users are processed"

