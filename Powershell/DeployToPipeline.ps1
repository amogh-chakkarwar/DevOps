#if ((Get-AWSCredentials) -eq $null)
#{
#    throw "You must set credentials via Set-AWSCredentials before running this cmdlet."
#}

#if ((Get-DefaultAWSRegion) -eq $null)
#{
#    throw "You must set a region via Set-DefaultAWSRegion before running this cmdlet."
#}



Param(
    # The EC2 key pair assigned to all instances launched.
    [Parameter(mandatory=$true)]
    [string]
    $Key,

    # The instance type for the stage you want
    [Parameter(mandatory=$true)]
    [string]
    $file   
)



function _deployRepository()
{    
   

$bucketName="amoghdata351256"

    $sourcefile=Read-S3Object $bucketName -key $key -file $file
    Write-Host 'source file ' $sourcefile
    #$pipelineSourceConfig = (Get-CPPipeline TheronsTestNetCoreApp).Stages[0].Actions[0].Configuration
    #$bucketName = $pipelineSourceConfig["S3Bucket"]
    #3$s3Key = $pipelineSourceConfig["S3ObjectKey"]
     Write-Host 'Zipping Repository'
    Add-Type -assembly "system.io.compression.filesystem"
    $destination = [System.io.Path]::Combine([System.io.Path]::GetTempPath(),  'example_app.zip')
Write-Host 'destination  ' $destination
    If (Test-Path $destination)
    {
   Remove-Item $destination
    }
    
Write-Host 'PSScriptRoot is ' $PSScriptRoot
    
    Write-Host 'Zipping up repository for initial deployment in pipeline'
    [io.compression.zipfile]::CreateFromDirectory($PSScriptRoot, $destination)
     

    Write-Host 'Writing zip to S3 ' $bucketName
    Write-S3Object -BucketName $bucketName -File $destination -Key $key

    $bucketName
}


_deployRepository
