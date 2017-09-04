$ErrorActionPreference = 'Stop'

$scriptPath = $MyInvocation.MyCommand.Path
$scriptsHome = Split-Path $scriptPath
$restDocsPath = Split-Path $scriptsHome

Push-Location $scriptsHome

$RestSrcPath = Join-Path $restDocsPath "src"
$RestProcessorZip = "RestProcessor.zip"
$RestProcessor = "RestProcessor"
$MappingFilePath = "mapping.json"

# Unzip RestProcessorZip to RestProcessor
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}
if (Test-Path $RestProcessor){
    Remove-Item $RestProcessor -recurse -Force
}

# Download RestProcessorArtifacts
Write-Host "Downloading RestProcessorArtifacts"
$RestProcessorArtifactsSource = "https://ci.appveyor.com/api/projects/VisualStudioChinaAppVeyorUsers/restprocessor/artifacts/RestProcessor/bin/RestProcessorArtifacts.zip?branch=ms-examples"
$RestProcessorArtifactsDestination = Join-Path $scriptsHome $RestProcessorZip
Invoke-WebRequest $RestProcessorArtifactsSource -OutFile $RestProcessorArtifactsDestination -Headers @{ "Authorization" = "Bearer $env:appveyor_api_token" }
Unzip $RestProcessorArtifactsDestination $scriptsHome\$RestProcessor

# Running RestProcessor step 1: add mapping for x-ms-examples
Write-Host "Running RestProcessor step 1: mapping for x-ms-examples"
& $RestProcessor\$RestProcessor.exe $RestSrcPath $restDocsPath $restDocsPath\$MappingFilePath true
if($LASTEXITCODE -ne 0)
{
    Pop-Location
    exit 1
}

# Pre-resolve swagger files by AutoRest
Write-Host "Pre-resolve swagger files by AutoRest"
$mappingFile = Get-Content $restDocsPath\$MappingFilePath -Raw | ConvertFrom-Json
Foreach($reference in $mappingFile.mapping.reference)
{
    Write-Host "Resolving old mapping file by autorest"
    if ($reference.source_swagger)
    {
        $swaggerPath = Join-Path $RestSrcPath $reference.source_swagger
        if (Test-Path $swaggerPath)
        {
            oav generate-wireformat $swaggerPath -y
            autorest -FANCY -g SwaggerResolver -i $swaggerPath -outputFileName $swaggerPath
            Write-Host "Done resolving swagger file by AutoRest and oav" $swaggerPath
        }
    }
}
Foreach($org in $mappingFile.organizations)
{
    Write-Host "Resolving new mapping file by autorest"
    if($org.services)
    {
        Foreach($service in $org.services)
        {
            if ($service.swagger_files)
            {
                Foreach($swagger_file in $service.swagger_files)
                {
                    $swaggerPath = Join-Path $RestSrcPath $swagger_file.source
                    if (Test-Path $swaggerPath)
                    {
                        Write-Host "Start resolving swagger file by oav and AutoRest" $swaggerPath
                        oav generate-wireformat $swaggerPath -y
                        autorest -FANCY -g SwaggerResolver -i $swaggerPath -outputFileName $swaggerPath
                        if ($LASTEXITCODE -ne 0) {
                            Write-Host "Error when resolving " $swaggerPath
                        }
                        Write-Host "Done resolving swagger file by oav and AutoRest" $swaggerPath
                    }
                }
            }
        }
    }
}

# Running RestProcessor step 2: processing core
Write-Host "Running RestProcessor step 2: processing core"
& $RestProcessor\$RestProcessor.exe $RestSrcPath $restDocsPath $restDocsPath\$MappingFilePath
if($LASTEXITCODE -ne 0)
{
    Pop-Location
    exit 1
}

# Clean unzipped folder and zip
Remove-Item $RestProcessor -recurse -Force
Remove-Item $RestProcessorArtifactsDestination
if (Test-Path $RestSrcPath){
    Remove-Item $RestSrcPath -recurse -Force
}

Pop-Location

