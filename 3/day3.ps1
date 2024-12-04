$valid = Select-String -Path C:\Users\alex.dubeau\aoc\3\input.txt -Pattern $pattern -AllMatches | Select-String -pattern "(\d+)" -AllMatches
$a = $valid | Select-String -pattern "(\d+)" -AllMatches | ? {$_.Matches.value}
for ($i = 0; $i -lt $a.Length; $i++){
$r+= ([int]$a[$i].matches.value[0] * [int]$a[$i].Matches.value[1])}
$r
