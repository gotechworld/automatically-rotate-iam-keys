## AWS-Rotate-IAM-Keys

Rotate our IAM Keys to be in compliance with security best practices. AWS talks about rotating our keys every 30, 45, or 90 days. 

## Features

AWS Rotate IAM Keys is simple and powerful. There aren't too many features other than rotating keys for a single profile or multiple profiles. The power comes from scheduling daily jobs to rotate your access keys automatically.

## Caveats

AWS Rotate IAM Keys is designed to work with a single computer. Rotating keys on a desktop and a laptop for the same IAM user will lead to invalid keys. 

AWS Rotate IAM Keys also assumes you only have 1 access key at a time. This is normal practice for IAM users. The maximum number of keys is 2, and you need to be able to create a new key when rotating our access keys.

## Installation

AWS Rotate IAM Keys is supported by all major platforms.

### Windows

Download the executable PowerShell script. Simply place this in any directory and then run it. It will install the Scheduled Task to rotate your keys nightly upon the first run and will rotate your keys on each run thereafter.

AWS Rotate IAM Keys is set up to automatically schedule a task for you upon the first run. If you want to edit the profiles that are being updated, you need to modify the task using [Task Scheduler](https://docs.microsoft.com/en-us/windows/win32/taskschd/task-scheduler-start-page).

Modify the `-profile` parameter from `default` to a comma-separated list of your profile names.

If you move the .ps1 script from the initial location where you first ran it, you will need to modify the path in the task to point to the correct script location.


In addition to the PowerShell script, I have been creating a `Menu list` PowerShell script to trigger info's about a specific IAM User Key.

Please, parse all needed parameters into the PowerShell script before calling it. 
