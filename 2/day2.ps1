$data = @()
$array = ,@()
$c = 0

Get-Content("C:\Users\alex.dubeau\aoc\2\input.txt") | ForEach-Object {$data += $_ -split "`n";}

foreach ($l in $data) {
      $temp = @()
      foreach ($n in ($l -split "`n")) {
          $row = $l -split '\s+' | ForEach-Object { [int]$_ }
          $temp += @($row)
      }
      $array += ,@($temp)
  }

foreach ($line in $array){
  $ascending = $null
  $safe = $true
  foreach ($i in 0..$($line.Count -2)){
      $dif = $line[$i + 1] - $line[$i]
      if ($ascending -eq $null){
            if ($dif -gt 0){$ascending = $true}
            elseif ($dif -lt 0){$ascending = $false}
            else {$safe = $false; break}
      }
      if ($ascending -and ($dif -lt 1 -or $dif -gt 3)) {$safe = $false; break}
      if (-not $ascending -and ($dif -gt -1 -or $dif -lt -3)) {$safe = $false; break}
  }
  if ($safe) { $c += 1}
}
$c
