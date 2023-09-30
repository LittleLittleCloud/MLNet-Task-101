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
    $name = $notebook.Name
    $outputPath = "$outputFolder\$name"
    $notebookFolder = Split-Path -Parent $notebook
    Set-Location $notebookFolder
    $result = dotnet repl --run $notebook --exit-after-run --output-path $outputPath --working-dir $outputFolder
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to run $notebook"
        $failNotebooks += $notebook
        $exitCode = 1
    }

    Write-Host "Finished running $notebook"
    Write-Host "Saving output to $notebook"
}

Write-Host "Failed notebooks:"
foreach ($notebook in $failNotebooks) {
    Write-Host $notebook
}

exit $exitCode