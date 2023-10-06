# count all .cs from C:\Users\xiaoyuz\source\repos\mlnet_samples\output\MachineLearning\docs\samples\Microsoft.ML.Samples\Dynamic

$rootPath = "C:\Users\xiaoyuz\source\repos\mlnet_samples\output\MachineLearning\docs\samples\Microsoft.ML.Samples\Dynamic"
$csFiles = Get-ChildItem -Path $rootPath -Recurse -Filter *.cs
$csFiles.Count