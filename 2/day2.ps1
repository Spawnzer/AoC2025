$data = @()
$array = ,@()
$c = 0

Get-Content("C:\Users\alex.dubeau\aoc\2\input.txt") | ForEach-Object {$data += $_ -split "`n";}

foreach ($l in $data) {
      $temp = @()
      foreach ($n in $l) {
          $row = $l -split '\s+' | ForEach-Object { [int]$_ }
          $temp += @($row)
      }
      $array += ,@($temp)
  }

foreach ($line in $array){
  $ascending = $null
  $safe = $true
  $unsafe = 0
  foreach ($i in 0..$($line.Count -1)){
      $dif = $line[$i + 1] - $line[$i]
      if ($ascending -eq $null){
            if ($dif -gt 0){$ascending = $true}
            elseif ($dif -lt 0){$ascending = $false}
            else {$unsafe++}
      }
      if ($ascending -and ($dif -lt 1 -or $dif -gt 3)) {$unsafe++}
      if (-not $ascending -and ($dif -gt -1 -or $dif -lt -3)) {$unsafe++}
      if ($unsafe -gt 1){ $safe = $false; break}
  }
  if ($safe) { $c += 1}
}
$c
