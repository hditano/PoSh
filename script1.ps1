$items = 10, 20, 30, 40

foreach ($item in $items)
{
    if($item -eq 10) { Write-Output $item }
}


function Get-Array {

    $Results = Get-DataReturn -ParameterName $Parameter -ParameterNumber $Number

    [PSCustomObject]@{
        Name = $Results.String
        Age = $Results.Number
    }
}

function Get-DataReturn {
    $Data = "Data for Parameter"
    $Number = 23

    $MyObject = [PSCustomObject]@{
        String = $Data
        Number = $Number
    }

   $MyObject 
}

function Get-Api {
    $Result = Invoke-RestMethod -Uri "https://api.coinpaprika.com/v1/coins/btc-bitcoin"

    foreach($item in $Result){
        $MyObject = [PSCustomObject]@{
            Name =  $item.Name
            Hash = $item.open_source
        }
    }

    $Result | Format-Table -Property name, hash_algorithm
}

function Get-Input{
  Write-Output "Hello from the Outside"
  $Result = Read-Host -Prompt "Input your name"
  Write-Output "Name is $Result"

}

Get-Api
Get-Input

