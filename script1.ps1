$items = 10, 20, 30, 40

foreach ($item in $items)
{
    if($item -eq 10) { Write-Output $item }
}

function Get-Array {
    param (
        [string[]]$ParameterName
    )

    foreach($Parameter in $ParameterName){
        $Results = Get-DataReturn -ParameterName $Parameter
    }

    [PSCustomObject]@{
        Name = $Parameter
        Age = $Results.Count
    }
}

function Get-DataReturn {
    param(
        [string[]]$ParameterName
    )

    foreach($Parameter in $ParameterName){
        $Data = "Data for Parameter"
    }

    $Data
}

Get-Array -ParameterName "Hello", "23"