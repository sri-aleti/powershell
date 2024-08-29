$inputids = @(1,2,3,4,5) ;

$finaldata = @();

foreach( $node in $inputids ){

    Write-Host $node
    Write-Host '---------------'
    
    #this is just test object
    $responseObj = [PSCustomObject]@{
        datasourceId = 'test-'+$node.ToString()
        datasourcetype = "sql-"+$node.ToString()
    }
    
    $responseObj2 = [PSCustomObject]@{
        datasourceId = 'responseObj2 - '+$node.ToString()
        datasourcetype = "responseObj2 - "+$node.ToString()
    }
    
    #this is just test object List with above object
    $responseList = $responseObj, $responseObj2

    foreach($item in $responseList){

        $obj = [PSCustomObject]@{ 
            id = $node.ToString()
            datasourcetype = $item.datasourceId
            datasourceId = $item.datasourcetype
        }
    
        $finaldata += $obj
    }
    
    $obj = @();
    $responseObj = @();
    $responseObj2 = @();

    $responseList= @();
}

$finaldata | Export-Csv -Path "C:\Users\saleti\Downloads\data.csv"
