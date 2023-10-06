# cd to the directory of this script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$rootPath = Split-Path -Parent $scriptPath
$outputFolder = "$rootPath/output"
if (Test-Path $outputFolder) {
    Remove-Item $outputFolder -Recurse -Force
}
New-Item -ItemType Directory -Path $outputFolder

Set-Location $rootPath

# list all newly added notebooks by comparing with the main branch
$mainBranch = "main"
$notebooks = git diff --name-only $mainBranch | Where-Object { $_ -like "*.ipynb" }
# list all notebooks and print out
foreach ($notebook in $notebooks) {
    Write-Host $notebook
}

# for each notebook, run it using dotnet perl. Check the exit code and print out the result
# if the exit code is not 0, exit the script with exit code 1
$failNotebooks = @()
$exitCode = 0
foreach ($notebook in $notebooks) {
    Write-Host "Running $notebook"
    # get notebook name with extension
    $name = Split-Path -Leaf $notebook
    Write-Host "Name: $name"
    $notebookFolder = Split-Path -Parent $notebook
    $outputPath = "$outputFolder\$notebookFolder"
    Set-Location $notebookFolder
    $result = dotnet repl --run $name --exit-after-run
    Write-Host $result
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to run $notebook"
        $failNotebooks += $notebook
        $exitCode = 1
    }
    else{
        Write-Host "Successfully ran $notebook"
    }
    Set-Location $rootPath
}

Write-Host "Failed notebooks:"
foreach ($notebook in $failNotebooks) {
    Write-Host $notebook
}

exit $exitCode