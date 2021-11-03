#------------------------------------------------------------------------------------#
# Author:           Petru GIURCA
# Email:            petru.giurca@consultant.lego.com
# Description:      Create a Menu list which can trigger infos about IAM User Key
# Prerequisites:    Parse the following parameters:
#                                           - AccessKeyId 
#                                           - SecretAccessKey
#                                           - Default Region
#                                           - IAM Username
#------------------------------------------------------------------------------------#


Write-Host "`n"
Write-Host "********************************" -ForegroundColor Cyan
Write-Host "* Trigger IAM User Key details *" -ForegroundColor Cyan
Write-Host "********************************" -ForegroundColor Cyan
Write-Host "`n"

Function saveAWSCredentials {
    #Saves AWS credentials to persistent store (-StoreAs)
	Set-AWSCredential -AccessKey XXXXXXXX -SecretKey XXXXXXXX -StoreAs myCredentials
}

Function setDefaultAWSRegion {
    #Sets a default AWS region
	Set-DefaultAWSRegion -Region XXXXXXXX
}

Function listUsers {
    #Calls the AWS Identity and Access Management ListUsers
	Get-IAMUserList
}

Function listUserAccessKey {
    #Calls the AWS Identity and Access Management ListAccessKeys
	Get-IAMAccessKey -UserName "XXXXXXXX"
}



Function changeIAMAccessKeyStatus {
    #Calls the AWS Identity and Access Management UpdateAccessKey
	Update-IAMAccessKey -UserName "XXXXXXXX" -AccessKeyId XXXXXXXX -Status Inactive
}


Function removeOldIAMAccessKey {
    #Calls the AWS Identity and Access Management DeleteAccessKey
	Remove-IAMAccessKey -AccessKeyId XXXXXXXX -UserName "XXXXXXXX" -Force
}

Function quit {
    #Exit
	exit
}

do {
    Write-Host "Trigger IAM User Key details :

    1. Saves AWS credentials to persistent store (-StoreAs)
    2. Sets a default AWS region
    3. Calls the AWS Identity and Access Management ListUsers
    4. Calls the AWS Identity and Access Management ListAccessKeys
    5. Calls the AWS Identity and Access Management UpdateAccessKey
    6. Calls the AWS Identity and Access Management DeleteAccessKey
    q. Quit" -Foreground Magenta

    Write-Host "`n"

    While (($Selection = Read-Host -Prompt 'Please select an option') -notin 1,2,3,4,5,6,'q') 
    { 
        Write-Warning "$Selection is not a valid option" -Foreground Red
    } 

    Switch ($Selection) {
        1 { saveAWSCredentials }
        2 { setDefaultAWSRegion }
        3 { listUsers }
        4 { listUserAccessKey }
        5 { changeIAMAccessKeyStatus }
        6 { removeOldIAMAccessKey }
        q { quit }
    }
} until ($Selection -eq 'q')
