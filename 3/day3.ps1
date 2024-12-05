$a = Select-String -Path C:\Users\alex.dubeau\aoc\3\input.txt -pattern "mul\((\d+),(\d+)\)" -AllMatches
foreach ($match in $a.matches){ $r+= ([int]$match.groups[1].value * [int]$match.groups[2].value) }
$r
