# Problem statement
  

We need to write code that will query the **meta data** of an instance within **AWS/Azure/GCP** and provide a JSON formatted output. The choice of language and implementation is up to you.

   

Refer to the documentation of the respective public cloud providers.
I've referred to the below URL for this answer
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/instance-metadata-service?tabs=windows

   

>The IMDS service of Azure or other cloud providers are simple rest API's and can be implemented in wide range of programming languages. I have chosen Powershell scripting as I've good experience in that.


# Approach

 Querying data from Azure VM parameters can be very easy. You can use PowerShell, AZ CLI, Rest API or the Portal to get information about a virtual machine. But what if you need this information from inside the VM?

There some solutions like installing the AZ PowerShell module and set up a system assigned managed identity to the VM to perform some query on Azure about itself, it works, but it’s inefficient and a bit dangerous. System assigned managed identity should be used only in scenarios where it is needed (access to a database or management tasks).

There is a better way. Every major cloud provider manages a metadata service you can use to retrieve information from the VM instance where the query was made.

For Azure VM you can use Metadata services by using a special unroutable IP address, 169.254.169.254. This IP only works in Azure and it works, even if the VM doesn't have Internet access.

Azure instance Metadata service is based on a restful API. It can be consumed by using an HTTP request 


In **Azure** it is easy to retrieve meta data information. On a linux terminal
>curl -H Metadata:true --noproxy "*"  "http://169.254.169.254/metadata/instance?api-version=2020-09-01"

Would give the JSON output of metadata

on a windows terminal, I'm using PowerShell script to get the JSON output

Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -NoProxy -Uri "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | ConvertTo-Json -Depth 64


# Testing

I'm using powershell IDE to test the script and check the output 

# Bonus Points

  The code allows for a particular data key to be retrieved individually using '.' object notation
  example: To get the public IP

  (Invoke-RestMethod -Headers @{"Metadata"="true"} -URI http://169.254.169.254/metadata/instance?api-version=2018-10-01 -Method get).network.interface.ipv4.ipaddress.publicipaddress
  
  Output
  >> 137.117.84.156
 

# Prerequisites

Create a windows VM on Azure

RDP into the instance

# Installation

Powershell should be pre installed on windows VMs, just copy the script and execute it

# Running

Either you can run it from the Powershell IDE, or, you can run the .ps1 file using below command

Go to the directory containing the script
open a command prompt
powershell.exe -ep bypass metadata.ps1

It will generate a Json file in the same directory as output.json
