#-----------------------------------------------------------------------------------------------#
# Author:           Petru GIURCA
# Email:            petru.giurca@consultant.lego.com
# Description:      Rotate AWS IAM Key on LEGOID-DEV
# Prerequisites:    Parse the following parameters:
#                                           - AccessKeyId (for AWS_DEPLOY.DEV)
#                                           - SecretAccessKey (for AWS_DEPLOY.DEV)
#                                           - Default Region (i.e., Ireland/eu-west-1)
#                                           - IAM Username (i.e., DeployCloudformationAndFiles)
#-----------------------------------------------------------------------------------------------#


Write-Host "`n"
Write-Host "********************************" -ForegroundColor Cyan
Write-Host "*      Rotate AWS IAM Key      *" -ForegroundColor Cyan
Write-Host "********************************" -ForegroundColor Cyan
Write-Host "`n"

Function saveAWSCredentials {
    #Saves AWS credentials to persistent store (-StoreAs)
    Set-AWSCredential -AccessKey XXXXXXXX -SecretKey XXXXXXXX -StoreAs DeployCloudformationAndFilesDEV
}

Function setDefaultAWSRegion {
    #Sets a default AWS region
    Get-AWSRegion
    Set-DefaultAWSRegion -Region eu-west-1 
    Get-DefaultAWSRegion
}

Function listUsers {
    #Calls the AWS Identity and Access Management ListUsers
    Get-IAMUserList -StoredCredentials DeployCloudformationAndFilesDEV
}

Function listUserAccessKey {
    #Calls the AWS Identity and Access Management ListAccessKeys
    Get-IAMAccessKey -UserName "DeployCloudformationAndFiles" -StoredCredentials DeployCloudformationAndFilesDEV
}

Function changeIAMAccessKeyStatus {
    #Calls the AWS Identity and Access Management UpdateAccessKey
    Update-IAMAccessKey -UserName "DeployCloudformationAndFiles" -AccessKeyId XXXXXXXX -Status Inactive
}


Function removeOldIAMAccessKey {
    #Calls the AWS Identity and Access Management DeleteAccessKey
    Remove-IAMAccessKey -AccessKeyId XXXXXXXX -UserName "DeployCloudformationAndFiles" -Force
}

Function newIAMAccessKey {
    #Calls the AWS Identity and Access Management NewAccessKey
    New-IAMAccessKey -UserName "DeployCloudformationAndFiles" -StoredCredentials DeployCloudformationAndFilesDEV
}

Function quit {
    #Exit
    exit
}

do {
    Write-Host "Trigger IAM User Key details :

    1. Saves AWS credentials to persistent store (-StoreAs)
    2. Sets a Default AWS region
    3. Calls the AWS Identity and Access Management ListUsers
    4. Calls the AWS Identity and Access Management ListAccessKeys
    5. Calls the AWS Identity and Access Management UpdateAccessKey
    6. Calls the AWS Identity and Access Management DeleteAccessKey
    7. Calls the AWS Identity and Access Management NewAccessKey
    q. Quit" -Foreground Magenta
    
} until ($Selection -eq 'q')


Write-Host "`n `n"
Write-Host "****************************************************************************************************************" -ForegroundColor Green
Write-Host "***         PLEASE PROCEED EXACTLY THE SAME WAY WITH THE LEGOID-QA and LEGOID-OPS-PROD environments!!!       ***" -ForegroundColor Green
Write-Host "****************************************************************************************************************" -ForegroundColor Green
Write-Host "`n `n"
