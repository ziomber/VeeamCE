# Skrypt: veeam_job_status.ps1

param (
    [string]$JobName
)

$WarningPreference = "SilentlyContinue"

#Add-PSSnapin VeeamPSSnapIn

$job = Get-VBRJob | Where-Object {$_.Name -eq $JobName}
$session = $job.FindLastSession()

# Status:
# Success = 0
# Warning = 1
# Failed = 2
switch ($session.Result.ToString()) {
    "Success" { Write-Output 0 }
    "Warning" { Write-Output 1 }
    "Failed"  { Write-Output 2 }
    default   { Write-Output 3 }
}
