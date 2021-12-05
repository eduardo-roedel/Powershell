#https://eduardoroedel.medium.com/powershell-renomeio-de-pastas-em-diret%C3%B3rio-na-rede-c19c74aea28e

$RootPath = "FileSystem::\\<IP ou Hostname>\<diretorio>\Monthly\<Nome Server ou AG cluster>";  
$DateBackup = Get-Date -Format 'yyyyMMdd';
$FolderToRename = 'FULL_COPY_ONLY';

$PathFolderList = @(Get-ChildItem -Path $RootPath -Recurse -Force | Where-Object {$_.Name -like "*$FolderToRename"} | SELECT -ExpandProperty FullName)
    
    foreach ($PathFolder in $PathFolderList) {
           
        $parameters = @{
            Path = "FileSystem::$PathFolder"
            NewName = $DateBackup
        }
    
        Rename-Item @parameters
    }