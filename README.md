## AWS-Rotate-IAM-Keys

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=petrugiurca_automatically-rotate-iam-keys&metric=alert_status&token=878e10f29c28fc0b2b0ce079f2bae686866d5b53)](https://sonarcloud.io/summary/new_code?id=petrugiurca_automatically-rotate-iam-keys)

Rotate our IAM Keys to be in compliance with security best practices. AWS talks about rotating our keys every 30, 45, or 90 days. 

## Features

AWS Rotate IAM Keys is simple and powerful. There aren't too many features other than rotating keys for a single profile or multiple profiles. The power comes from scheduling daily jobs to rotate your access keys automatically.

## Caveats

AWS Rotate IAM Keys is designed to work with a single computer. Rotating keys on a desktop and a laptop for the same IAM user will lead to invalid keys. 

AWS Rotate IAM Keys also assumes you only have 1 access key at a time. This is normal practice for IAM users. The maximum number of keys is 2, and you need to be able to create a new key when rotating our access keys.

## Installation

AWS Rotate IAM Keys is supported by all major platforms.

### Windows

Download the executable PowerShell [script](https://github.com/petrugiurca/automatically-rotate-iam-keys/blob/main/rotate-aws-iam-keys.ps1). Simply place this in any directory and then run it. 
Please, parse all needed parameters into the PowerShell script before calling it.
