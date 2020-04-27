<#
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

#>

# find all the multiples of 3 and  5 under 1000 and add them up
function test {
    param (

        [Parameter(Mandatory=$true)][int] $FirstNum,
        [Parameter(Mandatory=$true)][int] $SecondNum,
        [Parameter()][switch] $NoDuplicates
    )

    # initialize variables
    $mOfFirst = 0
    $mOfSecond = 0
    $lessThanValue = 1000
    $firstSum = @()
    $secondSum = @()
    $total = @()
    $final = 0
    $i = 1

    # find all the multiples of 1st number and 2nd number
    # multiples of 1st number or multiples of 2nd number is less than 1000
    while (($mOfFirst -lt $lessThanValue) -or ($mOfSecond -lt $lessThanValue))
    {    
        # multiples of 1st and 2nd number
        $mOfFirst = $FirstNum * $i
        $mOfSecond = $SecondNum * $i

        # multiples of 1st num is less than 1000
        if($mOfFirst -lt $lessThanValue)
        {
            $firstSum += $mOfFirst
        }

        # multiples of 2nd num is less than 1000
        if ($mOfSecond -lt $lessThanValue)
        {
            $secondSum += $mOfSecond
        }

        $i++
    }

    if ($NoDuplicates) # no duplicates
    {
        $total = $firstSum + $secondSum | select -Unique
    }
    else
    {
        $total = $firstSum + $secondSum
    }

    # sum up the numbers in the $total array
    foreach ($num in $total)
    {
        $final += $num
    }
    return $final
}
