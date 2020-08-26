


$mystring = Read-Host "Input string and press enter"

#[ValidatePattern('[a-zA-Z0-9]')]$mystring

$mytempstr = ''

$init = 0

$matchfound = 0
$matchchar = ''

foreach ($ch in $mystring.ToCharArray())
{ 
    
    if ($mystring.IndexOf($ch) -gt 0)
    {

        if ($mytempstr -match $ch)
        {
           $matchfound = 1
           $matchchar = $ch
           break
        }
        $mytempstr += $ch
        
    } 
    else
    {
         #if (($mytempstr.Lenght) -gt 0) //has a bug....
         if ($init)
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
     Write-Host "There was a duplicate character in the input string " $matchchar
}
else
{
    Write-Host "The input string does not have duplicate characters"
}