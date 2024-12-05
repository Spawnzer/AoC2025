$a = Select-String -Path C:\Users\alex.dubeau\aoc\3\input.txt -pattern "mul\((\d+),(\d+)\)" -AllMatches
foreach ($match in $a.matches){ $r+= ([int]$match.groups[1].value * [int]$match.groups[2].value) }
$r

$r = @()
$res = 0
$a = get-content -Path C:\Users\alex.dubeau\aoc\3\input.txt 
$str = $a -split '(?=do)'

foreach ($s in $str){
  if ($s.StartsWith('don')){}
  else {$r += $s | Select-String  -Pattern "mul\((\d+),(\d+)\)" -AllMatches}
}
foreach ($match in $r.matches){ $res+= ([int]$match.groups[1].value * [int]$match.groups[2].value) }
$res
