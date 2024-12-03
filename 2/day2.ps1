
$data = @()
$array = ,@()

Get-Content("C:\Users\alex.dubeau\aoc\2\input.txt") | ForEach-Object {$data += $_ -split "`n";}

foreach ($l in $data) {
      $temp = @()
      foreach ($n in ($l -split "`n")) {
          # Split the line into numbers and convert to integers
          $row = $l -split '\s+' | ForEach-Object { [int]$_ }
          $temp += @($row)
      }
      $array += ,@($temp)
  }

$c = 0
foreach ($line in $array){
  $ascending = 0
  foreach ($i in 0..$($line.Count -2)){
    if ($line[$i] -gt $line[$i+1]){$ascending = 1}
    elseif ($line[$i] -lt $line[$i+1]){$ascending = 0}
    else {break}
    if ($ascending -eq 1 -and $line[$i] -lt $line[$i+1] -or ($line[$i + 1] - $line[$i]) -gt 2 -or ($line[$i + 1] - $line[$i]) -lt 0) {break}
    else {$c += 1}
    if ($ascending -eq 0 -and $line[$i] -gt $line[$i+1] -or ($line[$i] - $line[$i + 1]) -gt 2 -or ($line[$i] - $line[$i + 1]) -lt 0) {break}
    else {$c += 1}
  }
}
$c
