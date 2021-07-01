$RootPath = "O:\";
$TemplatePathACL = "'O:\System\System'";

$ACLList = @(
    Get-ChildItem -Path $RootPath -Recurse -Directory -Force -ErrorAction SilentlyContinue | Select-Object FullName | Where-Object {$_.FullName -like '*\DATA'-or $_.FullName -like '*\LOG' -and $_.FullName -notlike '*\MSSQL\DATA' -and $_.FullName -notlike '*\MSSQL\LOG'} 
)

foreach ($ACLValue in $ACLList) {
    Write-Host ('Get-Acl -Path ' + $TemplatePathACL + ' | ' + 'Set-Acl -Path ' + "'" + ($ACLValue).FullName + "'")
}
