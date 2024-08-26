$inputids = @(1,2,3,4,5) ;

$finaldata = @();

foreach( $node in $inputids ){

    Write-Host $node
    Write-Host '---------------'

    $obj = [PSCustomObject]@{ 
        id = $node.ToString()
        datasourcetype = "test"
        datasourceId = "testId#"
    }

    $finaldata += $obj
    $obj = @();
}

$finaldata | Export-Csv -Path "C:\Users\Downloads\data.csv"
