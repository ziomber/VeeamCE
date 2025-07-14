# Skrypt: veeam_discovery.ps1

$WarningPreference = "SilentlyContinue"

#Add-PSSnapin VeeamPSSnapIn

# Pobierz wszystkie jobs
$jobs = Get-VBRJob | Where-Object { $_.IsScheduleEnabled -eq $true }
#$jobs = Get-VBRComputerBackupJob

# Stwórz JSON w formacie Zabbix LLD
$lld = @{
    data = @()
}

foreach ($job in $jobs) {
    $item = @{
        "{#JOBNAME}" = $job.Name
    }
    $lld.data += $item
}

$lld | ConvertTo-Json -Compress
