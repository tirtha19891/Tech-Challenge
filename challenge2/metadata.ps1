Invoke-RestMethod -Headers @{Metadata=true} -Method GET -NoProxy -Uri http169.254.169.254metadatainstanceapi-version=2021-02-01  ConvertTo-Json -Depth 64 | Out-File "output.json"