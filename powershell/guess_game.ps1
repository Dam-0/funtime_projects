$min_age = 1
$max_age = 100

$age = (Get-Random -Minimum -min_age -Maximum -max_age)

Write-Host "$age"