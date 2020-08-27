function find_dup_char{
 
    Param(
        [string]$mystring 
    )
 
    $mytempstr = @()
    $init = 0
    $matchfound = 0
    $matchchar = ''

    foreach ($ch in $mystring.ToCharArray())
    { 
    
        if ($mystring.IndexOf($ch) -gt 0)
        {

            if ($mytempstr -clike $ch)
            {
                $matchfound = 1
                $matchchar = $ch
                break
            }
            $mytempstr += $ch
        
        } 
        else
        {
            if (($init) -and ($mytempstr -clike $ch))
            {
                $matchfound = 1
                $matchchar = $ch
                break
             
            }
            $mytempstr += $ch
            $init = 1
        }
    }
    if ($matchfound)
    {
        return $ch
    }
    else
    {
        return 
    }
 
}

#loop to get valid input..

do
{
    $mystring = Read-Host "Input alphanumeric string and press enter"
}while ($mystring -notmatch '^[a-zA-Z0-9]+$')




$fch = find_dup_char ($mystring)

if ($fch)
{
     Write-Host "The first duplicate character in the input string is: " $fch
}
else
{
    Write-Host "The input string does not have duplicate characters"
}

