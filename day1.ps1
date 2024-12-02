$data1=@()
$data2=@()
$dif = @()
$phase1 = 0
$phase2 = 0
Get-Content("C:\Users\alex.dubeau\aoc\1\input.txt") | ForEach-Object {$line = $_ -split '\s+'; $data1 += $line[0]; $data2 += $line[1]}

$data1 = $data1 | sort
$data2 = $data2 | sort

foreach ($i in 0..$($data1.Count -1) ){
  if ($data1[$i] -gt $data2[$i]) { $dif += $data1[$i]-$data2[$i] }
  else { $dif += $data2[$i]-$data1[$i] }
}

foreach ($n in $dif) { $phase1 += $n }

foreach ($n in $data1){
  $c = ($data2 | ? {$_ -eq $n}).count
  if ($c -gt 0){$phase2 += [decimal]::Multiply($n,$c)}}
  
$phase1
$phase2
